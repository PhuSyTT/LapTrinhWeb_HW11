<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Xác Thực OTP Kích Hoạt — AURA KICKS</title>
    <style>
        .otp-input-field {
            font-family: 'Inter', monospace;
            font-size: 26px;
            font-weight: 700;
            letter-spacing: 12px;
            text-align: center;
            padding: 12px 16px;
            border-radius: 12px;
            border: 2px solid #cbd5e1;
            transition: all 0.2s ease;
        }
        .otp-input-field:focus {
            border-color: #e0148d;
            box-shadow: 0 0 0 4px rgba(224, 20, 141, 0.15);
            outline: none;
        }
    </style>
</head>
<body>
<div class="py-5" style="min-height: 80vh; display: flex; align-items: center;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-8 col-lg-5">
                
                <!-- Main OTP Verification Card -->
                <div class="card border-0 shadow-lg rounded-4 overflow-hidden" style="background: rgba(255, 255, 255, 0.94); backdrop-filter: blur(16px); border: 1px solid rgba(220, 225, 235, 0.6) !important;">
                    
                    <!-- Card Header -->
                    <div class="p-4 pt-5 text-center pb-2">
                        <div class="d-inline-flex align-items-center justify-content-center bg-danger text-white rounded-3 p-3 mb-3 shadow-sm" style="width: 56px; height: 56px;">
                            <i class="fas fa-envelope-open-text fs-3"></i>
                        </div>
                        <h3 class="fw-bold font-display text-dark mb-1">Xác Thực Mã OTP</h3>
                        <p class="text-muted small">Nhập mã OTP gồm 6 chữ số vừa được gửi đến hòm thư của bạn</p>
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

                        <form action="<c:url value='/verify-otp'/>" method="post">
                            
                            <!-- Email Input (readonly or editable if empty) -->
                            <div class="mb-3">
                                <label class="form-label fw-semibold text-dark small mb-1" for="otpEmail">
                                    Địa chỉ Email kích hoạt <span class="text-danger">*</span>
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text bg-white border-end-0 text-muted rounded-start-3" style="border-color: #e2e8f0;">
                                        <i class="fas fa-at"></i>
                                    </span>
                                    <input type="email" 
                                           class="form-control border-start-0 rounded-end-3 py-2" 
                                           id="otpEmail" 
                                           name="email" 
                                           value="${email}" 
                                           placeholder="Nhập email của bạn..." 
                                           required 
                                           ${not empty email ? 'readonly' : ''} 
                                           style="border-color: #e2e8f0; font-size: 14.5px; background-color: ${not empty email ? '#f8fafc' : '#ffffff'};">
                                </div>
                            </div>

                            <!-- OTP Code Input -->
                            <div class="mb-4">
                                <label class="form-label fw-semibold text-dark small mb-1 text-center d-block" for="otpCode">
                                    Mã OTP (6 chữ số) <span class="text-danger">*</span>
                                </label>
                                <input type="text" 
                                       class="form-control otp-input-field w-100" 
                                       id="otpCode" 
                                       name="otp" 
                                       maxlength="6" 
                                       pattern="[0-9]{6}" 
                                       placeholder="••••••" 
                                       required 
                                       autofocus 
                                       autocomplete="one-time-code">
                                <div class="text-center mt-2 text-muted" style="font-size: 12.5px;">
                                    <i class="fas fa-clock me-1 text-warning"></i> Mã có hiệu lực trong vòng 5 phút
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-dark w-100 py-2.5 rounded-3 fw-bold shadow-sm d-flex align-items-center justify-content-center gap-2 mb-3" style="background-color: #0d131f; font-size: 15px;">
                                <i class="fas fa-check-circle text-success"></i>
                                <span>Kích Hoạt Tài Khoản Ngay</span>
                            </button>
                        </form>

                        <!-- Resend OTP Action -->
                        <div class="text-center pt-2">
                            <span class="text-muted small">Không nhận được mã? </span>
                            <c:choose>
                                <c:when test="${not empty email}">
                                    <a href="<c:url value='/verify-otp'><c:param name='action' value='resend'/><c:param name='email' value='${email}'/></c:url>" 
                                       class="fw-bold text-danger text-decoration-none small">
                                        <i class="fas fa-redo-alt me-1"></i> Gửi lại mã OTP
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted small">(Nhập email để gửi lại)</span>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </div>

                    <!-- Footer of card -->
                    <div class="card-footer bg-light border-0 py-3 text-center small text-muted">
                        Quay lại trang <a href="<c:url value='/login'/>" class="fw-bold text-dark text-decoration-none">Đăng nhập</a> hoặc <a href="<c:url value='/register'/>" class="fw-bold text-dark text-decoration-none">Đăng ký lại</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
