<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt Hàng Thành Công — AURA KICKS</title>
    <style>
        .success-card {
            background: #ffffff;
            border-radius: 28px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 20px 40px -15px rgba(0, 0, 0, 0.07);
        }
        .order-badge-cod {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: #ffffff;
            padding: 6px 16px;
            border-radius: 9999px;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 0.03em;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
    </style>
</head>
<body>
<div class="py-5">
    <div class="container" style="max-width: 760px;">
        
        <div class="success-card p-4 p-md-5 text-center">
            
            <!-- Success Icon Animation -->
            <div class="mb-4">
                <div class="rounded-circle bg-success bg-opacity-10 d-inline-flex align-items-center justify-content-center p-4" style="width: 100px; height: 100px;">
                    <i class="fas fa-check text-success" style="font-size: 48px;"></i>
                </div>
            </div>

            <!-- Title & Subtitle -->
            <h2 class="font-display fw-bold text-dark mb-2">Đặt Hàng Thành Công!</h2>
            <p class="text-muted mb-4" style="max-width: 520px; margin: 0 auto; font-size: 15px;">
                Cảm ơn bạn đã lựa chọn <strong>AURA KICKS</strong>. Chúng tôi đã nhận được thông tin đơn hàng và đang đóng gói vận chuyển đến bạn.
            </p>

            <!-- Order Info Highlight Box -->
            <c:if test="${not empty order}">
                <div class="p-4 rounded-4 text-start mb-4" style="background: #f8fafc; border: 1px dashed #cbd5e1;">
                    <div class="d-flex flex-wrap align-items-center justify-content-between gap-2 pb-3 mb-3 border-bottom">
                        <div>
                            <small class="text-muted text-uppercase d-block" style="font-size: 11px; font-weight: 700;">Mã đơn hàng</small>
                            <span class="fs-5 fw-bold text-danger font-display">#${order.orderId}</span>
                        </div>
                        <div class="text-end">
                            <span class="order-badge-cod">
                                <i class="fas fa-money-bill-wave"></i> ${order.paymentMethod}
                            </span>
                        </div>
                    </div>

                    <div class="row g-3 mb-4">
                        <div class="col-sm-6">
                            <small class="text-muted text-uppercase d-block fw-bold" style="font-size: 11px;">Người nhận hàng</small>
                            <strong class="text-dark">${order.customerName}</strong>
                            <div class="text-secondary small">${order.phone}</div>
                            <div class="text-secondary small">${order.email}</div>
                        </div>
                        <div class="col-sm-6">
                            <small class="text-muted text-uppercase d-block fw-bold" style="font-size: 11px;">Địa chỉ giao hàng</small>
                            <span class="text-dark small fw-semibold">${order.address}</span>
                            <c:if test="${not empty order.note}">
                                <div class="text-muted small mt-1"><em>"${order.note}"</em></div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Danh sách sản phẩm mua -->
                    <h6 class="fw-bold text-dark mb-3 pb-2 border-bottom">Chi Tiết Sản Phẩm</h6>
                    <div class="mb-3">
                        <c:forEach items="${order.items}" var="item">
                            <div class="d-flex align-items-center justify-content-between py-2 border-bottom border-white">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-3 border p-1 bg-white d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                        <img src="${item.product.images.startsWith('http') ? item.product.images : (pageContext.request.contextPath.concat('/assets/images/').concat(item.product.images))}" 
                                             alt="${item.product.productName}" 
                                             class="img-fluid" style="max-height: 40px; object-fit: contain;"
                                             onerror="this.src='${pageContext.request.contextPath}/assets/images/sneaker_hero.png'">
                                    </div>
                                    <div>
                                        <span class="fw-bold text-dark d-block small">${item.product.productName}</span>
                                        <span class="text-muted small">x${item.quantity} đôi • <fmt:formatNumber value="${item.product.price}" pattern="#,###"/> ₫</span>
                                    </div>
                                </div>
                                <div class="text-end fw-bold text-dark">
                                    <fmt:formatNumber value="${item.totalPrice}" pattern="#,###"/> ₫
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Tổng thanh toán COD -->
                    <div class="d-flex justify-content-between align-items-center pt-2">
                        <div>
                            <strong class="text-dark fs-6">Số tiền cần thanh toán cho Shipper (COD):</strong>
                            <small class="text-muted d-block" style="font-size: 11px;">(Đã bao gồm thuế và miễn phí giao hàng toàn quốc)</small>
                        </div>
                        <span class="text-danger fw-bold fs-4 font-display">
                            <fmt:formatNumber value="${order.totalAmount}" pattern="#,###"/> ₫
                        </span>
                    </div>

                </div>
            </c:if>

            <!-- Actions -->
            <div class="d-flex flex-wrap justify-content-center gap-3 pt-2">
                <a href="<c:url value='/home'/>" class="btn btn-dark rounded-pill px-4 py-2.5 fw-bold" style="background-color: #0d131f;">
                    <i class="fas fa-home me-2"></i> Quay Lại Trang Chủ
                </a>
                <a href="<c:url value='/products'/>" class="btn btn-outline-dark rounded-pill px-4 py-2.5 fw-bold">
                    <i class="fas fa-shopping-bag me-2"></i> Xem Thêm Sản Phẩm Khác
                </a>
            </div>

        </div>

    </div>
</div>
</body>
</html>
