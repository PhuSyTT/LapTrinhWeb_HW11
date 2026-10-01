<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product.productName} — Chi Tiết Sản Phẩm (AURA KICKS)</title>
    <style>
        .product-detail-box {
            background: #ffffff;
            border-radius: 24px;
            border: 1px solid rgba(226, 232, 240, 0.9);
            box-shadow: 0 20px 40px -15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        .product-image-container {
            background: radial-gradient(circle at center, #f8fafc 0%, #f1f5f9 100%);
            border-radius: 20px;
            padding: 3rem;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 440px;
            position: relative;
        }
        .product-image-container img {
            max-height: 340px;
            max-width: 100%;
            object-fit: contain;
            filter: drop-shadow(0 20px 30px rgba(0, 0, 0, 0.15));
            transition: transform 0.4s ease;
        }
        .product-image-container:hover img {
            transform: scale(1.06) rotate(-2deg);
        }
        .detail-table-card {
            background: #f8fafc;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
            overflow: hidden;
        }
        .detail-row {
            display: flex;
            padding: 14px 20px;
            border-bottom: 1px solid #edf2f7;
            align-items: flex-start;
        }
        .detail-row:last-child {
            border-bottom: none;
        }
        .detail-label {
            width: 150px;
            flex-shrink: 0;
            font-size: 13.5px;
            font-weight: 700;
            color: #475569;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }
        .detail-value {
            flex-grow: 1;
            font-size: 15px;
            color: #0f172a;
        }
    </style>
</head>
<body>
<div class="py-4 py-lg-5">
    <div class="container-fluid px-lg-5">

        <!-- Breadcrumb Navigation -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb small">
                <li class="breadcrumb-item"><a href="<c:url value='/home'/>" class="text-decoration-none text-muted">Trang Chủ</a></li>
                <li class="breadcrumb-item"><a href="<c:url value='/products'/>" class="text-decoration-none text-muted">Sản Phẩm Theo Seller</a></li>
                <li class="breadcrumb-item active text-dark fw-bold" aria-current="page">${product.productName}</li>
            </ol>
        </nav>

        <!-- Main Product Detail Card (Table Layout matching Câu 4 Template) -->
        <div class="product-detail-box p-4 p-lg-5 mb-5">
            
            <!-- Header Tag -->
            <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4 pb-3 border-bottom">
                <div class="d-flex align-items-center gap-2">
                    <span class="badge bg-danger px-3 py-2 rounded-pill fw-bold text-uppercase" style="letter-spacing: 0.05em;">
                        <i class="fas fa-certificate me-1"></i> Câu 4: Chi Tiết Sản Phẩm
                    </span>
                    <span class="badge bg-dark px-3 py-2 rounded-pill">
                        MSSV: 24162109 • Đề 05
                    </span>
                </div>
                <a href="<c:url value='/products'/>" class="btn btn-sm btn-outline-dark rounded-pill px-3 py-1.5 fw-semibold">
                    <i class="fas fa-arrow-left me-1"></i> Quay Lại Danh Sách
                </a>
            </div>

            <!-- Content Row matching the 2-column layout template in exam paper -->
            <div class="row g-4 g-lg-5 align-items-center">
                
                <!-- CỘT 1: [imageLink] (Hình ảnh sản phẩm) -->
                <div class="col-lg-5">
                    <div class="product-image-container">
                        <!-- Category floating badge -->
                        <span class="badge bg-dark bg-opacity-75 text-white position-absolute top-0 start-0 m-4 px-3 py-1.5 rounded-pill shadow-sm">
                            ${product.category != null ? product.category.categoryName : 'Giày Sneaker'}
                        </span>
                        
                        <!-- [imageLink] -->
                        <img src="${product.images.startsWith('http') ? product.images : (pageContext.request.contextPath.concat('/assets/images/').concat(product.images))}" 
                             alt="${product.productName}" 
                             class="img-fluid select-none"
                             style="max-height: 320px; object-fit: contain;"
                             onerror="this.src='${pageContext.request.contextPath}/assets/images/sneaker_hero.png'">
                    </div>
                </div>

                <!-- CỘT 2: THÔNG TIN CHI TIẾT THEO MẪU ĐỀ THI -->
                <div class="col-lg-7">
                    
                    <div class="detail-table-card shadow-2xs">
                        
                        <!-- Tên sản phẩm: -->
                        <div class="detail-row" style="background: #ffffff;">
                            <div class="detail-label text-dark pt-1">Tên sản phẩm:</div>
                            <div class="detail-value">
                                <h3 class="font-display fw-bold text-dark mb-0 fs-4">${product.productName}</h3>
                            </div>
                        </div>

                        <!-- Mã sản phẩm: -->
                        <div class="detail-row">
                            <div class="detail-label">Mã sản phẩm:</div>
                            <div class="detail-value">
                                <span class="badge bg-dark text-white px-3 py-1.5 rounded-pill font-monospace fw-bold fs-6">
                                    #${product.productCode != null ? product.productCode : product.productId}
                                </span>
                                <small class="text-muted ms-2">(ID hệ thống: #${product.productId})</small>
                            </div>
                        </div>

                        <!-- Danh mục: -->
                        <div class="detail-row">
                            <div class="detail-label">Danh mục:</div>
                            <div class="detail-value">
                                <span class="badge bg-light text-dark border px-3 py-1.5 rounded-pill fw-bold">
                                    <i class="fas fa-tag me-1 text-danger"></i>
                                    ${product.category != null ? product.category.categoryName : 'Chưa phân loại'}
                                </span>
                            </div>
                        </div>

                        <!-- Giá: -->
                        <div class="detail-row" style="background: #fff5f8;">
                            <div class="detail-label text-danger pt-1">Giá:</div>
                            <div class="detail-value">
                                <span class="text-danger fw-bold display-6 font-display">
                                    <fmt:formatNumber value="${product.price}" pattern="#,###"/> ₫
                                </span>
                            </div>
                        </div>

                        <!-- Amount: -->
                        <div class="detail-row">
                            <div class="detail-label">Amount:</div>
                            <div class="detail-value">
                                <span class="badge ${product.amount > 10 ? 'bg-success bg-opacity-10 text-success' : 'bg-warning bg-opacity-10 text-warning'} px-3 py-1.5 rounded-pill fw-bold fs-6">
                                    <i class="fas fa-cubes me-1"></i> ${product.amount} đôi trong kho
                                </span>
                            </div>
                        </div>

                        <!-- Description: -->
                        <div class="detail-row">
                            <div class="detail-label">Description:</div>
                            <div class="detail-value text-secondary" style="line-height: 1.7;">
                                ${not empty product.description ? product.description : 'Đang cập nhật mô tả chi tiết cho sản phẩm này.'}
                            </div>
                        </div>

                    </div>

                    <!-- Seller Extra Info Deck -->
                    <div class="mt-4 p-3 rounded-4 d-flex flex-wrap align-items-center justify-content-between gap-3" 
                         style="background: #ffffff; border: 1px dashed #cbd5e1;">
                        <div class="d-flex align-items-center gap-3">
                            <img src="${product.seller != null and not empty product.seller.images ? product.seller.images : 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200'}" 
                                 alt="Seller Avatar" 
                                 class="rounded-circle border" width="44" height="44" style="object-fit: cover;">
                            <div>
                                <small class="text-muted text-uppercase d-block" style="font-size: 10px; font-weight: 700;">Nhà bán hàng (Seller)</small>
                                <strong class="text-dark">${product.seller != null ? product.seller.sellername : 'AURA KICKS Store'}</strong>
                                <span class="badge bg-secondary ms-1" style="font-size: 10.5px;">Mã Seller: #${product.seller != null ? product.seller.sellerId : 1}</span>
                            </div>
                        </div>

                        <div class="d-flex align-items-center gap-2">
                            <a href="<c:url value='/products#seller-${product.seller != null ? product.seller.sellerId : 1}'/>" 
                               class="btn btn-sm btn-dark rounded-pill px-3 py-1.5 fw-bold">
                                <i class="fas fa-store me-1 text-danger"></i> Xem Gian Hàng
                            </a>
                        </div>
                    </div>

                    <!-- Action Buttons: Thêm vào giỏ hàng & Mua Ngay COD -->
                    <form action="<c:url value='/cart/add'/>" method="post" class="mt-4">
                        <input type="hidden" name="productId" value="${product.productId}">
                        
                        <div class="d-flex flex-wrap align-items-center gap-3 mb-3">
                            <label class="fw-bold small text-secondary">Số lượng chọn mua:</label>
                            <div class="d-inline-flex align-items-center border rounded-pill bg-white px-2 py-1 shadow-xs">
                                <button type="button" class="btn btn-sm btn-link text-dark text-decoration-none fw-bold px-2 py-0" onclick="changeQty(-1)">-</button>
                                <input type="number" id="detailQty" name="quantity" value="1" min="1" max="${product.amount}" 
                                       class="form-control form-control-sm text-center border-0 fw-bold p-0" style="width: 50px;">
                                <button type="button" class="btn btn-sm btn-link text-dark text-decoration-none fw-bold px-2 py-0" onclick="changeQty(1)">+</button>
                            </div>
                            <small class="text-muted">(Tối đa ${product.amount} đôi)</small>
                        </div>

                        <div class="d-flex flex-wrap gap-3">
                            <button type="submit" class="btn btn-dark rounded-pill px-4 py-2.5 fw-bold d-flex align-items-center gap-2 shadow-sm" style="background-color: #0d131f;">
                                <i class="fas fa-shopping-bag text-warning"></i>
                                <span>Thêm Vào Giỏ Hàng</span>
                            </button>
                            <button type="submit" name="buyNow" value="true" class="btn btn-danger rounded-pill px-4 py-2.5 fw-bold d-flex align-items-center gap-2 shadow-sm" style="background-color: #e0148d; border-color: #e0148d;">
                                <i class="fas fa-bolt"></i>
                                <span>Mua Ngay (COD)</span>
                            </button>
                        </div>
                    </form>
                    
                    <script>
                        function changeQty(delta) {
                            var input = document.getElementById('detailQty');
                            var current = parseInt(input.value) || 1;
                            var max = parseInt(input.getAttribute('max')) || 99;
                            var updated = current + delta;
                            if (updated < 1) updated = 1;
                            if (updated > max) updated = max;
                            input.value = updated;
                        }
                    </script>

                </div>

            </div>

        </div>

    </div>
</div>
</body>
</html>
