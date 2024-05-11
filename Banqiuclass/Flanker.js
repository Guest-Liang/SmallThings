javascript:
document.addEventListener('keydown', function(event) {
    var now = new Date();
    console.log(now + ' 按下的键是: ' + event.key); // 输出当前时间和按下的键

    var nowimg = document.getElementById("imgId");
    var nowanswer = nowimg.src;
    var fileName = nowanswer.split('/').pop(); 
    var nameWithoutExtension = fileName.split('.')[0]; // 去掉扩展名
    var lastChar = nameWithoutExtension.slice(-1); // 获取文件名的最后一个字符
    console.log("按这个键"+lastChar);
});