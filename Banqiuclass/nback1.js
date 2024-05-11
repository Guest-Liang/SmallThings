javascript:
var lastImgName = "";

document.addEventListener('keydown', function(event) {
    var now = new Date();
    console.log(now + ' 按下的键是: ' + event.key); // 输出当前时间和按下的键

    var nowimg = document.getElementById("imgId");
    var nowanswer = nowimg.src;

    var imgName = nowanswer.split('/').pop();
    console.log(now+"|"+lastImgName+"|"+imgName);
    if (lastImgName) {
        if (lastImgName === imgName) {
            console.log(now + " 图片没有改变, 按F");
        } else {
            console.log(now + " 图片已改变, 按J");
        }
    }

    lastImgName = imgName;
});