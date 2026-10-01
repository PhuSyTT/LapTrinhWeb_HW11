<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sản Phẩm Theo Từng Seller — AURA KICKS (Đề số 05)</title>
    <style>
        .seller-section-card {
            background: #ffffff;
            border-radius: 20px;
            border: 1px solid rgba(226, 232, 240, 0.8);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.04), 0 8px 10px -6px rgba(0, 0, 0, 0.02);
            transition: all 0.3s ease;
        }
        .seller-badge-tag {
            background: #0d131f;
            color: #ffffff;
            font-size: 13px;
            font-weight: 700;
            padding: 6px 14px;
            border-radius: 9999px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .shoe-item-card {
            background: #ffffff;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            overflow: hidden;
            display: flex;
            flex-column: column;
            height: 100%;
        }
        .shoe-item-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 16px 32px -8px rgba(15, 23, 42, 0.12);
            border-color: #cbd5e1;
        }
        .shoe-img-wrapper {
            position: relative;
            background: #f8fafc;
            padding: 24px;
            text-align: center;
            overflow: hidden;
            height: 220px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .shoe-img-wrapper img {
            max-height: 170px;
            max-width: 100%;
            object-fit: contain;
            transition: transform 0.35s ease;
        }
        .shoe-item-card:hover .shoe-img-wrapper img {
            transform: scale(1.08) rotate(-2deg);
        }
        .field-label {
            font-size: 11.5px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.04em;
            color: #64748b;
        }
        .field-value {
            font-size: 13.5px;
            color: #0f172a;
        }
        .product-title-link {
            color: #0f172a;
            font-weight: 700;
            font-size: 15px;
            line-height: 1.4;
            text-decoration: none;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height: 42px;
            transition: color 0.2s ease;
        }
        .product-title-link:hover {
            color: #e0148d;
        }
    </style>
</head>
<body>
<div class="py-4 py-lg-5">
    <div class="container-fluid px-lg-5">

        <!-- Top Header & Breadcrumb -->
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4 pb-2 border-bottom">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-1 small">
                        <li class="breadcrumb-item"><a href="<c:url value='/home'/>" class="text-decoration-none text-muted">Trang Chủ</a></li>
                        <li class="breadcrumb-item active text-dark fw-bold" aria-current="page">Sản Phẩm Theo Seller</li>
                    </ol>
                </nav>
                <h2 class="font-display fw-bold text-dark display-6 mb-1">
                    Tất Cả Sản Phẩm Theo Từng Seller
                </h2>
                <p class="text-muted small mb-0">
                    Hiển thị sản phẩm gom theo từng đối tác kinh doanh (Mã cửa hàng: SellerID) — Yêu cầu Câu 3 Đề số 05
                </p>
            </div>

            <!-- Total Products Badge & Fast Scroll Links -->
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-dark text-white px-3 py-2 rounded-pill fw-bold" style="font-size: 13px;">
                    <i class="fas fa-boxes me-1 text-warning"></i> Tổng: ${totalCount} Sản Phẩm
                </span>
                <span class="badge bg-danger text-white px-3 py-2 rounded-pill fw-bold" style="font-size: 13px;">
                    <i class="fas fa-store me-1"></i> ${productsBySeller.size()} Cửa Hàng
                </span>
            </div>
        </div>

        <!-- Quick Jump Nav Pills -->
        <div class="d-flex flex-wrap align-items-center gap-2 mb-4 p-2 bg-white rounded-pill border shadow-2xs">
            <span class="fw-bold small text-muted px-3 d-none d-md-inline">
                <i class="fas fa-filter me-1 text-danger"></i> Chuyển nhanh đến:
            </span>
            <c:forEach var="group" items="${productsBySeller}">
                <a href="#seller-${group.key.sellerId}" class="btn btn-sm btn-outline-dark rounded-pill fw-semibold px-3 py-1">
                    <i class="fas fa-store me-1 text-secondary"></i>
                    <strong>Mã ${group.key.sellerId}:</strong> ${group.key.sellername} (${group.value.size()})
                </a>
            </c:forEach>
        </div>

        <!-- Main Content: Loop through each Seller and display its products -->
        <c:choose>
            <c:when test="${not empty productsBySeller}">
                <c:forEach var="group" items="${productsBySeller}">
                    <c:set var="seller" value="${group.key}" />
                    <c:set var="productList" value="${group.value}" />

                    <!-- SELLER GROUP CONTAINER -->
                    <div class="seller-section-card p-4 p-lg-5 mb-5" id="seller-${seller.sellerId}">
                        
                        <!-- Seller Header Banner (Mã cửa hàng) -->
                        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 pb-4 mb-4 border-bottom">
                            <div class="d-flex align-items-center gap-3">
                                <!-- Seller Logo -->
                                <div class="rounded-circle border border-2 border-dark p-1 shadow-sm d-flex align-items-center justify-content-center bg-white" style="width: 58px; height: 58px;">
                                    <img src="${not empty seller.images ? seller.images : 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=200'}" 
                                         alt="${seller.sellername}" 
                                         class="rounded-circle" 
                                         width="48" height="48" style="object-fit: cover;">
                                </div>
                                
                                <div>
                                    <!-- Mã cửa hàng (Yêu cầu bắt buộc đề bài) -->
                                    <div class="d-flex align-items-center gap-2 mb-1">
                                        <span class="seller-badge-tag">
                                            <i class="fas fa-id-badge text-warning"></i>
                                            Mã cửa hàng: <strong class="fs-6">${seller.sellerId}</strong>
                                        </span>
                                        <span class="badge bg-success bg-opacity-75 rounded-pill px-2.5 py-1 text-white small">
                                            <i class="fas fa-check-circle me-1"></i>Đối tác xác thực
                                        </span>
                                    </div>
                                    <h4 class="fw-bold font-display text-dark mb-0">${seller.sellername}</h4>
                                </div>
                            </div>

                            <div class="d-flex align-items-center gap-2">
                                <span class="badge bg-light text-dark border px-3 py-2 rounded-pill fw-bold">
                                    <i class="fas fa-shoe-prints me-1 text-danger"></i> ${productList.size()} mẫu giày
                                </span>
                            </div>
                        </div>

                        <!-- Product Grid for This Seller -->
                        <c:choose>
                            <c:when test="${not empty productList}">
                                <div class="row g-4">
                                    <c:forEach var="item" items="${productList}">
                                        <div class="col-12 col-sm-6 col-lg-4 col-xl-3">
                                            
                                            <!-- SHOE ITEM CARD (Content follows exact template) -->
                                            <div class="shoe-item-card">
                                                
                                                <!-- [imageLink]: Image of Shoe -->
                                                <div class="shoe-img-wrapper">
                                                    <a href="<c:url value='/product/detail'><c:param name='id' value='${item.productId}'/></c:url>">
                                                        <img src="${item.images}" alt="${item.productName}">
                                                    </a>
                                                    <!-- Category Tag overlay -->
                                                    <span class="badge bg-dark bg-opacity-75 text-white position-absolute top-0 start-0 m-3 px-2.5 py-1 rounded-pill small" style="font-size: 11px;">
                                                        ${item.category != null ? item.category.categoryName : 'Giày Sneaker'}
                                                    </span>
                                                </div>

                                                <!-- Card Content -->
                                                <div class="p-3 d-flex flex-column flex-grow-1">

                                                    <!-- Mã cửa hàng: -->
                                                    <div class="d-flex align-items-center justify-content-between mb-1">
                                                        <span class="field-label"><i class="fas fa-store me-1 text-danger"></i>Mã cửa hàng:</span>
                                                        <span class="badge bg-light text-dark border fw-bold px-2 py-0.5 rounded-pill" style="font-size: 11.5px;">
                                                            ${seller.sellerId}
                                                        </span>
                                                    </div>

                                                    <!-- Tên sản phẩm: (Clickable to Product Detail - Câu 4) -->
                                                    <div class="my-2">
                                                        <a href="<c:url value='/product/detail'><c:param name='id' value='${item.productId}'/></c:url>" 
                                                           class="product-title-link" 
                                                           title="${item.productName}">
                                                            ${item.productName}
                                                        </a>
                                                    </div>

                                                    <!-- Detail Spec Box -->
                                                    <div class="p-2.5 rounded-3 mb-3" style="background: #f8fafc; border: 1px solid #f1f5f9;">
                                                        <!-- Mã sản phẩm: -->
                                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                                            <span class="field-label">Mã sản phẩm:</span>
                                                            <strong class="field-value text-primary font-monospace">
                                                                #${item.productCode != null ? item.productCode : item.productId}
                                                            </strong>
                                                        </div>

                                                        <!-- Danh mục: -->
                                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                                            <span class="field-label">Danh mục:</span>
                                                            <span class="field-value text-truncate small" style="max-width: 140px;">
                                                                ${item.category != null ? item.category.categoryName : 'Chưa phân loại'}
                                                            </span>
                                                        </div>

                                                        <!-- Amount: (Số lượng tồn kho) -->
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <span class="field-label">Amount:</span>
                                                            <span class="badge ${item.amount > 10 ? 'bg-success bg-opacity-10 text-success' : 'bg-warning bg-opacity-10 text-warning'} fw-bold px-2 py-0.5 rounded-pill" style="font-size: 11.5px;">
                                                                ${item.amount} đôi
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Giá & Action Button -->
                                                    <div class="mt-auto pt-2 border-top d-flex align-items-center justify-content-between">
                                                        <div>
                                                            <span class="field-label d-block" style="font-size: 10px;">Giá bán:</span>
                                                            <strong class="text-danger fs-5 fw-bold">
                                                                <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                            </strong>
                                                        </div>
                                                        <a href="<c:url value='/product/detail'><c:param name='id' value='${item.productId}'/></c:url>" 
                                                           class="btn btn-sm btn-dark rounded-pill px-3 py-1.5 fw-semibold d-inline-flex align-items-center gap-1 shadow-2xs">
                                                            <span>Chi tiết</span>
                                                            <i class="fas fa-chevron-right small"></i>
                                                        </a>
                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-4 text-muted">
                                    <i class="fas fa-box-open fs-2 mb-2 text-secondary opacity-50 d-block"></i>
                                    Cửa hàng hiện chưa có sản phẩm nào.
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="text-center py-5">
                    <div class="card border-0 rounded-4 shadow-sm p-5 mx-auto" style="max-width: 500px;">
                        <i class="fas fa-exclamation-triangle fs-1 text-warning mb-3"></i>
                        <h4 class="fw-bold">Chưa có dữ liệu sản phẩm</h4>
                        <p class="text-muted small">Vui lòng khởi tạo dữ liệu mẫu trong CSDL để hiển thị danh sách sản phẩm theo Seller.</p>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</div>
</body>
</html>
