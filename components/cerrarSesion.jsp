<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    HttpSession currentSession = request.getSession(false); 
    if (currentSession != null) {
        currentSession.invalidate();
    }
    response.sendRedirect("./../index.jsp");
%>
