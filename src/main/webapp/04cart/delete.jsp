<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.the.dao.*" %>
<%@ page import="com.the.dto.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	// 폼에서 보내온 deleteId 받기
	String[] deleteId = request.getParameterValues("cart_id[]");
	
	if(deleteId != null) // 체크박스가 비어있지않다면(선택되어있다면)
	{

		List<Long> deleteIdList = new ArrayList<>();
		// idToDelete라는 빈 ArrayList 생성
		// 선택된 아이디들을 List<Long>으로 변환
	
		for (String id : deleteId)
			// deleteId : 사용자가 체크한 id들을 담고 있는 문자열배열
			// deleteId 배열을 순차적으로 돌면서 각 주문 id(delete)를 하나씩 꺼냄
		{
			deleteIdList.add(Long.parseLong(id));
			// 각 주문 ID를 String에서 형변환
		}
		
		CartBookDao dao = new CartBookDao();
		boolean isDeleted = dao.delete(deleteIdList);
		// dao에서 delete 메소드 호출
		

		response.sendRedirect("/00BookJSP/04cart/cartList.jsp");

	}	
%>
	

</body>
</html>