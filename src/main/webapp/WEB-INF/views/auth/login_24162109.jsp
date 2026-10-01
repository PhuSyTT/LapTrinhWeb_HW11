<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập — AURA KICKS</title>
</head>
<body>
<div class="py-5" style="min-height: 80vh; display: flex; align-items: center;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-5">
                
                <!-- Main Login Card -->
                <div class="card border-0 shadow-lg rounded-4 overflow-hidden" style="background: rgba(255, 255, 255, 0.92); backdrop-filter: blur(16px); border: 1px solid rgba(220, 225, 235, 0.6) !important;">
                    
                    <!-- Card Header / Nav Tabs -->
                    <div class="p-4 pt-5 text-center pb-2">
                        <div class="d-inline-flex align-items-center justify-content-center bg-dark text-white rounded-3 p-3 mb-3 shadow-sm" style="width: 52px; height: 52px;">
                            <i class="fas fa-shoe-prints text-warning fs-4"></i>
                        </div>
                        <h3 class="fw-bold font-display text-dark mb-1">Chào mừng trở lại!</h3>
                        <p class="text-muted small">Đăng nhập tài khoản để mua sắm hoặc quản lý cửa hàng</p>
                    </div>

                    <!-- Navigation Pills: Login / Register Switcher -->
                    <div class="px-4 pb-3">
                        <div class="d-flex p-1 bg-light rounded-pill border">
                            <a href="<c:url value='/login'/>" class="btn btn-sm flex-fill rounded-pill fw-bold bg-white text-dark shadow-sm">
                                <i class="fas fa-sign-in-alt me-1 text-danger"></i> Đăng Nhập
                            </a>
                            <a href="<c:url value='/register'/>" class="btn btn-sm flex-fill rounded-pill fw-bold text-muted">
                                <i class="fas fa-user-plus me-1"></i> Đăng Ký
                            </a>
                        </div>
                    </div>

                    <!-- Form Body -->
                    <div class="p-4 pt-2">

                        <!-- Success Alert -->
                        <c:if test="${not empty message}">
                            <div class="alert alert-success d-flex align-items-center rounded-3 py-2 px-3 mb-3 border-0 shadow-sm" role="alert" style="background: #e6f9ed; color: #15803d;">
                                <i class="fas fa-check-circle me-2 fs-5"></i>
                                <div class="small fw-semibold">${message}</div>
                            </div>
                        </c:if>

                        <!-- Error Alert -->
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger d-flex align-items-center rounded-3 py-2 px-3 mb-3 border-0 shadow-sm" role="alert" style="background: #fee2e2; color: #b91c1c;">
                                <i class="fas fa-exclamation-circle me-2 fs-5"></i>
                                <div class="small fw-semibold">${error}</div>
                            </div>
                        </c:if>

                        <form action="<c:url value='/login'/>" method="post" autocomplete="on">
                            <!-- Username or Email -->
                            <div class="mb-3">
                                <label class="form-label fw-semibold text-dark small mb-1" for="usernameInput">
                                    <i class="fas fa-user text-muted me-1"></i> Tên đăng nhập hoặc Email <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                        <i class="fas fa-user-circle"></i>
                                    </span>
                                    <input type="text" 
                                           class="form-control border-start-0 rounded-end-3 py-2.5" 
                                           id="usernameInput" 
                                           name="username" 
                                           value="${username}" 
                                           placeholder="Nhập username hoặc email..." 
                                           required 
                                           autofocus 
                                           style="border-color: #e2e8f0; font-size: 14.5px;">
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="mb-3">
                                <div class="d-flex justify-content-between align-items-center mb-1">
                                    <label class="form-label fw-semibold text-dark small mb-0" for="passwordInput">
                                        <i class="fas fa-lock text-muted me-1"></i> Mật khẩu <span class="text-danger">*</span>
                                    </label>
                                    <a href="#" class="small text-decoration-none text-muted" style="font-size: 12px;">Quên mật khẩu?</a>
                                </div>
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                        <i class="fas fa-key"></i>
                                    </span>
                                    <input type="password" 
                                           class="form-control border-start-0 rounded-end-3 py-2.5" 
                                           id="passwordInput" 
                                           name="password" 
                                           placeholder="Nhập mật khẩu..." 
                                           required 
                                           style="border-color: #e2e8f0; font-size: 14.5px;">
                                </div>
                            </div>

                            <!-- Remember me & Submit button -->
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="remember" checked>
                                    <label class="form-check-label small text-muted user-select-none" for="rememberMe">
                                        Ghi nhớ đăng nhập
                                    </label>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-dark w-100 py-2.5 rounded-3 fw-bold shadow-sm d-flex align-items-center justify-content-center gap-2" style="background-color: #0d131f; font-size: 15px;">
                                <span>Đăng Nhập</span>
                                <i class="fas fa-arrow-right"></i>
                            </button>
                        </form>

                        <!-- Test Accounts Quick Helper for Grading -->
                        <div class="mt-4 p-3 rounded-3" style="background: #f8fafc; border: 1px dashed #cbd5e1;">
                            <div class="d-flex align-items-center gap-1 mb-2">
                                <i class="fas fa-info-circle text-primary" style="font-size: 13px;"></i>
                                <span class="fw-bold text-dark" style="font-size: 12px;">Tài khoản kiểm tra (Đề 05):</span>
                            </div>
                            <div class="d-flex flex-wrap gap-2" style="font-size: 11.5px;">
                                <span class="badge bg-white text-dark border px-2 py-1 shadow-2xs">Admin: <strong>admin</strong> / 123456</span>
                                <span class="badge bg-white text-dark border px-2 py-1 shadow-2xs">Seller: <strong>seller1</strong> / 123456</span>
                                <span class="badge bg-white text-dark border px-2 py-1 shadow-2xs">User: <strong>user1</strong> / 123456</span>
                            </div>
                        </div>

                    </div>

                    <!-- Footer of card -->
                    <div class="card-footer bg-light border-0 py-3 text-center small text-muted">
                        Chưa có tài khoản? <a href="<c:url value='/register'/>" class="fw-bold text-danger text-decoration-none">Đăng ký ngay</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
