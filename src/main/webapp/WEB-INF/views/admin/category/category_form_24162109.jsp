<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${isEdit ? 'Chỉnh Sửa Danh Mục' : 'Thêm Danh Mục Mới'} — Admin Panel (24162109)</title>
</head>
<body>
<div class="row justify-content-center">
    <div class="col-12 col-lg-8">
        
        <div class="card border-0 rounded-4 shadow-sm overflow-hidden" style="background: #ffffff; border: 1px solid #e2e8f0 !important;">
            
            <!-- Card Header -->
            <div class="card-header bg-white p-4 border-bottom d-flex align-items-center justify-content-between">
                <div>
                    <span class="badge bg-danger rounded-pill px-2.5 py-1 fw-bold mb-1">
                        ${isEdit ? 'Cập Nhật Danh Mục' : 'Tạo Mới Danh Mục'}
                    </span>
                    <h4 class="fw-bold font-display text-dark mb-0">
                        ${isEdit ? 'Chỉnh Sửa Thông Tin Danh Mục' : 'Thêm Danh Mục Sản Phẩm Mới'}
                    </h4>
                </div>
                <a href="<c:url value='/admin/category/list'/>" class="btn btn-sm btn-outline-dark rounded-pill px-3 py-1.5 fw-semibold">
                    <i class="fas fa-arrow-left me-1"></i> Quay lại
                </a>
            </div>

            <!-- Card Body -->
            <div class="card-body p-4 p-lg-5">

                <!-- Error Alert -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger d-flex align-items-center rounded-3 py-2 px-3 mb-4 border-0 shadow-sm" role="alert" style="background: #fee2e2; color: #b91c1c;">
                        <i class="fas fa-exclamation-circle me-2 fs-5"></i>
                        <div class="small fw-semibold">${error}</div>
                    </div>
                </c:if>

                <form action="<c:url value='${isEdit ? \"/admin/category/edit\" : \"/admin/category/add\"}'/>" method="post">
                    
                    <c:if test="${isEdit}">
                        <!-- Category ID (Hidden for Edit) -->
                        <input type="hidden" name="categoryId" value="${category.categoryId}">
                        
                        <div class="mb-3">
                            <label class="form-label text-muted small fw-bold">Mã danh mục (ID)</label>
                            <input type="text" class="form-control rounded-3 bg-light text-muted font-monospace" value="#${category.categoryId}" readonly>
                        </div>
                    </c:if>

                    <!-- Category Name -->
                    <div class="mb-3">
                        <label class="form-label text-dark small fw-bold" for="catName">
                            Tên danh mục <span class="text-danger">*</span>
                        </label>
                        <input type="text" class="form-control rounded-3 py-2" id="catName" name="categoryName" 
                               value="${category != null ? category.categoryName : ''}" 
                               placeholder="vd: Giày Chạy Bộ (Running), Giày Sneaker..." required autofocus>
                    </div>

                    <!-- Images URL -->
                    <div class="mb-3">
                        <label class="form-label text-dark small fw-bold" for="catImage">
                            URL Hình ảnh đại diện
                        </label>
                        <input type="url" class="form-control rounded-3 py-2" id="catImage" name="images" 
                               value="${category != null ? category.images : ''}" 
                               placeholder="https://images.unsplash.com/...">
                        <small class="text-muted">Nhập đường link hình ảnh (Unsplash, CDN hoặc link ảnh sản phẩm trực tuyến)</small>
                    </div>

                    <!-- Status -->
                    <div class="mb-4">
                        <label class="form-label text-dark small fw-bold" for="catStatus">
                            Trạng thái hiển thị
                        </label>
                        <select class="form-select rounded-3 py-2" id="catStatus" name="status">
                            <option value="1" ${category == null or category.status == 1 ? 'selected' : ''}>1 - Hoạt động (Hiển thị trên website)</option>
                            <option value="0" ${category != null and category.status == 0 ? 'selected' : ''}>0 - Tạm ẩn (Không hiển thị)</option>
                        </select>
                    </div>

                    <!-- Submit Buttons -->
                    <div class="d-flex align-items-center gap-3 pt-3 border-top">
                        <button type="submit" class="btn btn-dark rounded-pill px-4 py-2.5 fw-bold d-flex align-items-center gap-2 shadow-sm" style="background-color: #0d131f;">
                            <i class="fas fa-save text-success"></i>
                            <span>${isEdit ? 'Lưu Thay Đổi' : 'Tạo Danh Mục Ngay'}</span>
                        </button>
                        <a href="<c:url value='/admin/category/list'/>" class="btn btn-outline-secondary rounded-pill px-4 py-2.5 fw-semibold">
                            Hủy Bỏ
                        </a>
                    </div>

                </form>

            </div>

        </div>

    </div>
</div>
</body>
</html>
