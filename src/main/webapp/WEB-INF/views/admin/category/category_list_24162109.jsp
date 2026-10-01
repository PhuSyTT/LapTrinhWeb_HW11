<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản Lý Danh Mục (Category) — Admin Panel (24162109)</title>
</head>
<body>
<div class="card border-0 rounded-4 shadow-sm overflow-hidden" style="background: #ffffff; border: 1px solid #e2e8f0 !important;">
    
    <!-- Header of Table Card -->
    <div class="card-header bg-white p-4 border-bottom">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
            <div>
                <div class="d-flex align-items-center gap-2 mb-1">
                    <span class="badge bg-danger rounded-pill px-2.5 py-1 fw-bold">Câu 5: CRUD Category</span>
                    <span class="badge bg-dark rounded-pill px-2.5 py-1">MSSV: 24162109</span>
                </div>
                <h4 class="fw-bold font-display text-dark mb-0">Quản Lý Danh Mục Sản Phẩm</h4>
                <small class="text-muted">Tổng cộng <strong>${totalItems}</strong> danh mục trong hệ thống</small>
            </div>

            <div class="d-flex align-items-center gap-2">
                <!-- Search Box -->
                <form action="<c:url value='/admin/category/list'/>" method="get" class="d-flex align-items-center">
                    <div class="input-group">
                        <input type="text" name="keyword" value="${keyword}" class="form-control rounded-start-pill py-2" placeholder="Tìm theo tên..." style="font-size: 13.5px;">
                        <button type="submit" class="btn btn-dark rounded-end-pill px-3">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>

                <!-- Add Button -->
                <a href="<c:url value='/admin/category/add'/>" class="btn btn-danger rounded-pill px-3 py-2 fw-bold d-flex align-items-center gap-2 shadow-sm text-nowrap" style="background-color: #e0148d; border-color: #e0148d;">
                    <i class="fas fa-plus"></i>
                    <span>Thêm Danh Mục</span>
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
            <thead class="table-light text-muted small text-uppercase" style="font-size: 11.5px; letter-spacing: 0.05em;">
                <tr>
                    <th class="ps-4 py-3" style="width: 80px;">ID</th>
                    <th style="width: 100px;">Hình Ảnh</th>
                    <th>Tên Danh Mục</th>
                    <th class="text-center" style="width: 140px;">Trạng Thái</th>
                    <th class="pe-4 text-center" style="width: 160px;">Thao Tác</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty categories}">
                        <c:forEach var="cat" items="${categories}">
                            <tr>
                                <!-- ID -->
                                <td class="ps-4 fw-bold text-muted font-monospace">#${cat.categoryId}</td>
                                
                                <!-- Image -->
                                <td>
                                    <div class="rounded-3 overflow-hidden border p-1 shadow-2xs d-flex align-items-center justify-content-center" style="width: 60px; height: 60px; background: #fafafa;">
                                        <img src="${not empty cat.images ? cat.images : 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500'}" 
                                             alt="${cat.categoryName}" class="img-fluid" style="max-height: 52px; object-fit: contain;">
                                    </div>
                                </td>

                                <!-- Category Name -->
                                <td>
                                    <span class="fw-bold text-dark fs-6">${cat.categoryName}</span>
                                </td>

                                <!-- Status -->
                                <td class="text-center">
                                    <span class="badge ${cat.status == 1 ? 'bg-success bg-opacity-10 text-success' : 'bg-secondary bg-opacity-10 text-secondary'} rounded-pill px-3 py-1.5 fw-semibold">
                                        <i class="fas ${cat.status == 1 ? 'fa-check-circle' : 'fa-minus-circle'} me-1"></i>
                                        ${cat.status == 1 ? 'Hoạt động' : 'Tạm ẩn'}
                                    </span>
                                </td>

                                <!-- Action Buttons -->
                                <td class="pe-4 text-center">
                                    <div class="d-inline-flex align-items-center gap-1">
                                        <a href="<c:url value='/admin/category/edit'><c:param name='id' value='${cat.categoryId}'/></c:url>" 
                                           class="btn btn-sm btn-outline-dark rounded-pill px-2.5 py-1" title="Chỉnh sửa">
                                            <i class="fas fa-edit me-1 text-primary"></i> Sửa
                                        </a>
                                        <a href="<c:url value='/admin/category/delete'><c:param name='id' value='${cat.categoryId}'/></c:url>" 
                                           class="btn btn-sm btn-outline-danger rounded-pill px-2.5 py-1" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục \'${cat.categoryName}\' không?');" 
                                           title="Xóa danh mục">
                                            <i class="fas fa-trash-alt me-1"></i> Xóa
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="text-center py-5">
                                <div class="text-muted">
                                    <i class="fas fa-folder-open fs-1 mb-2 opacity-50 d-block"></i>
                                    Không tìm thấy danh mục nào phù hợp.
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
            Trang <strong>${currentPage}</strong> trên tổng số <strong>${totalPages}</strong> trang (Mỗi trang 5 danh mục)
        </span>

        <c:if test="${totalPages > 1}">
            <nav aria-label="Pagination">
                <ul class="pagination pagination-sm mb-0">
                    <!-- Nút Trước -->
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link rounded-start-pill px-3" href="<c:url value='/admin/category/list'><c:param name='page' value='${currentPage - 1}'/><c:if test='${not empty keyword}'><c:param name='keyword' value='${keyword}'/></c:if></c:url>">
                            <i class="fas fa-chevron-left me-1"></i> Trước
                        </a>
                    </li>

                    <!-- Các số trang -->
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link px-3 ${currentPage == i ? 'bg-dark border-dark text-white' : ''}" href="<c:url value='/admin/category/list'><c:param name='page' value='${i}'/><c:if test='${not empty keyword}'><c:param name='keyword' value='${keyword}'/></c:if></c:url>">
                                ${i}
                            </a>
                        </li>
                    </c:forEach>

                    <!-- Nút Sau -->
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link rounded-end-pill px-3" href="<c:url value='/admin/category/list'><c:param name='page' value='${currentPage + 1}'/><c:if test='${not empty keyword}'><c:param name='keyword' value='${keyword}'/></c:if></c:url>">
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
