<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!-- insert.jsp DB�� ������ ����ִ� ������ -->
<!-- Oracle�� TEST���̺� ������ ����ִ� ���� ��ǥ�̴�. -->
<html>
	<head>
		<title>������ ������</title>
	</head>
<body>
	<div align = "center">
		<h1>ȸ�� ����</h1>
		<form action="insert.jsp" method="post">
			
			�̸� : <input type ="text" name = "name"><br>
			
			���� : <select name = "gender">
				<option value = "����">����
				<option value = "����">����
			</select>
			<br>
			<!-- ���� ��ư -->
			<input type="submit" value="����">
	
		</form>
		
		<h1>ȸ�� ���</h1>
		<form action="list.jsp" method="post">
			<input type="submit" value="��Ϻ���">

		</form>
		
		<h1>ȸ�� ����</h1>
		<form action="delete.jsp" method="post">
			
			�̸� : <input type ="text" name = "name"><br>
			<!-- ���� ��ư -->
			<input type="submit" value="����">
			
		</form>
		
		<h1>ȸ�� �˻�</h1>
		<form action="search.jsp" method="post">
	
			�̸� : <input type ="text" name = "name"><br>
			
			<!-- ���� ��ư -->
			<input type="submit" value="�˻�">
		</form>
		
	</div>
</body>
</html>
