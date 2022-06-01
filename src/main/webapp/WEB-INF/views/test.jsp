<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
		<input name="mess">
		
		<button>Send</button>
	</form>
	
	${message }
	
	<c:forEach var="n" items="${list}" begin="0" end="4" step="1">
		<br>
		${n[0]}, ${n[1].nameCategory}, ${n[2]}, ${n[3]}, ${n[4]}, ${n[5]}, ${n[6] }
	</c:forEach>
	
</body>
</html>