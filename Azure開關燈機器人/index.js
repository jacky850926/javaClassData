'use strict';
const
    config = require('config'),
    exrpess = require('express'),
    axios = require('axios');

var app = exrpess();
var port = process.env.PORT || process.env.port || 5000;
app.set('port', port);
app.use(exrpess.json());
app.listen(app.get('port'), function () {
    console.log('[app.listen] Node app is running on port', app.get('port'));
});

module.exports = app;

app.post('/webhook', function (req, res) {
    //拿到電燈狀態 & 通關密語
    let data = req.body;
    let lightStatus = data.queryResult.parameters["lightstatus"];
    let passWord = data.queryResult.parameters["Password"];
    //Password Confirm
    if (passWord == config.get("Password")) {
        //更新電燈狀態
        let updateData = {
            id: 1,
            lightName: "main",
            lightSwitch: lightStatus
        };
        let axios_update_data = {
            method: "put",
            url: "http://localhost:3000/devices/1",
            headers: {
                "content-type": "application/json"
            },
            data: updateData
        };
        axios(axios_update_data)
            .then(function (response) {
                console.log(JSON.stringify(response.data));
                res.json({ fulfillmentText: "更新完成" });
            })
            .catch(function (error) {
                console.log(error);
            });
    } else {
        res.json({ fulfillmentText: "密碼錯誤，更新失敗" });
    }
});