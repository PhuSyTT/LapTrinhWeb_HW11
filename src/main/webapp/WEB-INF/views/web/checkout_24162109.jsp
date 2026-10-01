<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thanh Toán Đơn Hàng (COD) — AURA KICKS</title>
    <style>
        .checkout-box {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
        }
        .form-floating > .form-control:focus,
        .form-floating > .form-control:not(:placeholder-shown) {
            padding-top: 1.625rem;
            padding-bottom: 0.625rem;
        }
        .payment-method-card {
            border: 2px solid #e0148d;
            background: #fff5f8;
            border-radius: 16px;
            padding: 1.25rem;
            position: relative;
        }
    </style>
</head>
<body>
<div class="py-4 py-lg-5">
    <div class="container-fluid px-lg-5">
        
        <!-- Breadcrumb & Title -->
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4">
            <div>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb small mb-1">
                        <li class="breadcrumb-item"><a href="<c:url value='/home'/>" class="text-decoration-none text-muted">Trang Chủ</a></li>
                        <li class="breadcrumb-item"><a href="<c:url value='/cart'/>" class="text-decoration-none text-muted">Giỏ Hàng</a></li>
                        <li class="breadcrumb-item active text-dark fw-bold" aria-current="page">Thanh Toán (COD)</li>
                    </ol>
                </nav>
                <h2 class="font-display fw-bold text-dark mb-0">Thanh Toán Đơn Hàng</h2>
            </div>
            <a href="<c:url value='/cart'/>" class="btn btn-outline-dark btn-sm rounded-pill px-3 py-1.5 fw-semibold">
                <i class="fas fa-arrow-left me-1"></i> Trở Về Giỏ Hàng
            </a>
        </div>

        <!-- Alert Error nếu thiếu thông tin -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show rounded-4 shadow-sm mb-4 d-flex align-items-center gap-2" role="alert">
                <i class="fas fa-exclamation-circle text-danger fs-5"></i>
                <div class="flex-grow-1 small">
                    <strong>Lỗi:</strong> ${error}
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <form action="<c:url value='/checkout'/>" method="post">
            <div class="row g-4 g-lg-5">
                
                <!-- Cột trái: Thông tin giao hàng & Hình thức thanh toán -->
                <div class="col-lg-7">
                    
                    <!-- Thông tin người nhận -->
                    <div class="checkout-box p-4 p-md-5 mb-4">
                        <div class="d-flex align-items-center gap-2 mb-4 pb-2 border-bottom">
                            <span class="rounded-circle bg-dark text-white d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; font-size: 13px;">1</span>
                            <h5 class="font-display fw-bold text-dark mb-0">Thông Tin Giao Hàng</h5>
                        </div>

                        <div class="row g-3">
                            <div class="col-12">
                                <div class="form-floating">
                                    <input type="text" class="form-control rounded-3" id="fullname" name="fullname" 
                                           placeholder="Họ và tên người nhận" 
                                           value="${not empty fullname ? fullname : (not empty account ? account.fullname : '')}" required>
                                    <label for="fullname">Họ và tên người nhận <span class="text-danger">*</span></label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="tel" class="form-control rounded-3" id="phone" name="phone" 
                                           placeholder="Số điện thoại" 
                                           value="${not empty phone ? phone : (not empty account ? account.phone : '')}" required>
                                    <label for="phone">Số điện thoại liên hệ <span class="text-danger">*</span></label>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="email" class="form-control rounded-3" id="email" name="email" 
                                           placeholder="Email (không bắt buộc)" 
                                           value="${not empty email ? email : (not empty account ? account.email : '')}">
                                    <label for="email">Địa chỉ Email</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating">
                                    <input type="text" class="form-control rounded-3" id="address" name="address" 
                                           placeholder="Địa chỉ giao hàng" 
                                           value="${not empty address ? address : ''}" required>
                                    <label for="address">Địa chỉ nhận hàng (Số nhà, đường, phường, quận/huyện) <span class="text-danger">*</span></label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating">
                                    <textarea class="form-control rounded-3" id="note" name="note" placeholder="Ghi chú giao hàng" style="height: 90px;">${note}</textarea>
                                    <label for="note">Ghi chú cho shipper (ví dụ: Giao giờ hành chính, gọi trước khi đến...)</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Phương thức thanh toán (COD Preselected) -->
                    <div class="checkout-box p-4 p-md-5">
                        <div class="d-flex align-items-center gap-2 mb-4 pb-2 border-bottom">
                            <span class="rounded-circle bg-dark text-white d-flex align-items-center justify-content-center" style="width: 28px; height: 28px; font-size: 13px;">2</span>
                            <h5 class="font-display fw-bold text-dark mb-0">Phương Thức Thanh Toán</h5>
                        </div>

                        <!-- Lựa chọn COD (Preselected) -->
                        <div class="payment-method-card d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center gap-3">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="codPayment" value="COD" checked style="width: 20px; height: 20px;">
                                <div>
                                    <label class="form-check-label fw-bold text-dark d-flex align-items-center gap-2 mb-1" for="codPayment">
                                        <i class="fas fa-hand-holding-usd text-danger fs-5"></i>
                                        <span>Thanh toán khi nhận hàng (COD)</span>
                                        <span class="badge bg-danger rounded-pill px-2 py-0.5 text-uppercase" style="font-size: 9px;">Khuyên Dùng</span>
                                    </label>
                                    <small class="text-muted d-block">
                                        Kiểm tra hàng tận tay, ưng ý mới thanh toán tiền mặt cho bưu tá giao hàng.
                                    </small>
                                </div>
                            </div>
                            <i class="fas fa-check-circle text-danger fs-4"></i>
                        </div>
                    </div>

                </div>

                <!-- Cột phải: Xem lại đơn hàng & Nút Xác nhận -->
                <div class="col-lg-5">
                    <div class="checkout-box p-4 sticky-top" style="top: 100px;">
                        <div class="d-flex align-items-center justify-content-between pb-3 border-bottom mb-3">
                            <h5 class="font-display fw-bold text-dark mb-0">Đơn Hàng Của Bạn</h5>
                            <a href="<c:url value='/cart'/>" class="small text-danger fw-semibold text-decoration-none">
                                <i class="fas fa-edit me-1"></i> Sửa giỏ hàng
                            </a>
                        </div>

                        <!-- Danh sách sản phẩm rút gọn -->
                        <div class="mb-4" style="max-height: 280px; overflow-y: auto;">
                            <c:forEach items="${cartItems}" var="item">
                                <div class="d-flex align-items-center justify-content-between gap-3 py-2 border-bottom border-light">
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="rounded-3 border p-1 bg-light d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; flex-shrink: 0;">
                                            <img src="${item.product.images.startsWith('http') ? item.product.images : (pageContext.request.contextPath.concat('/assets/images/').concat(item.product.images))}" 
                                                 alt="${item.product.productName}" 
                                                 class="img-fluid" style="max-height: 38px; object-fit: contain;"
                                                 onerror="this.src='${pageContext.request.contextPath}/assets/images/sneaker_hero.png'">
                                        </div>
                                        <div>
                                            <strong class="d-block text-truncate text-dark small" style="max-width: 190px;" title="${item.product.productName}">
                                                ${item.product.productName}
                                            </strong>
                                            <small class="text-muted">SL: x${item.quantity}</small>
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <span class="small fw-bold text-dark">
                                            <fmt:formatNumber value="${item.totalPrice}" pattern="#,###"/> ₫
                                        </span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <!-- Tóm tắt chi phí -->
                        <div class="d-flex justify-content-between align-items-center mb-2 small">
                            <span class="text-muted">Tạm tính:</span>
                            <strong class="text-dark"><fmt:formatNumber value="${totalAmount}" pattern="#,###"/> ₫</strong>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-3 small">
                            <span class="text-muted">Phí giao hàng:</span>
                            <span class="text-success fw-bold">MIỄN PHÍ TOÀN QUỐC</span>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-4 pt-2 border-top">
                            <strong class="text-dark fs-6">Tổng cộng:</strong>
                            <span class="text-danger fw-bold fs-4 font-display">
                                <fmt:formatNumber value="${totalAmount}" pattern="#,###"/> ₫
                            </span>
                        </div>

                        <button type="submit" class="btn btn-danger w-100 py-3 rounded-pill fw-bold text-uppercase fs-6 shadow d-flex align-items-center justify-content-center gap-2"
                                style="background-color: #e0148d; border-color: #e0148d; letter-spacing: 0.05em;">
                            <i class="fas fa-check-circle"></i>
                            <span>Xác Nhận Đặt Hàng (COD)</span>
                        </button>

                        <div class="text-center mt-3">
                            <small class="text-muted" style="font-size: 11px;">
                                <i class="fas fa-shield-alt text-success me-1"></i> Bằng việc đặt hàng, bạn đồng ý với chính sách mua hàng và đổi trả của AURA KICKS.
                            </small>
                        </div>
                    </div>
                </div>

            </div>
        </form>

    </div>
</div>
</body>
</html>
