$(function () {
    setInterval(update, 2000);
});

function update() {
    let url = "http://localhost:3000/devices/1";
    let data = $.getJSON(url)
        .done(function (msg) {
            console.log(msg);
            $("h1").text(`電燈狀態 : ${msg.lightSwitch}`);
            if (msg.lightSwitch == '開') {
                $("img").attr("src", "images/pic_bulbon.gif");
            } else {
                $("img").attr("src", "images/pic_bulboff.gif");
            }
        })
        .fail(function (msg) {
            console.log("Fail!");
        })
        .always(function (msg) {
            console.log("Complete!");
        });

}