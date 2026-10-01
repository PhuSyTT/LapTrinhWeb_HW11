<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:title default="AURA KICKS — Bảng Điều Khiển Quản Trị (Đinh Phú Sỹ - 24162109)" /></title>
    
    <!-- Google Fonts: Inter & Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <!-- Aura Kicks Theme CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/css/aurora-theme.css'/>">
    
    <style>
        .admin-sidebar-glass {
            background: rgba(255, 255, 255, 0.78);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.85);
            border-radius: 24px;
            box-shadow: 0 10px 30px -5px rgba(0,0,0,0.05);
        }
        .admin-nav-item {
            color: #334155;
            font-weight: 600;
            padding: 12px 18px;
            border-radius: 9999px;
            margin-bottom: 6px;
            transition: all 0.2s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
        .admin-nav-item:hover, .admin-nav-item.active {
            background: #09090b;
            color: #ffffff;
            box-shadow: 0 8px 16px -4px rgba(9, 9, 11, 0.25);
        }
    </style>
    
    <sitemesh:head/>
</head>
<body class="d-flex flex-column min-vh-100">

    <!-- Admin Header -->
    <%@ include file="/WEB-INF/views/commons/admin_header_24162109.jsp" %>

    <div class="container-fluid px-lg-5 py-4 flex-grow-1">
        <div class="row g-4">
            <!-- Sidebar Navigation -->
            <div class="col-lg-3 col-xl-2">
                <div class="admin-sidebar-glass p-3 sticky-top" style="top: 90px; z-index: 10;">
                    <div class="d-flex align-items-center gap-2 px-2 mb-3">
                        <span class="badge-drop" style="font-size: 10px;">HQ PANEL</span>
                        <span class="text-uppercase text-muted fw-bold small" style="font-size: 11px;">Quản Trị Hệ Thống</span>
                    </div>

                    <nav class="nav flex-column">
                        <a class="admin-nav-item" href="<c:url value='/admin/home'/>">
                            <i class="fas fa-chart-line me-2 text-danger"></i> Tổng Quan
                        </a>
                        <a class="admin-nav-item" href="<c:url value='/admin/category/list'/>">
                            <i class="fas fa-folder me-2 text-warning"></i> Quản Lý Category
                        </a>
                        <a class="admin-nav-item" href="<c:url value='/admin/product/list'/>">
                            <i class="fas fa-shoe-prints me-2 text-info"></i> Quản Lý Product
                        </a>
                        <hr class="my-3 border-white">
                        <a class="admin-nav-item" href="<c:url value='/home'/>" target="_blank">
                            <i class="fas fa-external-link-alt me-2 text-success"></i> Xem Storefront
                        </a>
                    </nav>
                </div>
            </div>

            <!-- Main Decorated Content -->
            <div class="col-lg-9 col-xl-10">
                <sitemesh:body/>
            </div>
        </div>
    </div>

    <!-- Admin Footer -->
    <%@ include file="/WEB-INF/views/commons/admin_footer_24162109.jsp" %>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
