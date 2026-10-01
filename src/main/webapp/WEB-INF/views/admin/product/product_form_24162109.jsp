<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${isEdit ? 'Chỉnh Sửa Sản Phẩm' : 'Thêm Sản Phẩm Mới'} — Admin Panel (24162109)</title>
</head>
<body>
<div class="row justify-content-center">
    <div class="col-12 col-xl-10">
        
        <div class="card border-0 rounded-4 shadow-sm overflow-hidden" style="background: #ffffff; border: 1px solid #e2e8f0 !important;">
            
            <!-- Card Header -->
            <div class="card-header bg-white p-4 border-bottom d-flex align-items-center justify-content-between">
                <div>
                    <span class="badge bg-danger rounded-pill px-2.5 py-1 fw-bold mb-1">
                        ${isEdit ? 'Cập Nhật Sản Phẩm' : 'Tạo Mới Sản Phẩm'}
                    </span>
                    <h4 class="fw-bold font-display text-dark mb-0">
                        ${isEdit ? 'Chỉnh Sửa Thông Tin Sản Phẩm Giày' : 'Thêm Sản Phẩm Giày Mới'}
                    </h4>
                </div>
                <a href="<c:url value='/admin/product/list'/>" class="btn btn-sm btn-outline-dark rounded-pill px-3 py-1.5 fw-semibold">
                    <i class="fas fa-arrow-left me-1"></i> Quay lại danh sách
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

                <form action="<c:url value='${isEdit ? \"/admin/product/edit\" : \"/admin/product/add\"}'/>" method="post">
                    
                    <c:if test="${isEdit}">
                        <!-- Product ID (Hidden for Edit) -->
                        <input type="hidden" name="productId" value="${product.productId}">
                    </c:if>

                    <div class="row g-3">
                        <!-- Product Name -->
                        <div class="col-12 col-md-8">
                            <label class="form-label text-dark small fw-bold" for="pName">
                                Tên sản phẩm giày <span class="text-danger">*</span>
                            </label>
                            <input type="text" class="form-control rounded-3 py-2" id="pName" name="productName" 
                                   value="${product != null ? product.productName : ''}" 
                                   placeholder="vd: Giày Nike Air Jordan 1 Retro..." required autofocus>
                        </div>

                        <!-- Product Code -->
                        <div class="col-12 col-md-4">
                            <label class="form-label text-dark small fw-bold" for="pCode">
                                Mã sản phẩm (Code)
                            </label>
                            <input type="number" class="form-control rounded-3 py-2 font-monospace" id="pCode" name="productCode" 
                                   value="${product != null ? product.productCode : ''}" 
                                   placeholder="vd: 101, 201...">
                        </div>

                        <!-- Category -->
                        <div class="col-12 col-md-6">
                            <label class="form-label text-dark small fw-bold" for="pCat">
                                Danh mục sản phẩm <span class="text-danger">*</span>
                            </label>
                            <select class="form-select rounded-3 py-2" id="pCat" name="categoryId" required>
                                <option value="">-- Chọn danh mục --</option>
                                <c:forEach var="cat" items="${categories}">
                                    <option value="${cat.categoryId}" ${product != null and product.category != null and product.category.categoryId == cat.categoryId ? 'selected' : ''}>
                                        ${cat.categoryName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Seller -->
                        <div class="col-12 col-md-6">
                            <label class="form-label text-dark small fw-bold" for="pSeller">
                                Cửa hàng phân phối (Seller) <span class="text-danger">*</span>
                            </label>
                            <select class="form-select rounded-3 py-2" id="pSeller" name="sellerId" required>
                                <option value="">-- Chọn cửa hàng --</option>
                                <c:forEach var="s" items="${sellers}">
                                    <option value="${s.sellerId}" ${product != null and product.seller != null and product.seller.sellerId == s.sellerId ? 'selected' : ''}>
                                        [Mã ${s.sellerId}] ${s.sellername}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Price -->
                        <div class="col-12 col-md-4">
                            <label class="form-label text-dark small fw-bold" for="pPrice">
                                Đơn giá (VNĐ) <span class="text-danger">*</span>
                            </label>
                            <input type="number" step="1000" class="form-control rounded-3 py-2" id="pPrice" name="price" 
                                   value="${product != null ? product.price : ''}" 
                                   placeholder="vd: 3500000" required>
                        </div>

                        <!-- Amount (Số lượng tồn tức thời) -->
                        <div class="col-12 col-md-4">
                            <label class="form-label text-dark small fw-bold" for="pAmount">
                                Số lượng tồn kho (Amount) <span class="text-danger">*</span>
                            </label>
                            <input type="number" class="form-control rounded-3 py-2" id="pAmount" name="amount" 
                                   value="${product != null ? product.amount : 20}" 
                                   placeholder="vd: 20" required>
                        </div>

                        <!-- Stock (Tổng kho) -->
                        <div class="col-12 col-md-4">
                            <label class="form-label text-dark small fw-bold" for="pStock">
                                Tổng nhập kho (Stock)
                            </label>
                            <input type="number" class="form-control rounded-3 py-2" id="pStock" name="stock" 
                                   value="${product != null ? product.stock : 50}" 
                                   placeholder="vd: 50">
                        </div>

                        <!-- Image URL -->
                        <div class="col-12">
                            <label class="form-label text-dark small fw-bold" for="pImage">
                                URL Hình ảnh sản phẩm
                            </label>
                            <input type="url" class="form-control rounded-3 py-2" id="pImage" name="images" 
                                   value="${product != null ? product.images : ''}" 
                                   placeholder="https://images.unsplash.com/...">
                        </div>

                        <!-- Description -->
                        <div class="col-12">
                            <label class="form-label text-dark small fw-bold" for="pDesc">
                                Mô tả chi tiết sản phẩm
                            </label>
                            <textarea class="form-control rounded-3 py-2" id="pDesc" name="description" rows="3" 
                                      placeholder="Mô tả chất liệu, thiết kế, công nghệ đệm giày...">${product != null ? product.description : ''}</textarea>
                        </div>

                        <!-- Status -->
                        <div class="col-12 col-md-6">
                            <label class="form-label text-dark small fw-bold" for="pStatus">
                                Trạng thái kinh doanh
                            </label>
                            <select class="form-select rounded-3 py-2" id="pStatus" name="status">
                                <option value="1" ${product == null or product.status == 1 ? 'selected' : ''}>1 - Đang bán (Hiển thị storefront)</option>
                                <option value="0" ${product != null and product.status == 0 ? 'selected' : ''}>0 - Tạm ẩn (Ngừng kinh doanh)</option>
                            </select>
                        </div>
                    </div>

                    <!-- Submit Buttons -->
                    <div class="d-flex align-items-center gap-3 pt-4 mt-4 border-top">
                        <button type="submit" class="btn btn-dark rounded-pill px-4 py-2.5 fw-bold d-flex align-items-center gap-2 shadow-sm" style="background-color: #0d131f;">
                            <i class="fas fa-save text-success"></i>
                            <span>${isEdit ? 'Lưu Thay Đổi Sản Phẩm' : 'Đăng Bán Sản Phẩm Mới'}</span>
                        </button>
                        <a href="<c:url value='/admin/product/list'/>" class="btn btn-outline-secondary rounded-pill px-4 py-2.5 fw-semibold">
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
