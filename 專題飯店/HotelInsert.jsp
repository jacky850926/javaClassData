<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>加入飯店資料</title>

<style type="text/css">
	.box {
		width: 100px;
		height: 100px;
		border: 1px solid black;
		overflow: hidden;
		margin: 10px;
	}
	.error{
		color:red;
	}
</style>

<%@ include file="/WEB-INF/includes/CSSAndJS.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

</head>
<body>

<%@ include file="/WEB-INF/includes/SuperTop.jsp"%>
<h4 class="card-title text-primary">&nbsp;新增飯店</h4>
<p class="card-description">輸入新增的飯店內容</p>
	<div>
	    <form:form action="insertHotel" method="post" modelAttribute="hotel" enctype="multipart/form-data" class="forms-sample">
	        <div class="form-group">
		        <label>飯店名稱:</label>
		        <form:input type="text" path="name" class="form-control" name="name" id="name" placeholder="輸入景點名稱"/><br>
		        <label>地址:</label>
		        <form:input type="text" path="address" class="form-control" name="address" id="address" placeholder="輸入地址"/><br>
		        <label>類型:</label>
		        <form:input type="text" path="type" class="form-control" name="type" id="type" placeholder="飯店類型"/><br>
		        <label>介紹:</label>
		        <form:input type="text" path="intro" class="form-control" name="intro" id="intro" placeholder="介紹一下飯店..."/><br>
		        <label>國家:</label>
		        <form:input type="text" path="country" class="form-control" name="country" id="country" placeholder="飯店所屬國家"/><br>
		        <label>電話:</label>
		        <form:input type="text" path="phone" class="form-control" name="phone" id="phone" placeholder="輸入電話"/><br>
		        <label>狀態:</label>
		        <form:input type="text" path="status" class="form-control" name="status" id="status" placeholder="ex.開放中、整修中"/><br>
		        <label>可容納人數:</label>
		        <form:input type="text" path="capacity" class="form-control" name="capacity" id="capacity"/><br>
		        <label>業主名稱:</label>
		        <form:input type="text" path="owner" class="form-control" name="owner" id="owner" placeholder="輸入景點名稱"/><br>
		        <label>平均房價:</label>
		        <form:input type="text" path="averagePrice" class="form-control" name="averagePrice" id="averagePrice"/><br>
		    	<label>照片:</label>
		    		<div class="input-group col-xs-12" >
	<!-- 				<input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">  -->
						<span class="input-group-append">
		    				<input id="upload" type="file" class="file-upload-browse btn btn-primary" name="upload" accept="image/*" multiple="multiple">
						</span>
					</div>
	    	</div>
	    	<input type="submit" name="insert" class="btn btn-primary mr-2" value="加入一筆資料">
	    </form:form>
	    <div id="picPreview"></div>
	</div>    
	<%@ include file="/WEB-INF/includes/SuperBottom.jsp"%>
	    
    <script>
	    $('#upload').on('change',function(e){
// 	    	$('#picPreview').empty();
    		var photos = this.files;
	    	for(let i=0;i<photos.length;i++){
	    		var file = photos[i];
	    		var fr = new FileReader();
	    		fr.onload = function(e){
	    			$('#picPreview').append('<img id="img" src="'+e.target.result+'" class="box">');
	    		};
	    		fr.readAsDataURL(file);
	    	};
	    });
    </script>
    <script>
    $(function() {
    	$('#hotel').validate({
    		onkeyup : function(element, event) {
    			var value = this.elementValue(element).replace(/^\s+/g, "");
    			$(element).val(value);
    			},
    		rules : {
    			name : {required : true},
				address : {required : true},
    			type : {required : true},
    			intro : {required : true},
    			country : {required : true},
    			phone : {required : true,
    					number : true},
    			status : {required : true},
    			owner : {required : true},
    			averagePrice : {required : true},
   				},
 			messages : {
 				name : {required : '必填'},
  				address : {required : '必填'},
    			type : {required : '必填'},
    			intro : {required : '必填'},
    			country : {required : '必填'},
    			phone : {required : '必填',
    				number:'電話須為數字'},
    			status : {required : '必填'},
    			owner : {required : '必填'},
    			averagePrice : {required : '必填'},
    			},
    		submitHandler : function(form) {
    			form.submit();
   				}
   			});
 	   });
    </script>
</body>
</html>