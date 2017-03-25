// index.html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<title>Insert title here</title>
</head>
<body>
<form action="/edu/memAuth" method="post">
	ID : <input type="text" name="id"><br>
	비밀번호 : <input type="password" name="pwd"><br>
	<input type="submit" value="login">
</form>
<hr>
<a href="/edu/memAuth">logout</a>
</body>
</html>

// MemberAuth.java
@WebServlet("/memAuth")
public class MemberAuth extends HttpServlet{

	/*로그아웃 처리
	1.현재 로그인 상태 여부 판단
	2.로그아웃 구현
	 HttpSession removeAttribute(name) or invalidate()
	*/
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		if(session!=null && session.getAttribute("id")!=null){
			session.invalidate();
			out.print("<h3>로그아웃되었습니다.");
		}else{
			out.println("<h3>현재 로그인 상태가 아닙니다.");
		}			
		out.close();
	}	
	
	
	/*로그인처리
	1.ID,비밀번호 추출 
	2.유효성 체크=>입력페이지로
	3.DB 데이터와 비교=>입력페이지
	4.로그인 작업
	 1)현재 로그인 상태 여부 판단
	 2)로그인 구현
	*/
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//1.parameter 추출
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//2.유효성 체크
		if(id.isEmpty()||pwd.isEmpty()){
			RequestDispatcher rd = request.getRequestDispatcher("/index.html");
			rd.forward(request, response);
			return;
		}
		
		//3.DB데이터와 비교
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
			pstmt=conn.prepareStatement("select id, password from member where id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(2).trim().equals(pwd)){
					if(login(id,request)){
						out.print("<h3>로그인 완료하였습니다.");
					}else{
						out.print("<h3>현재 로그인 상태입니다.");
					}
				}else{
					out.println("<h3>비밀번호가 틀립니다.");
				}
			}else{
				out.print("<h3>존재하지 않는 아이디입니다.");
			}
		}catch(Exception e){
			System.out.println(e);
		}finally{
			try{
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			}catch(Exception e1){
				System.out.println(e1);
			}
		}
		
		out.close();
	}


	/*4.로그인 작업
	 1)현재 로그인 상태 여부 판단
	 2)로그인 구현
	*/
	public boolean login(String id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.isNew()||session.getAttribute("id")==null) // 현재 로그인 상태가 아니라는 것
		{
			session.setAttribute("id", id);
			return true;
		}else{
			return false;
		}
	}
}
