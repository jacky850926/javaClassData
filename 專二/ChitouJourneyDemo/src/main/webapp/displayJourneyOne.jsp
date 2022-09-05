<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
		<title>displayJourney</title>
	</head>
	<body>
		<jsp:useBean id="journeybean" class="javaBean.JourneyBean" scope="session" />
		<h2>
		單筆資料
		</h2>
			<ul>
				<li>jID
				<li><jsp:getProperty name="journeybean" property="jID" />
				<li>jName
				<li><jsp:getProperty name="journeybean" property="jName" />
				<li>memberID
				<li><jsp:getProperty name="journeybean" property="memberID" />
				<li>jAlterDate
				<li><jsp:getProperty name="journeybean" property="jAlterDate" />
				<li>jStartDate
				<li><jsp:getProperty name="journeybean" property="jStartDate" />
				<li>jEndDate
				<li><jsp:getProperty name="journeybean" property="jEndDate" />
					
			</ul>
	</body>
</html>