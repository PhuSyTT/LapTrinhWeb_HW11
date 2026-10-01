<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <title>AURA KICKS — Bảng Điều Khiển Quản Trị (Admin HQ)</title>
</head>
<body>
<div>
    <!-- Page Header Block -->
    <div class="glass-card p-4 mb-4 d-flex flex-wrap align-items-center justify-content-between gap-3">
        <div>
            <div class="d-flex align-items-center gap-2 mb-1">
                <span class="badge-drop">Overview Dashboard</span>
                <h3 class="heading-hero fs-4 text-dark mb-0">BẢNG ĐIỀU KHIỂN TRUNG TÂM</h3>
            </div>
            <p class="text-muted small mb-0">Hệ thống phân phối và quản lý danh mục &amp; sản phẩm giày Aura Kicks (Đề số 05)</p>
        </div>
        <div class="glass-pill px-3 py-2 shadow-sm d-flex align-items-center gap-2">
            <span class="rounded-circle bg-success" style="width: 8px; height: 8px; animation: pulse 1.5s infinite;"></span>
            <span class="small fw-bold text-dark">Database Online (SQL Server)</span>
        </div>
    </div>

    <!-- Metric Statistics Cards -->
    <div class="row g-4 mb-4">
        <!-- Card 1: Category -->
        <div class="col-md-4">
            <div class="glass-card p-4 h-100">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <span class="text-muted text-uppercase fw-bold" style="font-size: 11px; letter-spacing: 0.05em;">Tổng Danh Mục Giày</span>
                        <h2 class="font-display display-6 fw-bold my-2 text-dark">${countCategory}</h2>
                        <a href="<c:url value='/admin/category/list'/>" class="btn-aura-secondary text-decoration-none px-3 py-1.5 small">
                            <span>Quản lý Category</span>
                            <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                    <div class="rounded-circle bg-warning text-dark p-3 d-flex align-items-center justify-content-center shadow-sm" style="width: 52px; height: 52px;">
                        <i class="fas fa-folder fs-4"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Card 2: Products -->
        <div class="col-md-4">
            <div class="glass-card p-4 h-100">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <span class="text-muted text-uppercase fw-bold" style="font-size: 11px; letter-spacing: 0.05em;">Tổng Mẫu Sneaker &amp; Giày</span>
                        <h2 class="font-display display-6 fw-bold my-2 text-dark">${countProduct}</h2>
                        <a href="<c:url value='/admin/product/list'/>" class="btn-aura-primary text-decoration-none px-3 py-1.5 small">
                            <span>Quản lý Product</span>
                            <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                    <div class="rounded-circle text-white p-3 d-flex align-items-center justify-content-center shadow-sm" style="background-color: #e0148d; width: 52px; height: 52px;">
                        <i class="fas fa-shoe-prints fs-4"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Card 3: Users -->
        <div class="col-md-4">
            <div class="glass-card p-4 h-100">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <span class="text-muted text-uppercase fw-bold" style="font-size: 11px; letter-spacing: 0.05em;">Tài Khoản Thành Viên</span>
                        <h2 class="font-display display-6 fw-bold my-2 text-dark">${countUser}</h2>
                        <span class="badge bg-dark rounded-pill px-3 py-1 text-white small">Admin • Seller • User</span>
                    </div>
                    <div class="rounded-circle bg-dark text-white p-3 d-flex align-items-center justify-content-center shadow-sm" style="width: 52px; height: 52px;">
                        <i class="fas fa-users fs-4"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick CRUD Action Modules -->
    <div class="glass-card p-4 mb-4">
        <div class="d-flex align-items-center gap-2 mb-3">
            <span class="badge-drop">Quick Actions</span>
            <h4 class="font-display fw-bold text-dark mb-0">TRUY CẬP NHANH CHỨC NĂNG CRUD (CÂU 5)</h4>
        </div>

        <div class="row g-4">
            <div class="col-md-6">
                <div class="glass-pill p-4 h-100 shadow-sm">
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <i class="fas fa-folder-open text-warning fs-5"></i>
                        <h5 class="fw-bold mb-0 text-dark">Quản Trị Danh Mục (Category)</h5>
                    </div>
                    <p class="text-muted small mb-3">Xem danh sách phân trang, thêm mới danh mục, sửa thông tin và xóa danh mục giày.</p>
                    <div class="d-flex gap-2">
                        <a href="<c:url value='/admin/category/list'/>" class="btn-aura-primary text-decoration-none px-3 py-2 small">
                            <i class="fas fa-list me-1"></i> Danh Sách Category
                        </a>
                        <a href="<c:url value='/admin/category/add'/>" class="btn-aura-secondary text-decoration-none px-3 py-2 small">
                            <i class="fas fa-plus me-1 text-danger"></i> Thêm Danh Mục
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="glass-pill p-4 h-100 shadow-sm">
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <i class="fas fa-shoe-prints text-danger fs-5"></i>
                        <h5 class="fw-bold mb-0 text-dark">Quản Trị Sản Phẩm (Product)</h5>
                    </div>
                    <p class="text-muted small mb-3">Xem danh sách phân trang, thêm mẫu giày mới, cập nhật giá niêm yết, số lượng tồn kho và ảnh sản phẩm.</p>
                    <div class="d-flex gap-2">
                        <a href="<c:url value='/admin/product/list'/>" class="btn-aura-primary text-decoration-none px-3 py-2 small">
                            <i class="fas fa-list me-1"></i> Danh Sách Product
                        </a>
                        <a href="<c:url value='/admin/product/add'/>" class="btn-aura-secondary text-decoration-none px-3 py-2 small">
                            <i class="fas fa-plus me-1 text-danger"></i> Thêm Mẫu Giày Mới
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
