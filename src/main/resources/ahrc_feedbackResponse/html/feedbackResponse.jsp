<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<template:addResources type="css" resources="table.css" />


<html>
  <head>
    <title>AHRC Feedbacks</title>
  </head>
  <style>
    table {
      width:100%;
    }
    table, th, td {
      border: 1px solid black;
      border-collapse: collapse;
    }
    th, td {
      padding: 5px;
      text-align: left;
    }
    table#t01 tr:nth-child(even) {
      background-color: #eee;
    }
    table#t01 tr:nth-child(odd) {
      background-color:#fff;
    }
    table#t01 th	{
      background-color: #a36e6e;
      color: white;
    }
  </style>
  <body>
    
    <!-- <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:2306/nimbus_dev"
user="nimbus"  password="password"/>-->
    
    <sql:setDataSource var="snapshot" driver="${currentNode.properties.driver.string}"
                       url="${currentNode.properties.url.string}"
                       user="${currentNode.properties.user.string}"  password="${currentNode.properties.password.string}"/>
    
    
    <sql:query dataSource="${snapshot}" var="result">
      SELECT * from ${currentNode.properties.tableName.string};
    </sql:query>
    <div>
      <br><br><br>
      <table id="t01" border="1">
        <tr style="font:bold">
          <th>ID</th>
          <th>How did you find this site</th>
          <th>Other Source for finding this site</th>
          <th>What Info seeked</th>
          <th>What content was expected</th>
          <th>Suggestions</th>
          <th>Comments</th>
          <th>Other Comments</th>
        </tr>
        <c:forEach var="row" items="${result.rows}">
          <tr>
            <td><c:out value="${row.FEEDBACK_ID}"/></td>
            <td><c:out value="${row.QUESTION_1}"/></td>
            <td><c:out value="${row.OTHER_1}"/></td>
            <td><c:out value="${row.QUESTION_2}"/></td>
            <td><c:out value="${row.QUESTION_3}"/></td>
            <td><c:out value="${row.QUESTION_4}"/></td>
            <td><c:out value="${row.QUESTION_5}"/></td>
            <td><c:out value="${row.QUESTION_6}"/></td>
          </tr>
        </c:forEach>
      </table>
    </div>
    
  </body>
</html>