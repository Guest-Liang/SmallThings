import fetch from 'node-fetch'
import axios from 'axios'
import md5 from 'md5'
import moment from "moment"
import lodash from 'lodash'
import fs from "fs"
import YAML from 'yaml'
import puppeteer from '../../lib/puppeteer/puppeteer.js'

export class BUPTelectricity extends plugin {
    constructor() {
        super({
            name: 'BUPT宿舍电费查询',
            dsc: 'BUPT电费查询',
            event: 'message',
            priority: 10,
            rule: [
                {
                    reg: '^#电费(.*)',
                    fuc: 'ele'
                }
            ]

        })
    }

    async ele() {
        if (!this.group_id) {
            this.e.reply('请先在群内触发表情，确定添加的群')
            return
        }

        if (!this.checkAuth()) return
        if (!this.checkKeyWord()) return
        if (await this.singleAdd()) return
        /** 获取关键词 */
        this.getKeyWord()

        if (!this.keyWord) {
            this.e.reply('查询错误：没有关键词')
            return
        }

        this.setContext('addContext')

        await this.e.reply('请发送添加内容', false, { at: true })
    }

    getKeyWord() {
        this.e.isGlobal = this.e.msg.includes("全局");
    
        this.keyWord = this.e.toString()
          .trim()
          /** 过滤#添加 */
          .replace(/#|＃|电费/g, '')
          /** 过滤@ */
          .replace(new RegExp('{at:' + this.e.bot.uin + '}', 'g'), '')
          .trim()
    
        this.keyWord = this.trimAlias(this.keyWord)
        this.e.keyWord = this.keyWord
    }

    checkAuth() {
        if (this.e.isMaster) return true
    
        if (!this.e.member.is_admin) {
            this.e.reply('暂无权限，只有管理员才能操作')
            return false
        }
        return true
    }

    async addContext() {
        this.isGlobal = this.e.isGlobal || this.getContext()?.addContext?.isGlobal;
        await this.getGroupId()
        /** 关键词 */
        let keyWord = this.keyWord || this.getContext()?.addContext?.keyWord
        let addImg = this.e.addImg || this.getContext()?.addContext?.addImg
    
        /** 添加内容 */
        let message = this.e.message
    
        let retMsg = this.getRetMsg()
        this.finish('addContext')
    
        for (let i in message) {
          if (message[i].type == 'at') {
            if (message[i].qq == this.e.bot.uin) {
              this.e.reply('添加内容不能@机器人！')
              return
            }
          }
          if (message[i].type == 'file') {
            this.e.reply('添加错误：禁止添加文件')
            return
          }
        }
    
        if (message.length == 1 && message[0].type == 'image') {
          let local = await this.saveImg(message[0].url, keyWord)
          if (!local) return
          message[0].local = local
          message[0].asface = true
          if (addImg) message[0].asface = false
        }
    
        if (!textArr[this.group_id]) textArr[this.group_id] = new Map()
    
        /** 支持单个关键词添加多个 */
        let text = textArr[this.group_id].get(keyWord)
        if (text) {
          text.push(message)
          textArr[this.group_id].set(keyWord, text)
        } else {
          text = [message]
          textArr[this.group_id].set(keyWord, text)
        }
    
        if (text.length > 1 && retMsg[0].type != 'image') {
          retMsg.push(String(text.length))
        }
    
        retMsg.unshift('添加成功：')
    
        this.saveJson()
        this.e.reply(retMsg)
      }
}