<%@page import="javaBean.JourneyBean"%>
<%@page import="java.util.List"%>
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
		<h2>
		全部資料
		</h2>
		<%--<jsp:useBean id="container" class="javaBean.JourneyBean" scope="session" />--%>
<% 
	List<JourneyBean> beanlist = (List<JourneyBean>)request.getSession(true).getAttribute("beanList");
	for(JourneyBean bean:beanlist) {
		//container = bean;
		
%>
			
			<ul>
				<li>jID
				<%= bean.getjID() %>
				<li>jName
				<%= bean.getjName() %>
				<li>memberID
				<%= bean.getMemberID() %>
				<li>jAlterDate
				<%= bean.getjAlterDate() %>
				<li>jStartDate
				<%= bean.getjStartDate() %>
				<li>jEndDate
				<%= bean.getjEndDate() %>
			</ul>
			
			<%--
			<ul>
				<li>jID
				<li><jsp:getProperty name="container" property="jID" />
				<li>jName
				<li><jsp:getProperty name="container" property="jName" />
				<li>memberID
				<li><jsp:getProperty name="container" property="memberID" />
				<li>jAlterDate
				<li><jsp:getProperty name="container" property="jAlterDate" />
				<li>jStartDate
				<li><jsp:getProperty name="container" property="jStartDate" />
				<li>jEndDate
				<li><jsp:getProperty name="container" property="jEndDate" />
			</ul>
			--%>	
<% 		
	}
%>


	</body>
</html>