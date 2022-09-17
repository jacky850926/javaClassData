'use strict';
const
    config = require('config'),
    exrpess = require('express'),
    request = require('request');

var app = exrpess();
var port = process.env.PORT || process.env.port || 5000;
app.set('port', port);
app.use(exrpess.json());
app.listen(app.get('port'), function () {
    console.log('[app.listen] Node app is running on port', app.get('port'));
});

module.exports = app;

const MOVIE_API_KEY = config.get('MovieDB_API_Key');

app.post('/webhook', function (req, res) {
    //拿到電影名稱
    let data = req.body;
    let queryMovieName = data.queryResult.parameters.MovieName;
    console.log("[queryMovieName]", queryMovieName);
    //Request TMDB
    let propertiesObject = {
        query: queryMovieName,
        api_key: MOVIE_API_KEY,
        language: 'zh-TW'
    };
    request({
        uri: "https://api.themoviedb.org/3/search/movie?",
        json: true,
        qs: propertiesObject
    }, function (error, response, body) {
        if (!error && response.statusCode == 200) {
            //正常回應
            console.log("[正常回應]");
            if (body.results.length != 0) {
                //有資料
                //電影名稱(完全符合/部分符合)/簡介/海報圖片
                let thisFulfillmentMessages = [];
                let movieTitleObject = {};
                if (body.results[0].title == queryMovieName) {
                    movieTitleObject.text = { text: [body.results[0].title] };
                } else {
                    movieTitleObject.text = { text: ["系統內最相關的電影是" + body.results[0].title] };
                }
                thisFulfillmentMessages.push(movieTitleObject);
                //電影簡介
                if (body.results[0].overview) {
                    let movieOverviewObject = {};
                    movieOverviewObject.text = { text: [body.results[0].overview] };
                    thisFulfillmentMessages.push(movieOverviewObject);
                }
                //電影海報
                if (body.results[0].poster_path) {
                    let movieImageObject = {};
                    movieImageObject.image = { imageUri: "https://image.tmdb.org/t/p/original" + body.results[0].poster_path };
                    thisFulfillmentMessages.push(movieImageObject);
                }
                console.log("[thisFulfillmentMessages]", JSON.stringify(thisFulfillmentMessages));
                res.json({ fulfillmentMessages: thisFulfillmentMessages });
            } else {
                res.json({ fulfillmentText: "很抱歉，系統裡面沒有這部電影" });
            }
        } else {
            console.log("[TMDB] Failed");
        }
    });
});