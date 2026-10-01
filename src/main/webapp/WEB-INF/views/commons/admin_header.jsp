<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="navbar navbar-expand-lg glass-header sticky-top py-3">
    <div class="container-fluid px-lg-5">
        <!-- Brand / Admin logo Aura Kicks -->
        <a class="navbar-brand d-flex align-items-center gap-2 text-decoration-none" href="<c:url value='/admin/home'/>">
            <div class="d-flex align-items-center justify-content-center bg-dark text-white rounded-3 p-2 shadow-sm" style="width: 38px; height: 38px;">
                <i class="fas fa-tools text-warning fs-5"></i>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="font-display fw-bold fs-4 tracking-tight text-dark">AURA<span style="color: #e0148d;">KICKS</span></span>
                <span class="badge bg-dark rounded-pill px-2.5 py-1 text-uppercase" style="font-size: 10px;">ADMIN HQ</span>
            </div>
        </a>

        <!-- Right side Admin info -->
        <div class="d-flex align-items-center gap-3 ms-auto">
            <div class="glass-pill px-3 py-1.5 d-flex align-items-center gap-2 shadow-sm">
                <i class="fas fa-user-shield text-danger"></i>
                <span class="fw-bold small text-dark">${sessionScope.account != null ? sessionScope.account.fullname : 'Quản Trị Viên'}</span>
            </div>
            <a class="btn-aura-primary text-decoration-none px-3 py-1.5 small" href="<c:url value='/logout'/>">
                <i class="fas fa-sign-out-alt me-1"></i> Đăng xuất
            </a>
        </div>
    </div>
</header>
