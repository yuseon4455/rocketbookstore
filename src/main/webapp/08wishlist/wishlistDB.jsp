<%@page import="com.the.dao.WishListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트 추가</title>
</head>
<%@ include file = "../07users/header.jsp" %>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String user_id = (loggedInUser != null) ? loggedInUser.getUser_id() : null;
    String book_idParam = request.getParameter("book_id");

    if (user_id == null || book_idParam == null || book_idParam.trim().isEmpty()) {
        response.sendRedirect("mywishlist.jsp");
        return;
    }

    Long book_id = Long.parseLong(book_idParam);
    WishListDao wishListDao = new WishListDao();

    boolean isAlreadyInWishlist = wishListDao.isBookInWishlist(user_id, book_id);

    // 현재 요청한 위치 URL (Referer)
    String referer = request.getHeader("Referer");

    if (isAlreadyInWishlist) {
        // ❤️ → 🤍: 삭제
        wishListDao.deleteWishList(user_id, book_id);
        session.setAttribute("wishAdded", false);

        out.println("<script>");
        out.println("alert('위시리스트에서 삭제되었습니다.');");
        out.println("location.href='" + referer + "';");
        out.println("</script>");
    } else {
        // 🤍 → ❤️: 추가
        wishListDao.addWishList(user_id, book_id);
        session.setAttribute("wishAdded", true);

        // 만약 현재 referer에 "bookDetail.jsp"가 포함되어 있으면, mywishlist로 이동
        if (referer != null && referer.contains("bookDetail.jsp")) {
            out.println("<script>");
            out.println("alert('위시리스트에 추가되었습니다.');");
            out.println("location.href='/00BookJSP/08wishlist/mywishlist.jsp';");
            out.println("</script>");
        } else {
            // 그 외 페이지는 원래 위치 유지
            out.println("<script>");
            out.println("alert('위시리스트에 추가되었습니다.');");
            out.println("location.href='" + referer + "';");
            out.println("</script>");
        }
    }
%>
</body>
</html>
