<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!-- insert.jsp DB�� ������ ����ִ� ������ -->
<!-- Oracle�� TEST���̺� ������ ����ִ� ���� ��ǥ�̴�. -->
<%
	//�׸��� 5�����̴� : NO, NAME, MONEY, GENDER, JOINDATE

	//NO : ORACLE SYQUENCE�� �̿��Ѵ�.
	//NAME : ���� ���� �����Ѵ�.
	//MONEY : �⺻�� 0������ �����Ѵ�.
	//GENDER : ���� ���� ����
	//JOINDATE : ����ð��� ���Ѵ�. SYSDATE��� ORACLE��ɾ� ���

	//JAVA���� ���� ����� �ִ� ������ : NAME , GENDER
	//ORACLE���� ����� �ִ� ������ : JOINDATE, NO, MONEY

	//�ʿ��� ������ ����

	String method = request.getMethod();
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");

	if (name == null || name.trim().equals("")) {
		System.out.println("�ǹٸ� �ڷᰡ �Էµ��� �ʾҽ��ϴ�.");
		response.sendRedirect("send.jsp"); //send.jsp�� �ѾƳ���.
		return; //���� ����
	} else {
%>

<%
	}
	//DB ���� �� ������ ����

	//driver �˻� - ojdbc6.jar�� WebContent/Web-inf/lib�� �����Ѵ�
	//�� ���� oracle/jdbc/driver/OracleDriver.class ���� ����

	Class.forName("oracle.jdbc.driver.OracleDriver");

	//�α��� - ��ġ ����, ���̵�, ��й�ȣ
	//���̵� , ��й�ȣ @ ip : oracle ������Ʈ : ����
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp1";
	String pass = "jsp1";

	//�α��� �õ� - �α��� �����ϸ� con == null
	Connection con = DriverManager.getConnection(url, user, pass);

	System.out.println("con = " + con);

	//���(����)����
	//insert into test(no, name, money, gender, joindate)
	//values(test_seq.nextval,'Ȳ�κ�',3000,'����',to_date('15/08/05'));
	String sql = "insert into test values(test_seq.nextval,"
			+ "?,0,?,sysdate)";

	//���� ���� con���� ���۰�ü ����
	PreparedStatement ps = con.prepareStatement(sql);
	//����ǥ ä��� �۾� - ������ ���Ŀ� �°� �˾Ƽ� ����־� �ش�.
	//ps.set �ڷ���(����ǥ ����, ������)

	ps.setString(1, name);//�ڹ� String ������ varchar2 ���·� �����Ѵ�.
	ps.setString(2, gender);

	//�����Ŀ� ����� �޴´�
	//�����̵� ���е� int���·� ���ڸ� �޾Ƽ� ����� �˷��ش�.

	int result = ps.executeUpdate();
	System.out.println("result = " + result);

	//result �� 1�̸� �����̰�, 0�̸� �����̴�.
%>
<html>
<body>
	<div>
		<script type="text/javascript">
			
		<%if (result == 1) {%>
			alert("ȸ�� ���� ����");
			location.href = "list.jsp";
		<%} else {%>
			alert("ȸ�� ���� ����");
		<%}%>
			
		</script>
	</div>
</body>
</html>
