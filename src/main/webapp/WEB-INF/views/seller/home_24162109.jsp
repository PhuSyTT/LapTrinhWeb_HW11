<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Kênh Quản Lý Cửa Hàng — Seller Dashboard (AURA KICKS)</title>
</head>
<body>
<div class="py-4">
    <div class="container-fluid px-lg-5">

        <!-- Banner Chào mừng Seller -->
        <div class="card border-0 rounded-4 shadow-sm mb-4 overflow-hidden" 
             style="background: linear-gradient(135deg, #0d131f 0%, #1a2234 100%); color: #ffffff;">
            <div class="card-body p-4 p-lg-5">
                <div class="row align-items-center g-4">
                    <div class="col-lg-8">
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <span class="badge bg-danger px-3 py-2 rounded-pill fw-bold text-uppercase" style="letter-spacing: 0.05em;">
                                <i class="fas fa-store me-1"></i> Seller Dashboard
                            </span>
                            <span class="badge bg-success bg-opacity-75 px-3 py-2 rounded-pill">
                                <i class="fas fa-circle me-1 small"></i> Cửa hàng đang hoạt động
                            </span>
                        </div>
                        <h2 class="font-display fw-bold display-6 mb-2">
                            Chào mừng, <span style="color: #f43f5e;">${seller != null ? seller.sellername : sessionScope.account.fullname}</span>!
                        </h2>
                        <p class="text-white-50 mb-4" style="max-width: 650px;">
                            Đây là trang chủ dành riêng cho Đối tác Bán hàng (Seller) của hệ thống AURA KICKS. Quản lý danh mục sản phẩm, theo dõi kho giày và cập nhật trạng thái đơn hàng nhanh chóng.
                        </p>
                        <div class="d-flex flex-wrap gap-3">
                            <a href="<c:url value='/products'/>" class="btn btn-light rounded-pill px-4 py-2 fw-bold text-dark shadow-sm">
                                <i class="fas fa-eye me-1.5 text-danger"></i> Xem Sản Phẩm Theo Seller
                            </a>
                            <a href="<c:url value='/home'/>" class="btn btn-outline-light rounded-pill px-4 py-2 fw-semibold">
                                <i class="fas fa-globe me-1.5"></i> Về Trang Khách Hàng
                            </a>
                        </div>
                    </div>

                    <!-- Seller Profile Mini-Card -->
                    <div class="col-lg-4">
                        <div class="p-4 rounded-4 shadow-sm text-center" style="background: rgba(255, 255, 255, 0.08); backdrop-filter: blur(10px); border: 1px solid rgba(255, 255, 255, 0.15);">
                            <img src="${(seller != null and not empty seller.images) ? seller.images : (not empty sessionScope.account.images ? sessionScope.account.images : 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png')}" 
                                 alt="Store Logo" 
                                 class="rounded-circle border border-3 border-danger p-1 mb-3 shadow" 
                                 width="88" height="88" style="object-fit: cover; background: #fff;">
                            <h5 class="fw-bold text-white mb-1">${seller != null ? seller.sellername : 'Cửa Hàng Giày Sneaker'}</h5>
                            <p class="text-white-50 small mb-2">Mã Seller: <strong>#${sellerId}</strong> • Tài khoản: <strong>${sessionScope.account.username}</strong></p>
                            <span class="badge bg-warning text-dark px-3 py-1.5 rounded-pill fw-bold">Đối Tác Bán Lẻ Chính Hãng</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3 Thống kê nhanh KPI -->
        <div class="row g-4 mb-4">
            <div class="col-md-4">
                <div class="card border-0 rounded-4 shadow-sm h-100 p-4" style="background: rgba(255, 255, 255, 0.9); border: 1px solid #e2e8f0 !important;">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <div class="rounded-3 bg-danger bg-opacity-10 text-danger p-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                            <i class="fas fa-shoe-prints fs-4"></i>
                        </div>
                        <span class="badge bg-light text-muted border px-2.5 py-1.5 rounded-pill">Kho hàng</span>
                    </div>
                    <div class="text-muted small fw-semibold text-uppercase" style="letter-spacing: 0.05em;">Tổng Sản Phẩm Đăng Bán</div>
                    <h3 class="fw-bold font-display text-dark my-1">${totalProducts} <span class="fs-6 fw-normal text-muted">mẫu giày</span></h3>
                    <div class="small text-success mt-2"><i class="fas fa-check-circle me-1"></i>Đang hiển thị trên sàn thương mại</div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card border-0 rounded-4 shadow-sm h-100 p-4" style="background: rgba(255, 255, 255, 0.9); border: 1px solid #e2e8f0 !important;">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <div class="rounded-3 bg-primary bg-opacity-10 text-primary p-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                            <i class="fas fa-boxes fs-4"></i>
                        </div>
                        <span class="badge bg-light text-muted border px-2.5 py-1.5 rounded-pill">Tồn kho</span>
                    </div>
                    <div class="text-muted small fw-semibold text-uppercase" style="letter-spacing: 0.05em;">Tổng Số Lượng Tồn Kho</div>
                    <h3 class="fw-bold font-display text-dark my-1">${totalStock} <span class="fs-6 fw-normal text-muted">đôi</span></h3>
                    <div class="small text-primary mt-2"><i class="fas fa-cubes me-1"></i>Sẵn sàng giao cho khách hàng</div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card border-0 rounded-4 shadow-sm h-100 p-4" style="background: rgba(255, 255, 255, 0.9); border: 1px solid #e2e8f0 !important;">
                    <div class="d-flex align-items-center justify-content-between mb-3">
                        <div class="rounded-3 bg-success bg-opacity-10 text-success p-3 d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                            <i class="fas fa-shield-check fs-4"></i>
                        </div>
                        <span class="badge bg-light text-muted border px-2.5 py-1.5 rounded-pill">Bảo mật</span>
                    </div>
                    <div class="text-muted small fw-semibold text-uppercase" style="letter-spacing: 0.05em;">Trạng Thái Tài Khoản</div>
                    <h3 class="fw-bold font-display text-dark my-1">Đã Kích Hoạt OTP</h3>
                    <div class="small text-muted mt-2"><i class="fas fa-envelope me-1"></i>${sessionScope.account.email}</div>
                </div>
            </div>
        </div>

        <!-- Bảng Danh Sách Sản Phẩm Của Seller -->
        <div class="card border-0 rounded-4 shadow-sm overflow-hidden" style="background: #ffffff; border: 1px solid #e2e8f0 !important;">
            <div class="card-header bg-white p-4 d-flex flex-wrap align-items-center justify-content-between gap-3 border-bottom">
                <div>
                    <h5 class="fw-bold text-dark font-display mb-1">
                        <i class="fas fa-list text-danger me-2"></i>Danh Sách Giày Trong Gian Hàng Của Bạn
                    </h5>
                    <p class="text-muted small mb-0">Các mặt hàng đang được kinh doanh bởi Seller ID: <strong>#${sellerId}</strong></p>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <span class="badge bg-dark px-3 py-2 rounded-pill">${totalProducts} Sản phẩm</span>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table align-middle table-hover mb-0">
                    <thead class="table-light text-muted small text-uppercase" style="font-size: 11.5px; letter-spacing: 0.05em;">
                        <tr>
                            <th class="ps-4 py-3" style="width: 70px;">Mã SP</th>
                            <th style="width: 100px;">Hình Ảnh</th>
                            <th>Tên Sản Phẩm</th>
                            <th>Danh Mục</th>
                            <th class="text-end">Đơn Giá</th>
                            <th class="text-center">Số Lượng</th>
                            <th class="text-center">Trạng Thái</th>
                            <th class="pe-4 text-center" style="width: 120px;">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty sellerProducts}">
                                <c:forEach var="item" items="${sellerProducts}">
                                    <tr>
                                        <!-- Product ID -->
                                        <td class="ps-4 fw-bold text-muted">#${item.productId}</td>
                                        
                                        <!-- Image -->
                                        <td>
                                            <div class="rounded-3 overflow-hidden border p-1 shadow-2xs d-flex align-items-center justify-content-center" style="width: 64px; height: 64px; background: #fafafa;">
                                                <img src="${item.images}" alt="${item.productName}" class="img-fluid" style="max-height: 56px; object-fit: contain;">
                                            </div>
                                        </td>

                                        <!-- Name -->
                                        <td>
                                            <a href="<c:url value='/product/detail'><c:param name='id' value='${item.productId}'/></c:url>" class="text-decoration-none text-dark fw-bold hover-primary d-block">
                                                ${item.productName}
                                            </a>
                                            <small class="text-muted text-truncate d-block" style="max-width: 320px;">${item.description}</small>
                                        </td>

                                        <!-- Category -->
                                        <td>
                                            <span class="badge bg-light text-dark border px-2.5 py-1.5 rounded-pill fw-semibold">
                                                ${item.category != null ? item.category.categoryName : 'Chưa phân loại'}
                                            </span>
                                        </td>

                                        <!-- Price -->
                                        <td class="text-end fw-bold text-danger">
                                            <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                        </td>

                                        <!-- Amount / Stock -->
                                        <td class="text-center">
                                            <span class="badge ${item.amount > 10 ? 'bg-success bg-opacity-10 text-success' : 'bg-warning bg-opacity-10 text-warning'} px-3 py-1.5 rounded-pill fw-bold">
                                                ${item.amount} đôi
                                            </span>
                                        </td>

                                        <!-- Status -->
                                        <td class="text-center">
                                            <span class="badge bg-success bg-opacity-75 rounded-pill px-2.5 py-1 text-white">
                                                Đang bán
                                            </span>
                                        </td>

                                        <!-- Actions -->
                                        <td class="pe-4 text-center">
                                            <a href="<c:url value='/product/detail'><c:param name='id' value='${item.productId}'/></c:url>" 
                                               class="btn btn-sm btn-outline-dark rounded-pill px-3 py-1">
                                                <i class="fas fa-eye me-1"></i> Xem
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="8" class="text-center py-5">
                                        <div class="text-muted">
                                            <i class="fas fa-box-open fs-1 mb-3 text-secondary opacity-50 d-block"></i>
                                            Chưa có sản phẩm nào thuộc gian hàng của bạn.
                                        </div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
</body>
</html>
