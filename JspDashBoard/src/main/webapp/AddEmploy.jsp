<%@page import="com.java.jdbc.Employ"%>
<%@page import="com.java.jdbc.EmployDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	EmployDAO dao = new EmployDAO();
	int eno = dao.generateEmployNo();
%>

<form method="get" action="AddEmploy.jsp">
<center>
Employ no:
<input type="number" name="empno" 
value=<%=eno %>
readonly="readonly" /> <br/><br/>
Employ Name : 
<input type="text" name="name" /> <br/><br/> 
Gender:
<select name="gender">
<option value="male">male</option>
<option value="female">female</option>
</select> <br/><br/>
Department:
<input type="text" name="dept" /><br/><br/>
Designation:
<input type="text" name="desig"/><br/><br/>
Basic:
<input type="number" name="basic"/> <br/><br/>
<input type="submit" value="AddEmploy"/>
</center>
</form>
<%
if(request.getParameter("empno")!=null && request.getParameter("basic")!=null){
	Employ employ= new Employ();
	employ.setEmpno(eno);
	employ.setName(request.getParameter("name"));
	employ.setGender(request.getParameter("gender"));
	employ.setDept(request.getParameter("dept"));
	employ.setDesig(request.getParameter("desig"));
	employ.setBasic(Integer.parseInt(request.getParameter("basic")));
	dao.addEmploy(employ);
	
	%>
	<jsp:forward page="EmployTable.jsp"/> 
	<% 	
	
}
%>
</body>
</html>