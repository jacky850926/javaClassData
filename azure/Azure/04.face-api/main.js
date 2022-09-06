$(document).ready(function(){
    //do something
    $("#thisButton").click(function(){
        processImage();
    });
});

function processImage() {
    
    //確認區域與所選擇的相同或使用客製化端點網址
    var url = "https://eastus.api.cognitive.microsoft.com/";
    var uriBase = url + "face/v1.0/detect";
    
    //2022/6/21後，微軟暫時停止了性別/年齡/髮色等可能引發爭議的辨識結果
    var params = {
        "returnFaceId": "false",
        "returnFaceLandmarks": "false",
        "returnFaceAttributes": "headPose,smile,glasses,accessories,blur,exposure,noise"
    };
    //顯示分析的圖片
    var sourceImageUrl = document.getElementById("inputImage").value;
    // document.querySelector("#sourceImage").src = sourceImageUrl;
    //送出分析
    $.ajax({
        url: uriBase + "?" + $.param(params),
        // Request header
        beforeSend: function(xhrObj){
            xhrObj.setRequestHeader("Content-Type","application/json");
            xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key", subscriptionKey);
        },
        type: "POST",
        // Request body
        data: '{"url": ' + '"' + sourceImageUrl + '"}',
    })
    .done(function(data) {
        //顯示JSON內容
        $("#picDescription").empty();
        $("#responseTextArea").val(JSON.stringify(data, null, 2));
        // $("#picDescription").text("這裡有 "+data.length+" 個人");
        // $("#picDescription").text("沒戴口罩!");
        //第一圈 : 巡訪所有人
        for(let x=0;x<data.length;x++){
            let thisAccessories = data[x].faceAttributes.accessories;
            //先確認配件Array有東西
            if(thisAccessories.length>0){
                let hasMask = false;
                for(let y=0;y<thisAccessories.length;y++){
                    if(thisAccessories[y].type=="mask" && thisAccessories[y].confidence>=0.7){
                        hasMask = true;
                    }
                }
                if(hasMask){
                    $("#picDescription").append("😷");
                }else{
                    //帽子,眼鏡,口罩但AI不確定
                    $("#picDescription").append("😎");
                }
            }else{
                $("#picDescription").append("😁");
            }
        }

        var thisImage = new Image();
        thisImage.src = sourceImageUrl;
        var thisCanvasCTX = $("#myCanvas")[0].getContext("2d");
        thisImage.onload = function(){
            thisCanvasCTX.canvas.width = thisImage.width;
            thisCanvasCTX.canvas.height = thisImage.height;
            thisCanvasCTX.drawImage(thisImage, 0, 0);
            thisCanvasCTX.strokeStyle = "yellow";
            thisCanvasCTX.lineWidth = 3;
            for(var x=0; x<data.length;x++){
                var thisFaceRect = data[x].faceRectangle;
                thisCanvasCTX.strokeRect(thisFaceRect.left, thisFaceRect.top, thisFaceRect.width, thisFaceRect.height);
            }
        };
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
        //丟出錯誤訊息
        var errorString = (errorThrown === "") ? "Error. " : errorThrown + " (" + jqXHR.status + "): ";
        errorString += (jqXHR.responseText === "") ? "" : jQuery.parseJSON(jqXHR.responseText).message;
        alert(errorString);
    });
};