<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- list.jsp : ����� ������ ����� ǥ���ϴ� ������ -->
<%
	String method = request.getMethod();
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	if (name == null || name.trim().equals("")) {
		System.out.println("�ǹٸ� �ڷᰡ �Էµ��� �ʾҽ��ϴ�.");
		response.sendRedirect("send.jsp"); //send.jsp�� �ѾƳ���.
		return; //���� ����
	} else {

		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "jsp1";
		String pass = "jsp1";
		Connection con = DriverManager.getConnection(url, user, pass);

		String sql = "select * from test order by no asc";
		PreparedStatement ps = con.prepareStatement(sql);

		//?�� �����Ƿ� �ٷν��� ��Ų��.
		//��ü�� �����͸� ���� �����Ƿ� ps.excuteQuery�� ����Ѵ�.
		ResultSet rs = ps.executeQuery();
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
				while (rs.getString("name").equals("name")) {//�����Ͱ� ���� �� ���� ���پ� ���
			%>
			<tr>
				<th><%=rs.getInt("no")%></th>
				<!-- rs.getInt(1) �ε� ��ü ���� -->
				<th><%=rs.getString("name")%></th>
				<th><%=rs.getInt("money")%></th>
				<th><%=rs.getString("gender")%></th>
				<th><%=rs.getString("joindate")%></th>
			</tr>
			<%
				rs.next();
					}
			%>
		</table>
	</div>
</body>
</html>
<%
	}
%>