'use strict';
const
    config = require('config'),
    exrpess = require('express'),
    mssql = require('mssql');

var app = exrpess();
var port = process.env.PORT || process.env.port || 5000;
app.set('port', port);
app.use(exrpess.json());
app.listen(app.get('port'), function () {
    console.log('[app.listen] Node app is running on port', app.get('port'));
});

module.exports = app;

// const MOVIE_API_KEY = config.get('MovieDB_API_Key');
var config_db = {
    user: config.get("user"),
    password: config.get("password"),
    database: 'ec-bot',
    server: '127.0.0.1',
    port: 1433,
    options: {
        encrypt: false,
        trustServerCertificate: true
    }
};

mssql.connect(config_db, function (err) {
    if (err) {
        console.log("Error while connecting database:-" + err);
        return;
    }
    console.log("Database is connected");
});


app.post('/webhook', function (req, res) {
    //拿到電影名稱
    let data = req.body;
    let queryCategory = data.queryResult.parameters["categorytype"];
    console.log("[queryCategory] ", queryCategory);
    //兩種查詢條件
    //1.商品類別(外套/上衣/下身/內衣)
    //2.熱門商品
    let queryFilter = "";
    if (queryCategory == "熱門") {
        queryFilter = "IsHot = 1";
    } else {
        queryFilter = `Category = '${queryCategory}'`;
    }

    mssql.query("SELECT * FROM productdb where " + queryFilter,
        function (err, body, fields) {
            if (err) throw err;
            else console.log('Selected ' + body.recordset.length + ' row(s)');
            sendCards(body, res);
        }
    );

});

function sendCards(body, res) {
    console.log("[sendCards] in");
    console.log("body", JSON.stringify(body));
    var thisFulfillmentMessages = [];
    //多筆資料用卡片的格式來呈現
    for (var x = 0; x < body.recordset.length; x++) {
        var thisObject = {};
        thisObject.card = {};
        thisObject.card.title = body.recordset[x].Name;
        thisObject.card.subtitle = body.recordset[x].Category;
        thisObject.card.imageUri = body.recordset[x].Photo;
        thisObject.card.buttons = [
            {
                text: "看大圖",
                postback: body.recordset[x].Photo
            }
        ];
        thisFulfillmentMessages.push(thisObject);
    }
    console.log("thisFulfillmentMessages", JSON.stringify(thisFulfillmentMessages));
    res.json({ fulfillmentMessages: thisFulfillmentMessages });
}