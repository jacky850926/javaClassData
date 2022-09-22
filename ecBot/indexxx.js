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
            // sendCards(body, res);
            sendSingleCards(body, res);
        }
    );

});

function sendSingleCards(body, res) {
    console.log('[sendCards] In');
    var thisFulfillmentMessages = [];
    var stickerObject = {
        payload: {
            line: {
                "type": "sticker",
                "packageId": "446",
                "stickerId": "1988"
            }
        }
    };
    thisFulfillmentMessages.push(stickerObject);

    var videoObject = {
        payload: {
            line: {
                "type": "video",
                "originalContentUrl": "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
                "previewImageUrl": "https://i.ibb.co/55jkrDK/bbb-splash.png",
                "trackingId": "12345"
            }
        }
    };

    thisFulfillmentMessages.push(videoObject);

    var thisLineObject = {



        payload: {
            line: {
                type: "template",
                altText: "this is a carousel template",
                template: {
                    type: "carousel",
                    columns: []
                }
            }
        }
    };

    for (var x = 0; x < body.recordset.length; x++) {
        var thisObject = {};
        thisObject.thumbnailImageUrl = body.recordset[x].Photo;
        thisObject.imageBackgroundColor = "#FFFFFF";
        thisObject.title = body.recordset[x].Name;
        thisObject.text = body.recordset[x].Category;
        thisObject.defaultAction = {};
        thisObject.defaultAction.type = "uri";
        thisObject.defaultAction.label = "view detail";
        thisObject.defaultAction.uri = body.recordset[x].Photo;
        thisObject.actions = [];
        var thisActionObject = {};
        thisActionObject.type = "uri";
        thisActionObject.label = "view detail";
        thisActionObject.uri = body.recordset[x].Photo;
        thisObject.actions.push(thisActionObject);
        thisLineObject.payload.line.template.columns.push(thisObject);
    }

    thisFulfillmentMessages.push(thisLineObject);
    var responseObject = {
        fulfillmentMessages: thisFulfillmentMessages
    };
    res.json(responseObject);
}

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