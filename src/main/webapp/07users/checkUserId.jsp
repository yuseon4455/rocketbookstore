<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.the.dao.*" %>
<%@ page import="com.the.dto.*" %>

<%
    String user_id = request.getParameter("user_id");
    UsersDao usersDao = new UsersDao();
    boolean idExists = usersDao.checkUserId(user_id );

    if (idExists) {
        // 아이디 중복 시 오류 메시지를 전달
    	String errorMessage = URLEncoder.encode("해당 아이디는 사용할 수 없습니다.", "UTF-8");
        response.sendRedirect("register.jsp?errorMessage=" + errorMessage + "&user_id=" + user_id);
    } else {
        // 아이디 중복이 없으면 다시 회원가입 폼으로 리다이렉트
        String successMessage = URLEncoder.encode("사용 가능한 아이디입니다.", "UTF-8");
        response.sendRedirect("register.jsp?successMessage=" + successMessage +"&user_id=" +user_id);
    }
%>
