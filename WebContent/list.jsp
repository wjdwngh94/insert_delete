<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : ����� ������ ����� ǥ���ϴ� ������ -->
<%
	//(4�ܰ踦 ��ġ��)
	//�ٷ� db�����Ѵ�.
	//1.������������ �����ų�� �𸣱� ������ �켱 driver�˻��� �Ѵ�.
	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";

	//�α���
	Connection con = DriverManager.getConnection(url, user, pass);

	//������(��ü����� �������� ���̹Ƿ� ���� ������ �������(��ȣ�� ���� ����))
	String sql = "select * from test order by no asc";
	PreparedStatement ps = con.prepareStatement(sql);

	//?�� �����Ƿ� �ٷν��� ��Ų��.
	//��ü�� �����͸� ���� �����Ƿ� ps.excuteQuery�� ����Ѵ�.
	ResultSet rs = ps.executeQuery();

	//rs�� ��� �����Ͱ� ����Ǿ� �ִ�.
	System.out.println("rs = " + rs);
%>
<html>
<head>
</head>
<body>
	<div align="center">
		<table border="1">
			<!-- ������ -->
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>���ϸ���</th>
				<th>����</th>
				<th>������</th>
			</tr>
			<!-- ����� -->
			<%
				while (rs.next() == true) {//�����Ͱ� ���� �� ���� ���پ� ���
			%>
			<tr>
				<th><%=rs.getInt("no") %></th> <!-- rs.getInt(1) �ε� ��ü ���� -->
				<th><%=rs.getString("name") %></th>
				<th><%=rs.getInt("money") %></th>
				<th><%=rs.getString("gender") %></th>
				<th><%=rs.getString("joindate") %></th>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>