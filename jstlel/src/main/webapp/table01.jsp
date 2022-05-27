<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String row = request.getParameter("r");
	String col = request.getParameter("c");
	
	int nRow = Integer.parseInt(row);
	int nCol = Integer.parseInt(row);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border='1' cellspaceing='0' cellpadding='10'>
		<%
			for(int i=0;i<nRow;i++){
				
		%>
		<tr>
			<% for(int j=0; j<nCol;j++) { %>
			<td>cell(<%=i %>,<%=j%>)</td>
			<% } %>
			<td>cell(<%=i %>,1)</td>
			<td>cell(<%=i %>,2)</td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>


