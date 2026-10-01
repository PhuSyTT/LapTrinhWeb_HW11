<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Sản Phẩm (Product) — Admin Panel (24162109)</title>
</head>
<body>
<div class="card border-0 rounded-4 shadow-sm overflow-hidden" style="background: #ffffff; border: 1px solid #e2e8f0 !important;">
    
    <!-- Header of Table Card -->
    <div class="card-header bg-white p-4 border-bottom">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
            <div>
                <div class="d-flex align-items-center gap-2 mb-1">
                    <span class="badge bg-danger rounded-pill px-2.5 py-1 fw-bold">Câu 5: CRUD Product</span>
                    <span class="badge bg-dark rounded-pill px-2.5 py-1">MSSV: 24162109</span>
                </div>
                <h4 class="fw-bold font-display text-dark mb-0">Quản Lý Sản Phẩm Giày</h4>
                <small class="text-muted">Tổng cộng <strong>${totalItems}</strong> mẫu giày trong kho hệ thống</small>
            </div>

            <div class="d-flex align-items-center gap-2">
                <!-- Search Box -->
                <form action="<c:url value='/admin/product/list'/>" method="get" class="d-flex align-items-center">
                    <div class="input-group">
                        <input type="text" name="keyword" value="${keyword}" class="form-control rounded-start-pill py-2" placeholder="Tìm theo tên giày..." style="font-size: 13.5px;">
                        <button type="submit" class="btn btn-dark rounded-end-pill px-3">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>

                <!-- Add Button -->
                <a href="<c:url value='/admin/product/add'/>" class="btn btn-danger rounded-pill px-3 py-2 fw-bold d-flex align-items-center gap-2 shadow-sm text-nowrap" style="background-color: #e0148d; border-color: #e0148d;">
                    <i class="fas fa-plus"></i>
                    <span>Thêm Sản Phẩm</span>
                </a>
            </div>
        </div>
    </div>

    <!-- Alert Messages -->
    <c:if test="${not empty message}">
        <div class="m-4 mb-0 alert alert-success d-flex align-items-center rounded-3 py-2.5 px-3 border-0 shadow-sm" role="alert" style="background: #e6f9ed; color: #15803d;">
            <i class="fas fa-check-circle me-2 fs-5"></i>
            <div class="small fw-semibold">${message}</div>
        </div>
    </c:if>

    <!-- Table Body -->
    <div class="table-responsive">
        <table class="table align-middle table-hover mb-0">
            <thead class="table-light text-muted small text-uppercase" style="font-size: 11px; letter-spacing: 0.05em;">
                <tr>
                    <th class="ps-4 py-3" style="width: 60px;">ID</th>
                    <th style="width: 80px;">Hình Ảnh</th>
                    <th>Tên Sản Phẩm / Mã SP</th>
                    <th>Danh Mục</th>
                    <th>Cửa Hàng (Seller)</th>
                    <th class="text-end">Đơn Giá</th>
                    <th class="text-center">Tồn Kho</th>
                    <th class="text-center">Trạng Thái</th>
                    <th class="pe-4 text-center" style="width: 170px;">Thao Tác</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty products}">
                        <c:forEach var="item" items="${products}">
                            <tr>
                                <!-- ID -->
                                <td class="ps-4 fw-bold text-muted font-monospace">#${item.productId}</td>
                                
                                <!-- Image -->
                                <td>
                                    <div class="rounded-3 overflow-hidden border p-1 shadow-2xs d-flex align-items-center justify-content-center" style="width: 58px; height: 58px; background: #fafafa;">
                                        <img src="${item.images}" alt="${item.productName}" class="img-fluid" style="max-height: 50px; object-fit: contain;">
                                    </div>
                                </td>

                                <!-- Product Name & Code -->
                                <td>
                                    <a href="<c:url value='/product/detail'><c:param name='id' value='${item.productId}'/></c:url>" 
                                       target="_blank" class="fw-bold text-dark text-decoration-none hover-primary d-block" style="font-size: 14px;">
                                        ${item.productName}
                                    </a>
                                    <span class="badge bg-light text-primary border font-monospace" style="font-size: 11px;">
                                        Mã: #${item.productCode != null ? item.productCode : item.productId}
                                    </span>
                                </td>

                                <!-- Category -->
                                <td>
                                    <span class="badge bg-light text-dark border px-2.5 py-1 rounded-pill fw-semibold" style="font-size: 11.5px;">
                                        ${item.category != null ? item.category.categoryName : 'Chưa phân loại'}
                                    </span>
                                </td>

                                <!-- Seller -->
                                <td>
                                    <span class="small fw-semibold text-dark d-block">
                                        <i class="fas fa-store me-1 text-danger"></i>${item.seller != null ? item.seller.sellername : 'Nike Store'}
                                    </span>
                                    <small class="text-muted" style="font-size: 10.5px;">Mã Seller: #${item.seller != null ? item.seller.sellerId : 1}</small>
                                </td>

                                <!-- Price -->
                                <td class="text-end fw-bold text-danger">
                                    <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                </td>

                                <!-- Amount / Stock -->
                                <td class="text-center">
                                    <span class="badge ${item.amount > 10 ? 'bg-success bg-opacity-10 text-success' : 'bg-warning bg-opacity-10 text-warning'} rounded-pill px-2.5 py-1 fw-bold" style="font-size: 11.5px;">
                                        ${item.amount} đôi
                                    </span>
                                </td>

                                <!-- Status -->
                                <td class="text-center">
                                    <span class="badge ${item.status == 1 ? 'bg-success bg-opacity-75 text-white' : 'bg-secondary bg-opacity-75 text-white'} rounded-pill px-2.5 py-1 small">
                                        ${item.status == 1 ? 'Đang bán' : 'Tạm ẩn'}
                                    </span>
                                </td>

                                <!-- Action Buttons -->
                                <td class="pe-4 text-center">
                                    <div class="d-inline-flex align-items-center gap-1">
                                        <a href="<c:url value='/product/detail'><c:param name='id' value='${item.productId}'/></c:url>" 
                                           class="btn btn-sm btn-outline-secondary rounded-pill px-2 py-0.5" target="_blank" title="Xem demo chi tiết">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="<c:url value='/admin/product/edit'><c:param name='id' value='${item.productId}'/></c:url>" 
                                           class="btn btn-sm btn-outline-dark rounded-pill px-2 py-0.5" title="Chỉnh sửa">
                                            <i class="fas fa-edit text-primary"></i>
                                        </a>
                                        <a href="<c:url value='/admin/product/delete'><c:param name='id' value='${item.productId}'/></c:url>" 
                                           class="btn btn-sm btn-outline-danger rounded-pill px-2 py-0.5" 
                                           onclick="return confirm('Bạn có chắc muốn xóa sản phẩm \'${item.productName}\' không?');" 
                                           title="Xóa sản phẩm">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="9" class="text-center py-5">
                                <div class="text-muted">
                                    <i class="fas fa-box-open fs-1 mb-2 opacity-50 d-block"></i>
                                    Không tìm thấy sản phẩm nào phù hợp.
                                </div>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>

    <!-- Pagination Footer -->
    <div class="card-footer bg-white p-3 border-top d-flex flex-wrap align-items-center justify-content-between gap-3">
        <span class="small text-muted">
            Trang <strong>${currentPage}</strong> trên tổng số <strong>${totalPages}</strong> trang (Mỗi trang 5 sản phẩm)
        </span>

        <c:if test="${totalPages > 1}">
            <nav aria-label="Pagination">
                <ul class="pagination pagination-sm mb-0">
                    <!-- Nút Trước -->
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link rounded-start-pill px-3" href="<c:url value='/admin/product/list'><c:param name='page' value='${currentPage - 1}'/><c:if test='${not empty keyword}'><c:param name='keyword' value='${keyword}'/></c:if></c:url>">
                            <i class="fas fa-chevron-left me-1"></i> Trước
                        </a>
                    </li>

                    <!-- Các số trang -->
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link px-3 ${currentPage == i ? 'bg-dark border-dark text-white' : ''}" href="<c:url value='/admin/product/list'><c:param name='page' value='${i}'/><c:if test='${not empty keyword}'><c:param name='keyword' value='${keyword}'/></c:if></c:url>">
                                ${i}
                            </a>
                        </li>
                    </c:forEach>

                    <!-- Nút Sau -->
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link rounded-end-pill px-3" href="<c:url value='/admin/product/list'><c:param name='page' value='${currentPage + 1}'/><c:if test='${not empty keyword}'><c:param name='keyword' value='${keyword}'/></c:if></c:url>">
                            Sau <i class="fas fa-chevron-right ms-1"></i>
                        </a>
                    </li>
                </ul>
            </nav>
        </c:if>
    </div>

</div>
</body>
</html>
