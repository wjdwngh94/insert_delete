<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!-- list.jsp : ����� ������ ����� ǥ���ϴ� ������ -->
<%
	//�ٷ� DB ����
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	//localhost == 127.0.0.1
	String user = "jsp1";
	String pass = "jsp1";
	
	Connection con = 
			DriverManager.getConnection(url, user, pass);
	
	String sql = "select * from test order by no asc";//������
	PreparedStatement ps = con.prepareStatement(sql);
	//����ǥ ����
	ResultSet rs = ps.executeQuery();
	//rs�� ��� �����Ͱ� ����Ǿ� �ִ�.
	/* System.out.println("rs = " + rs);
	System.out.println("������ ���� ���� : "+rs.next());
	System.out.println("������ ���� ���� : "+rs.next());
	System.out.println("������ ���� ���� : "+rs.next());
	System.out.println("������ ���� ���� : "+rs.next());
	System.out.println("������ ���� ���� : "+rs.next());
	System.out.println("������ ���� ���� : "+rs.next());
	System.out.println("������ ���� ���� : "+rs.next()); */	
%>
<html>
	<head></head>
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
				<!-- ������ : �����Ͱ� ���� ������ 1�پ� ���� -->
				<%while(rs.next()){//�����Ͱ� ������ %>
				<tr>
					<th><%=rs.getInt("no")%></th><!-- rs.getInt(1) -->
					<th><%=rs.getString("name")%></th>
					<th><%=rs.getInt("money")%></th>
					<th><%=rs.getString("gender")%></th>
					<th><%=rs.getString("joindate")%></th>
				</tr>
				<%} %>
			</table>
			<br><br>
			<h1><a href="send.jsp">�������� �̵�</a></h1>
		</div>
	</body>
</html>









