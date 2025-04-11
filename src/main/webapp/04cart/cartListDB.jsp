<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.time.*"%>
<%@page import="java.time.format.*"%>
<%@page import="com.the.dao.*"%>
<%@page import="com.the.dto.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String user_id = (String) session.getAttribute("user_id");
	if (user_id == null) {
 	   response.sendRedirect("../07users/login.jsp");
 	   return;
	}
	
	long ship_id = Long.parseLong(request.getParameter("ship_id"));

	String cartid[] = request.getParameterValues("cart_id[]");
	
	long cart_id[] = new long[cartid.length];
	
	for(int i=0; i<cartid.length; i++){
		cart_id[i]=Long.parseLong(cartid[i]);
	}
	
	//order_date 생성 포맷지정 해야함
	LocalDateTime order_time = LocalDateTime.now();
	DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	session.setAttribute("order_time", order_time.format(formatter1));
	
	LocalDate order_date = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	//주문번호 만들기 걍6글자
	long number = cart_id[0];
	String order_id = order_date.format(formatter)+String.format("%06d", number);

	boolean idExists = false;
	while(!idExists){
		ArrayList<OrdersDto> resultDto = OrdersDao.selectAll2(order_id);
		idExists = true;
		for (OrdersDto item : resultDto) {
			if (item.getOrder_id().equals(order_id)) {
				idExists = false;
			}
		}
		if (!idExists) {
			number=number+10;
			order_id = order_date.format(formatter)+String.format("%06d", number);
		}
	}
	session.setAttribute("order_id", order_id);
	
	//운송장번호 만들기-로켓서점이니까 RK로
	String history_id = "RK" + order_date.format(formatter) + String.format("%06d", number);
	
	OrdersDto odtos = new OrdersDto( //얘는 하나의 튜플이 추가되니까 배열아니고 
			order_id,
			ship_id,
			user_id,
			order_date,
			history_id
	);
	OrdersDao.insert(odtos); //orders테이블에 추가하고
	
	// 운송장 번호 테이블에 추가
	HistoryDao.insert(history_id);
	
	//해당 id 테이블 불러오기-book_id와 price(테이블X 값만 담아서 가져감)가져오기 위해
	//cart와 books 조인 객체 생성하고
	CartBookDao cbdao = new CartBookDao();
	//여러개 주문하니까 주문갯수만큼 cartbook 조인문 배열을 만듬
	CartBookDto[] cartDtos = new CartBookDto[cart_id.length];
	for(int i=0; i<cart_id.length; i++){
		cartDtos[i] = cbdao.cartIdList(cart_id[i]); //배열에 주문 리스트정보를 담아
													//왜? 수량이랑 가격이랑 다 가져와야 하니까
		if (cartDtos[i] == null) {
			// 하나라도 null이면 즉시 중단
			response.sendRedirect("cartList.jsp");
			return;
		}
	}
	
	for(int i=0; i<cart_id.length; i++){
		CartBookDto cbdto = cartDtos[i]; //가격 수량을 하나씩 꺼내
		
        OrdersDetailDto oddto = new OrdersDetailDto( 
                    order_id,
                    cbdto.getAmount(),
                    cbdto.getBook_id()
       );
       OrdersDetailDao.insert(oddto); // orders 테이블에 추가
	}
	
	   // 주문전송 눌렀을때 장바구니에서는 삭제
	   String[] deleteId = request.getParameterValues("cart_id[]");
	   if(deleteId != null){
	      List<Long> deleteIdList = new ArrayList<>();
	      for(String id : deleteId){
	         deleteIdList.add(Long.parseLong(id));
	      }
	      
	      CartBookDao cartBookDao = new CartBookDao();
	      boolean deleteCartId = cartBookDao.delete(deleteIdList);
	   }

	response.sendRedirect("../05orders/ordersSelectId.jsp");
%>
</body>
</html>