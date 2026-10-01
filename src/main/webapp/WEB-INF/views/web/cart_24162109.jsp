<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Giỏ Hàng Của Bạn — AURA KICKS</title>
                <style>
                    .cart-table th {
                        font-size: 12px;
                        text-transform: uppercase;
                        letter-spacing: 0.05em;
                        color: #64748b;
                        background: #f8fafc;
                        border-bottom: 2px solid #e2e8f0;
                        padding: 1rem;
                    }

                    .cart-table td {
                        vertical-align: middle;
                        padding: 1.25rem 1rem;
                        border-bottom: 1px solid #f1f5f9;
                    }

                    .qty-input-group {
                        display: inline-flex;
                        align-items: center;
                        border: 1px solid #cbd5e1;
                        border-radius: 9999px;
                        background: #ffffff;
                        padding: 2px 8px;
                    }

                    .qty-input-group input {
                        width: 45px;
                        border: none;
                        text-align: center;
                        font-weight: 700;
                        background: transparent;
                    }

                    .qty-input-group input:focus {
                        outline: none;
                    }

                    .cart-summary-card {
                        background: #ffffff;
                        border: 1px solid #e2e8f0;
                        border-radius: 20px;
                        box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05);
                    }
                </style>
            </head>

            <body>
                <div class="py-4 py-lg-5">
                    <div class="container-fluid px-lg-5">

                        <!-- Breadcrumb & Header -->
                        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4">
                            <div>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb small mb-1">
                                        <li class="breadcrumb-item"><a href="<c:url value='/home'/>"
                                                class="text-decoration-none text-muted">Trang Chủ</a></li>
                                        <li class="breadcrumb-item active text-dark fw-bold" aria-current="page">Giỏ
                                            Hàng</li>
                                    </ol>
                                </nav>
                                <h2 class="font-display fw-bold text-dark mb-0">Giỏ Hàng Của Bạn</h2>
                            </div>
                            <a href="<c:url value='/home'/>"
                                class="btn btn-outline-dark btn-sm rounded-pill px-3 py-1.5 fw-semibold">
                                <i class="fas fa-arrow-left me-1"></i> Tiếp Tục Mua Sắm
                            </a>
                        </div>

                        <!-- Thông báo điều chỉnh số lượng nếu có -->
                        <c:if test="${not empty sessionScope.cartWarning}">
                            <div class="alert alert-warning alert-dismissible fade show rounded-4 shadow-sm mb-4 d-flex align-items-center gap-2"
                                role="alert">
                                <i class="fas fa-exclamation-triangle text-warning fs-5"></i>
                                <div class="flex-grow-1 small">
                                    ${sessionScope.cartWarning}
                                </div>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                            <c:remove var="cartWarning" scope="session" />
                        </c:if>

                        <c:choose>
                            <c:when test="${not empty cartItems and totalItems > 0}">
                                <div class="row g-4 g-lg-5">

                                    <!-- Cột trái: Bảng danh sách sản phẩm trong giỏ -->
                                    <div class="col-lg-8">
                                        <div class="bg-white rounded-4 border shadow-sm overflow-hidden mb-3">
                                            <div class="table-responsive">
                                                <table class="table cart-table mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th>Sản Phẩm</th>
                                                            <th class="text-center">Đơn Giá</th>
                                                            <th class="text-center">Số Lượng</th>
                                                            <th class="text-end">Thành Tiền</th>
                                                            <th class="text-center" style="width: 60px;">Xóa</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${cartItems}" var="item">
                                                            <tr>
                                                                <td>
                                                                    <div class="d-flex align-items-center gap-3">
                                                                        <div class="rounded-3 border p-1 bg-light d-flex align-items-center justify-content-center"
                                                                            style="width: 70px; height: 70px; flex-shrink: 0;">
                                                                            <img src="${item.product.images.startsWith('http') ? item.product.images : (pageContext.request.contextPath.concat('/assets/images/').concat(item.product.images))}"
                                                                                alt="${item.product.productName}"
                                                                                class="img-fluid"
                                                                                style="max-height: 55px; object-fit: contain;"
                                                                                onerror="this.src='${pageContext.request.contextPath}/assets/images/sneaker_hero.png'">
                                                                        </div>
                                                                        <div>
                                                                            <a href="<c:url value='/product/detail?id=${item.product.productId}'/>"
                                                                                class="fw-bold text-dark text-decoration-none hover-primary d-block mb-1"
                                                                                style="max-width: 280px;">
                                                                                ${item.product.productName}
                                                                            </a>
                                                                            <div
                                                                                class="d-flex align-items-center gap-2 small text-muted">
                                                                                <span>Mã SP:
                                                                                    #${item.product.productId}</span>
                                                                                <span>•</span>
                                                                                <span class="text-success"><i
                                                                                        class="fas fa-check-circle me-1"></i>Còn
                                                                                    hàng (${item.product.amount})</span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td class="text-center fw-semibold text-secondary">
                                                                    <fmt:formatNumber value="${item.product.price}"
                                                                        pattern="#,###" /> ₫
                                                                </td>
                                                                <td class="text-center">
                                                                    <form action="<c:url value='/cart/update'/>"
                                                                        method="post"
                                                                        class="d-inline-flex align-items-center">
                                                                        <input type="hidden" name="productId"
                                                                            value="${item.product.productId}">
                                                                        <div class="qty-input-group shadow-xs">
                                                                            <button type="submit" name="quantity"
                                                                                value="${item.quantity - 1}"
                                                                                class="btn btn-sm btn-link text-dark text-decoration-none fw-bold px-1.5 py-0"
                                                                                title="Giảm số lượng">-</button>
                                                                            <input type="text" value="${item.quantity}"
                                                                                readonly>
                                                                            <button type="submit" name="quantity"
                                                                                value="${item.quantity + 1}"
                                                                                class="btn btn-sm btn-link text-dark text-decoration-none fw-bold px-1.5 py-0"
                                                                                title="Tăng số lượng" ${item.quantity>=
                                                                                item.product.amount ? 'disabled' :
                                                                                ''}>+</button>
                                                                        </div>
                                                                    </form>
                                                                </td>
                                                                <td
                                                                    class="text-end fw-bold text-dark fs-6 font-display">
                                                                    <fmt:formatNumber value="${item.totalPrice}"
                                                                        pattern="#,###" /> ₫
                                                                </td>
                                                                <td class="text-center">
                                                                    <a href="<c:url value='/cart/delete?productId=${item.product.productId}'/>"
                                                                        class="btn btn-sm btn-outline-danger rounded-circle p-2 d-inline-flex align-items-center justify-content-center"
                                                                        style="width: 32px; height: 32px;"
                                                                        title="Xóa sản phẩm"
                                                                        onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?');">
                                                                        <i class="fas fa-trash-alt"
                                                                            style="font-size: 11px;"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <!-- Action row: Xóa toàn bộ giỏ hàng -->
                                        <div class="d-flex align-items-center justify-content-between pt-2">
                                            <a href="<c:url value='/cart/clear'/>"
                                                class="btn btn-outline-secondary btn-sm rounded-pill px-3"
                                                onclick="return confirm('Bạn có chắc chắn muốn làm trống toàn bộ giỏ hàng?');">
                                                <i class="fas fa-trash me-1"></i> Xóa Toàn Bộ Giỏ Hàng
                                            </a>
                                            <span class="text-muted small">
                                                <i class="fas fa-shield-alt text-success me-1"></i> Đổi trả miễn phí
                                                trong 7 ngày nếu lỗi nhà sản xuất
                                            </span>
                                        </div>
                                    </div>

                                    <!-- Cột phải: Tóm tắt đơn hàng & Nút thanh toán COD -->
                                    <div class="col-lg-4">
                                        <div class="cart-summary-card p-4 sticky-top" style="top: 100px;">
                                            <h4 class="font-display fw-bold text-dark mb-4 pb-2 border-bottom">Tóm Tắt
                                                Đơn Hàng</h4>

                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="text-muted">Tổng số lượng:</span>
                                                <strong class="text-dark">${totalItems} đôi giày</strong>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="text-muted">Tạm tính:</span>
                                                <strong class="text-dark fs-6">
                                                    <fmt:formatNumber value="${totalAmount}" pattern="#,###" /> ₫
                                                </strong>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <span class="text-muted">Phí giao hàng:</span>
                                                <span
                                                    class="badge bg-success bg-opacity-10 text-success fw-bold px-2 py-1">MIỄN
                                                    PHÍ</span>
                                            </div>

                                            <!-- COD Highlight Box -->
                                            <div class="p-3 rounded-3 bg-light border mb-4">
                                                <div class="d-flex align-items-center gap-2 mb-1">
                                                    <i class="fas fa-money-bill-wave text-success fs-5"></i>
                                                    <strong class="text-dark small">Thanh toán khi nhận hàng
                                                        (COD)</strong>
                                                </div>
                                                <p class="text-muted mb-0" style="font-size: 11.5px; line-height: 1.5;">
                                                    Kiểm tra hàng trước khi thanh toán tiền mặt trực tiếp cho nhân viên
                                                    giao hàng.
                                                </p>
                                            </div>

                                            <hr class="my-3">

                                            <div class="d-flex justify-content-between align-items-baseline mb-4">
                                                <span class="text-dark fw-bold">Tổng thanh toán:</span>
                                                <span class="text-danger fw-bold display-6 font-display">
                                                    <fmt:formatNumber value="${totalAmount}" pattern="#,###" /> ₫
                                                </span>
                                            </div>

                                            <a href="<c:url value='/checkout'/>"
                                                class="btn btn-danger w-100 py-3 rounded-pill fw-bold text-uppercase fs-6 shadow d-flex align-items-center justify-content-center gap-2"
                                                style="background-color: #e0148d; border-color: #e0148d; letter-spacing: 0.05em;">
                                                <i class="fas fa-credit-card"></i>
                                                <span>Tiến Hành Đặt Hàng (COD)</span>
                                            </a>

                                            <div class="text-center mt-3">
                                                <small class="text-muted" style="font-size: 11px;">
                                                    <i class="fas fa-lock me-1"></i> Giao dịch bảo mật & Cam kết 100%
                                                    chính hãng
                                                </small>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </c:when>

                            <c:otherwise>
                                <!-- Trạng thái giỏ hàng rỗng -->
                                <div class="bg-white rounded-5 border p-5 text-center my-4 shadow-sm"
                                    style="max-width: 650px; margin: 0 auto;">
                                    <div class="rounded-circle bg-light d-inline-flex p-4 mb-4 text-muted">
                                        <i class="fas fa-shopping-bag fa-4x text-muted opacity-50"></i>
                                    </div>
                                    <h3 class="font-display fw-bold text-dark mb-2">Giỏ hàng của bạn đang trống!</h3>
                                    <p class="text-muted mb-4" style="max-width: 420px; margin: 0 auto;">
                                        Hiện tại bạn chưa chọn bất kỳ mẫu giày sneaker nào. Hãy dạo quanh cửa hàng và
                                        chọn cho mình một đôi giày yêu thích nhé!
                                    </p>
                                    <a href="<c:url value='/home'/>"
                                        class="btn btn-dark rounded-pill px-4 py-2.5 fw-bold"
                                        style="background-color: #0d131f;">
                                        <i class="fas fa-shopping-cart me-2 text-warning"></i> Khám Phá Sản Phẩm Ngay
                                    </a>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
            </body>

            </html>