<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>JSTL(forEach Tag) Test</h4>
	<c:set var="count" value='${ fn:length(list) }'/>
	<c:forEach items='${list }' var='vo' varStatus='status'>
		<Strong>${fn:length(list)-status.index}</Strong><span>(${status.index}:${status.count})[${vo.no}:${vo.name}] </span><br>
	</c:forEach>
</body>
</html>