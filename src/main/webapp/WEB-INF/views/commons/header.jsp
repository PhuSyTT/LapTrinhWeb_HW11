<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="navbar navbar-expand-lg glass-header sticky-top py-3">
    <div class="container-fluid px-lg-5">
        <!-- Logo / Brand Aura Kicks -->
        <a class="navbar-brand d-flex align-items-center gap-2 text-decoration-none" href="<c:url value='/home'/>">
            <div class="d-flex align-items-center justify-content-center bg-dark text-white rounded-3 p-2 shadow-sm" style="width: 38px; height: 38px;">
                <i class="fas fa-shoe-prints text-warning fs-5"></i>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="font-display fw-bold fs-4 tracking-tight text-dark">AURA<span style="color: #e0148d;">KICKS</span></span>
                <span class="rounded-circle bg-danger" style="width: 8px; height: 8px;"></span>
            </div>
        </a>

        <!-- Mobile toggle -->
        <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent"
                aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Menu Links -->
        <div class="collapse navbar-collapse" id="navbarContent">
            <!-- Center Navigation (Pill Styles) -->
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 align-items-lg-center gap-1">
                <li class="nav-item">
                    <c:set var="isHome" value="${pageContext.request.requestURI.endsWith('/home') or pageContext.request.requestURI.endsWith('/')}" />
                    <a class="nav-link px-3 py-2 rounded-pill fw-semibold ${isHome ? 'bg-dark text-white shadow-sm' : 'text-dark'}" 
                       href="<c:url value='/home'/>">
                        <i class="fas fa-home me-1"></i> Trang Chủ
                    </a>
                </li>
                <li class="nav-item">
                    <c:set var="isProducts" value="${pageContext.request.requestURI.contains('/products') or pageContext.request.requestURI.contains('/san-pham')}" />
                    <a class="nav-link px-3 py-2 rounded-pill fw-semibold ${isProducts ? 'bg-dark text-white shadow-sm' : 'text-dark hover-glass'}" href="<c:url value='/products'/>">
                        <i class="fas fa-boxes me-1 ${isProducts ? 'text-warning' : 'text-muted'}"></i> Sản phẩm
                    </a>
                </li>
                
                <!-- Trang quản trị: Chỉ hiển thị cho tài khoản Admin (Yêu cầu Câu 1) -->
                <c:if test="${sessionScope.account != null and (sessionScope.account.role.roleId == 1 or sessionScope.account.role.roleName == 'ADMIN')}">
                    <li class="nav-item">
                        <a class="nav-link px-3 py-2 rounded-pill fw-bold text-white shadow-sm" style="background-color: #0e4d64;" href="<c:url value='/admin/home'/>">
                            <i class="fas fa-user-shield me-1 text-warning"></i> Trang Quản Trị
                        </a>
                    </li>
                </c:if>

                <!-- Trang người bán: Nếu tài khoản là Seller -->
                <c:if test="${sessionScope.account != null and (sessionScope.account.role.roleId == 2 or sessionScope.account.role.roleName == 'SELLER')}">
                    <li class="nav-item">
                        <a class="nav-link px-3 py-2 rounded-pill fw-bold text-white shadow-sm" style="background-color: #e0148d;" href="<c:url value='/seller/home'/>">
                            <i class="fas fa-store me-1"></i> Kênh Người Bán
                        </a>
                    </li>
                </c:if>
            </ul>

            <!-- Right side Auth / Profile / Cart -->
            <div class="d-flex align-items-center gap-2">
                <c:choose>
                    <c:when test="${sessionScope.account != null}">
                        <div class="dropdown">
                            <a class="d-flex align-items-center gap-2 glass-pill px-3 py-1.5 text-decoration-none text-dark dropdown-toggle shadow-sm" 
                               href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="${not empty sessionScope.account.images ? sessionScope.account.images : 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'}" 
                                     alt="Avatar" class="rounded-circle border border-2 border-danger" width="30" height="30" style="object-fit: cover;">
                                <span class="fw-bold small">${sessionScope.account.fullname}</span>
                                <span class="badge bg-dark rounded-pill px-2 py-1 text-uppercase" style="font-size: 10px;">${sessionScope.account.role.roleName}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow border-0 rounded-4 p-2 mt-2" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item rounded-3 py-2" href="<c:url value='/profile'/>"><i class="fas fa-user me-2 text-muted"></i>Thông tin cá nhân</a></li>
                                <c:if test="${sessionScope.account.role.roleId == 1 or sessionScope.account.role.roleName == 'ADMIN'}">
                                    <li><a class="dropdown-item rounded-3 py-2 text-primary fw-bold" href="<c:url value='/admin/home'/>"><i class="fas fa-cog me-2"></i>Quản trị hệ thống</a></li>
                                </c:if>
                                <li><hr class="dropdown-divider my-1"></li>
                                <li><a class="dropdown-item rounded-3 py-2 text-danger fw-semibold" href="<c:url value='/logout'/>"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a class="btn-aura-secondary text-decoration-none" href="<c:url value='/login'/>">
                            <i class="fas fa-sign-in-alt me-1"></i> Đăng nhập
                        </a>
                        <a class="btn-aura-primary text-decoration-none" href="<c:url value='/register'/>">
                            <i class="fas fa-user-plus me-1 text-danger"></i> Đăng ký
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</header>
