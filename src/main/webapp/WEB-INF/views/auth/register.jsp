<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Ký Tài Khoản — AURA KICKS</title>
</head>
<body>
<div class="py-5" style="min-height: 85vh; display: flex; align-items: center;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-9 col-lg-6">
                
                <!-- Main Register Card -->
                <div class="card border-0 shadow-lg rounded-4 overflow-hidden" style="background: rgba(255, 255, 255, 0.94); backdrop-filter: blur(16px); border: 1px solid rgba(220, 225, 235, 0.6) !important;">
                    
                    <!-- Card Header / Nav Tabs -->
                    <div class="p-4 pt-4 text-center pb-2">
                        <div class="d-inline-flex align-items-center justify-content-center bg-dark text-white rounded-3 p-3 mb-2 shadow-sm" style="width: 48px; height: 48px;">
                            <i class="fas fa-user-plus text-warning fs-5"></i>
                        </div>
                        <h3 class="fw-bold font-display text-dark mb-1">Tạo Tài Khoản Mới</h3>
                        <p class="text-muted small mb-0">Đăng ký tài khoản và kích hoạt bảo mật qua mã OTP Email</p>
                    </div>

                    <!-- Navigation Pills: Login / Register Switcher -->
                    <div class="px-4 pb-3">
                        <div class="d-flex p-1 bg-light rounded-pill border">
                            <a href="<c:url value='/login'/>" class="btn btn-sm flex-fill rounded-pill fw-bold text-muted">
                                <i class="fas fa-sign-in-alt me-1"></i> Đăng Nhập
                            </a>
                            <a href="<c:url value='/register'/>" class="btn btn-sm flex-fill rounded-pill fw-bold bg-white text-dark shadow-sm">
                                <i class="fas fa-user-plus me-1 text-danger"></i> Đăng Ký
                            </a>
                        </div>
                    </div>

                    <!-- Form Body -->
                    <div class="p-4 pt-1">

                        <!-- Error Alert -->
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger d-flex align-items-center rounded-3 py-2 px-3 mb-3 border-0 shadow-sm" role="alert" style="background: #fee2e2; color: #b91c1c;">
                                <i class="fas fa-exclamation-circle me-2 fs-5"></i>
                                <div class="small fw-semibold">${error}</div>
                            </div>
                        </c:if>

                        <!-- Informational Notice regarding Email OTP -->
                        <div class="p-2.5 px-3 rounded-3 mb-3 d-flex align-items-center gap-2" style="background: #eff6ff; border: 1px solid #bfdbfe; font-size: 13px; color: #1e40af;">
                            <i class="fas fa-shield-alt text-primary fs-5"></i>
                            <div>Sau khi đăng ký, hệ thống sẽ gửi <strong>mã OTP 6 chữ số</strong> về email của bạn để kích hoạt tài khoản.</div>
                        </div>

                        <form action="<c:url value='/register'/>" method="post">
                            
                            <div class="row g-3">
                                <!-- Username -->
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold text-dark small mb-1" for="regUsername">
                                        Tên đăng nhập <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                            <i class="fas fa-user"></i>
                                        </span>
                                        <input type="text" 
                                               class="form-control border-start-0 rounded-end-3 py-2" 
                                               id="regUsername" 
                                               name="username" 
                                               value="${username}" 
                                               placeholder="vd: phusy2026" 
                                               required 
                                               style="border-color: #e2e8f0; font-size: 14px;">
                                    </div>
                                </div>

                                <!-- Email -->
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold text-dark small mb-1" for="regEmail">
                                        Email nhận OTP <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                            <i class="fas fa-envelope"></i>
                                        </span>
                                        <input type="email" 
                                               class="form-control border-start-0 rounded-end-3 py-2" 
                                               id="regEmail" 
                                               name="email" 
                                               value="${email}" 
                                               placeholder="vd: phusy@gmail.com" 
                                               required 
                                               style="border-color: #e2e8f0; font-size: 14px;">
                                    </div>
                                </div>

                                <!-- Full Name -->
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold text-dark small mb-1" for="regFullname">
                                        Họ và tên <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                            <i class="fas fa-id-card"></i>
                                        </span>
                                        <input type="text" 
                                               class="form-control border-start-0 rounded-end-3 py-2" 
                                               id="regFullname" 
                                               name="fullname" 
                                               value="${fullname}" 
                                               placeholder="vd: Đinh Phú Sỹ" 
                                               required 
                                               style="border-color: #e2e8f0; font-size: 14px;">
                                    </div>
                                </div>

                                <!-- Phone -->
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold text-dark small mb-1" for="regPhone">
                                        Số điện thoại
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                            <i class="fas fa-phone"></i>
                                        </span>
                                        <input type="tel" 
                                               class="form-control border-start-0 rounded-end-3 py-2" 
                                               id="regPhone" 
                                               name="phone" 
                                               value="${phone}" 
                                               placeholder="vd: 0987654321" 
                                               style="border-color: #e2e8f0; font-size: 14px;">
                                    </div>
                                </div>

                                <!-- Password -->
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold text-dark small mb-1" for="regPassword">
                                        Mật khẩu <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                            <i class="fas fa-lock"></i>
                                        </span>
                                        <input type="password" 
                                               class="form-control border-start-0 rounded-end-3 py-2" 
                                               id="regPassword" 
                                               name="password" 
                                               placeholder="Ít nhất 6 ký tự..." 
                                               required 
                                               style="border-color: #e2e8f0; font-size: 14px;">
                                    </div>
                                </div>

                                <!-- Re-Password -->
                                <div class="col-12 col-md-6">
                                    <label class="form-label fw-semibold text-dark small mb-1" for="regRepassword">
                                        Xác nhận mật khẩu <span class="text-danger">*</span>
                                    </label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                            <i class="fas fa-check-double"></i>
                                        </span>
                                        <input type="password" 
                                               class="form-control border-start-0 rounded-end-3 py-2" 
                                               id="regRepassword" 
                                               name="repassword" 
                                               placeholder="Nhập lại mật khẩu..." 
                                               required 
                                               style="border-color: #e2e8f0; font-size: 14px;">
                                    </div>
                                </div>
                            </div>

                            <!-- Terms acceptance -->
                            <div class="form-check mt-3 mb-4">
                                <input class="form-check-input" type="checkbox" id="terms" required checked>
                                <label class="form-check-label small text-muted user-select-none" for="terms">
                                    Tôi đồng ý với các <a href="#" class="text-decoration-none text-dark fw-semibold">Điều khoản sử dụng</a> và <a href="#" class="text-decoration-none text-dark fw-semibold">Chính sách bảo mật</a> của AURA KICKS.
                                </label>
                            </div>

                            <button type="submit" class="btn btn-dark w-100 py-2.5 rounded-3 fw-bold shadow-sm d-flex align-items-center justify-content-center gap-2" style="background-color: #0d131f; font-size: 15px;">
                                <i class="fas fa-paper-plane text-warning"></i>
                                <span>Đăng Ký & Nhận Mã OTP</span>
                            </button>
                        </form>

                    </div>

                    <!-- Footer of card -->
                    <div class="card-footer bg-light border-0 py-3 text-center small text-muted">
                        Đã có tài khoản? <a href="<c:url value='/login'/>" class="fw-bold text-dark text-decoration-none">Đăng nhập tại đây</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
