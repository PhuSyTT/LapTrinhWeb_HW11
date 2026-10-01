<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:title default="AURA KICKS — Hệ Thống Bán Giày Thể Thao (Đinh Phú Sỹ - 24162109)" /></title>
    
    <!-- Google Fonts: Inter & Plus Jakarta Sans (Font không chân hiện đại, chuẩn 100% tiếng Việt) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Aura Kicks Design System Theme CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/css/aurora-theme.css'/>">
    
    <sitemesh:head/>
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Header Navigation Component -->
    <%@ include file="/WEB-INF/views/commons/header_24162109.jsp" %>

    <!-- Main Content decorated -->
    <main class="flex-grow-1">
        <sitemesh:body/>
    </main>

    <!-- Footer Component -->
    <%@ include file="/WEB-INF/views/commons/footer_24162109.jsp" %>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
