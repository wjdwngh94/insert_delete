<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- send.jsp : ������ ���� ������ -->
<html>
<head>
<title>���� ������</title>
</head>
<body>
<div align="center">
	
	<h1>ȸ�� �����ϱ�</h1>
	<form action="insert.jsp" method="post">
		<!-- �̸�, ������ �Է¹޾� ���� -->
		<table border="1">
			<tr>
				<th>�̸�</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>����</th>
				<td>
					<select name="gender">
						<option value="����">����
						<option value="����">����
					</select>
				</td>
			</tr>
			<tr>
				<th colspan="2'">
					<input type="submit" value="����">
				</th>
			</tr>
		</table>
	</form>
	
	<br>
	<h1>ȸ�� ��Ϻ���</h1>
	<a href="list.jsp">����Ʈ �������� �̵�</a>
	
	<br>
	<h1>ȸ�� �����ϱ�</h1>
	<form action="delete.jsp" method="post">
		<!-- �̸� �Է¹޾� ���� -->
		<table border="1">
			<tr>
				<th>�̸�</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th colspan="2'">
					<input type="submit" value="����">
				</th>
			</tr>
		</table>
	</form>
	
	<br>
	<h1>ȸ�� �˻��ϱ�</h1>
	<form action="search.jsp" method="post">
		<!-- �̸� �Է¹޾� ���� -->
		<table border="1">
			<tr>
				<th>�̸�</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th colspan="2'">
					<input type="submit" value="�˻�">
				</th>
			</tr>
		</table>
	</form>	
	
</div>
</body>
</html>






