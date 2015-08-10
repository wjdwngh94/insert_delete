<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %><!-- ; ������� ���� -->
<!-- insert.jsp : DB�� ������ ����ִ� ������ -->
<!-- Oracle�� TEST ���̺� ������ ����ִ� ���� ��ǥ -->

<%
	//������ ���� ����
	//1. �ѱ�ó��
	request.setCharacterEncoding("euc-kr");
	//2. �Ķ���� ����
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	//3. ��ȿ�� �˻�
	if(name==null||name.trim().equals("")||gender==null){
		response.sendRedirect("send.jsp");//�ѾƳ��ڴ�.
		return;
	}

	//�׸��� 5���� : no, name, money, gender, joindate
	//no : ����Ŭ �������� �̿�
	//name : ���� ���� ����
	//money : �⺻�� 0������ ����
	//gender : ���� ���� ����
	//joindate : sysdate��� ����Ŭ ��ɾ�� ����
	
	//�ʿ��� ������ ����
	//String name = "ȫ�浿";
	//String gender = "����";
	
	//DB ���� �� ������ ����
	
	//����̹� �˻� - ojdbc6.jar �� WebContent/Web-inf/lib�� ����
	//�� ���� oracle/jdbc/driver/OracleDriver.class ���� ����
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//�α��� - ��ġ, ���̵�, ��й�ȣ
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp1";
	String pass = "jsp1";
	
	//�α��� �õ� - �α��� �����ϸ� con == null
	//java.sql ��Ű���� import
	Connection con = 
					DriverManager.getConnection(url, user, pass);
	
	System.out.println("con = " + con);
	
	//���(����) ����
	String sql = "insert into test values(test_seq.nextval, "+
										"?, 0, ?, sysdate)";
	//���� ���� con���� ���� ��ü ����
	PreparedStatement ps = con.prepareStatement(sql);
	//����ǥ ä��� - ������ ���Ŀ� �°� �˾Ƽ� ����־��ش�.
	//ps.set�ڷ���(����ǥ����, ������);
	ps.setString(1, name);//�ڹ� String ������ varchar2 ���·� ����
	ps.setString(2, gender);
	
	//���� �� ��� �ޱ�
	int result = ps.executeUpdate();
	//System.out.println("result = " + result);
	//result�� 1�̸� ����, 0�̸� ����
	
		if(result>0){//���� : ȸ������ ����! �˸�â , list.jsp �� �̵�%>
		<script type="text/javascript">
			alert("ȸ�� ���� ����!");
			location.href="list.jsp";
		</script>
<%	}else{//���� : ȸ������ ����... �˸�â , send.jsp �� �̵�%>
		<script type="text/javascript">
			alert("ȸ�� ���� ����...");
			location.href="send.jsp";
		</script>
<%	}%>










