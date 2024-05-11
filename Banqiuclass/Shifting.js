javascript:
document.addEventListener('keydown', function(event) {
    var now = new Date();
    console.log(now + ' 按下的键是: ' + event.key); // 输出当前时间和按下的键

    var nowimg = document.getElementById("imgId");
    var nowanswer = nowimg.src;
    var fileName = nowanswer.split('/').pop(); 
    var nameWithoutExtension = fileName.split('.')[0]; // 去掉扩展名
    var firstChar = nameWithoutExtension.slice(0, 1); // 获取文件名的第一个字符
    var lastChar = nameWithoutExtension.slice(-1); // 获取文件名的最后一个字符
    if (firstChar === "h") {
        var lastCharNum = parseInt(lastChar); // 将 lastChar 转换为数字
        if (lastCharNum > 5) {
            console.log("按这个键F，因为 " + lastCharNum + " 大于 5");
        } else {
            console.log("按这个键D，因为 " + lastCharNum + " 小于 5");
        }
    } else {
        var lastCharNum = parseInt(lastChar); // 将 lastChar 转换为数字
        if (lastCharNum % 2 == 1) {
            console.log("按这个键J，因为 " + lastCharNum + " 是奇数");
        } else {
            console.log("按这个键K，因为 " + lastCharNum + " 是偶数");
        }
    }
});