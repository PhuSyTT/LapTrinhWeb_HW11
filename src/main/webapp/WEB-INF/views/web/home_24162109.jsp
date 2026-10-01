<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <title>AURA KICKS — Thế Giới Sneaker & Giày Thể Thao Cao Cấp (Đề 05)</title>
</head>
<body>
<div class="container-fluid px-lg-5 py-4">

    <!-- =============================================
         1. HERO EXPERIENCE SECTION (AURA KICKS)
         ============================================= -->
    <section class="glass-card p-4 p-lg-5 mb-5 position-relative overflow-hidden">
        <!-- Ambient Decorative Glows -->
        <div class="position-absolute top-0 start-50 translate-middle-x rounded-circle" 
             style="width: 500px; height: 300px; background: radial-gradient(circle, rgba(224, 20, 141, 0.15) 0%, transparent 70%); filter: blur(40px); pointer-events: none;"></div>

        <!-- Top Metadata Bar -->
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-2 mb-4">
            <div class="d-inline-flex align-items-center gap-2 glass-pill px-3 py-1.5 shadow-sm">
                <span class="rounded-circle bg-danger" style="width: 8px; height: 8px; animation: pulse 1.5s infinite;"></span>
                <span class="font-display text-uppercase small fw-bold" style="letter-spacing: 0.08em;">Global Tier-0 Launch Phase</span>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="glass-pill px-3 py-1.5 small fw-semibold text-muted shadow-sm d-none d-sm-inline-block">
                    <i class="fas fa-certificate text-danger me-1"></i> 100% Authentic NFC Vault
                </span>
                <span class="glass-pill px-3 py-1.5 small fw-bold text-dark shadow-sm">
                    Series // 05-HK1
                </span>
            </div>
        </div>

        <div class="row align-items-center g-4 my-2">
            <!-- Left Editorial Column -->
            <div class="col-lg-6">
                <div class="d-flex align-items-center gap-2 mb-3">
                    <span class="badge bg-dark text-white rounded-pill px-3 py-2 text-uppercase font-display small" style="letter-spacing: 0.05em;">
                        Aura Zero-1 // Next-Gen Cushioning
                    </span>
                    <span class="badge-drop">DROP 01</span>
                </div>

                <h1 class="heading-hero display-4 text-dark mb-3">
                    BƯỚC VÀO <br/>
                    <span style="color: #e0148d;">KỶ NGUYÊN MỚI</span> CỦA AIR
                </h1>

                <p class="text-muted fs-5 mb-4" style="line-height: 1.7; max-width: 540px;">
                    Thiết kế chuẩn tốc độ, định hình phong cách đường phố. Trải nghiệm đệm hoàn trả năng lượng kép kết hợp sợi carbon khí động học vượt trội.
                </p>

                <!-- CTA Cluster -->
                <div class="d-flex flex-wrap align-items-center gap-3 mb-4">
                    <a href="#catalog" class="btn-aura-primary text-decoration-none">
                        <span>Khám Phá Bộ Sưu Tập</span>
                        <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                    <a href="<c:url value='/products'/>" class="btn-aura-secondary text-decoration-none">
                        <i class="fas fa-store text-danger me-2"></i>
                        <span>Xem Theo Từng Seller</span>
                    </a>
                </div>

                <!-- Trust Badges Bar -->
                <div class="d-flex flex-wrap align-items-center gap-3 pt-2">
                    <span class="glass-pill px-3 py-1.5 small fw-bold text-dark shadow-sm">
                        <span class="text-warning">★ 4.9/5</span> Rider Rating
                    </span>
                    <span class="glass-pill px-3 py-1.5 small fw-semibold text-muted shadow-sm">
                        <i class="fas fa-leaf text-success me-1"></i> Carbon-Neutral Sole
                    </span>
                    <span class="glass-pill px-3 py-1.5 small fw-semibold text-danger shadow-sm">
                        <i class="fas fa-fire me-1"></i> Limited: 500 Pairs
                    </span>
                </div>
            </div>

            <!-- Right 3D Floating Sneaker Hero Canvas -->
            <div class="col-lg-6 position-relative text-center">
                <div class="position-relative d-inline-block p-4">
                    <!-- Sneaker Image with Glow -->
                    <img src="<c:url value='/assets/images/sneaker_hero.png'/>" 
                         alt="Aura Next-Gen Sneaker" 
                         class="img-fluid position-relative select-none" 
                         style="max-height: 380px; object-fit: contain; filter: drop-shadow(0 24px 36px rgba(224, 20, 141, 0.28)); transform: rotate(-4deg); transition: transform 0.4s ease;">

                    <!-- Floating Badges on Sneaker -->
                    <div class="position-absolute top-0 start-0 glass-pill px-3 py-2 shadow-lg d-flex align-items-center gap-2">
                        <i class="fas fa-bolt text-danger fs-5"></i>
                        <div class="text-start">
                            <span class="d-block text-uppercase fw-bold text-dark" style="font-size: 11px;">Volt-Flow™ Unit</span>
                            <span class="text-muted" style="font-size: 10px;">Instant Kinetic Bounce</span>
                        </div>
                    </div>

                    <div class="position-absolute bottom-0 end-0 glass-pill px-3 py-2 shadow-lg d-flex align-items-center gap-2">
                        <i class="fas fa-sliders-h text-primary fs-5"></i>
                        <div class="text-start">
                            <span class="d-block text-uppercase fw-bold text-dark" style="font-size: 11px;">Aero Strapping</span>
                            <span class="text-muted" style="font-size: 10px;">Custom Lockdown Tech</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- =============================================
         2. CATEGORY PILL BAR
         ============================================= -->
    <div class="mb-4 d-flex flex-wrap align-items-center justify-content-between gap-3" id="catalog">
        <div>
            <span class="badge-drop mb-2 d-inline-block">Archived &amp; Live Vault</span>
            <h2 class="heading-hero fs-3 text-dark mb-0">BỘ SƯU TẬP MỚI NHẤT &amp; ICONS</h2>
        </div>
        
        <div class="d-flex align-items-center gap-2">
            <span class="glass-pill px-3 py-1.5 small fw-semibold text-dark shadow-sm">
                <i class="fas fa-cubes text-danger me-1"></i> ${products.size()} Mẫu Giày Đang Mở Bán
            </span>
        </div>
    </div>

    <!-- Category Pills List -->
    <div class="d-flex flex-wrap align-items-center gap-2 mb-4 pb-2">
        <a href="<c:url value='/home'/>" class="btn btn-dark rounded-pill px-4 py-2 font-display fw-bold text-decoration-none shadow-sm small">
            Tất Cả Drops
        </a>
        <c:forEach items="${categories}" var="cat">
            <a href="<c:url value='/home?catId=${cat.categoryId}'/>" 
               class="glass-pill px-4 py-2 text-decoration-none text-dark fw-semibold small shadow-sm hover-glass">
                ${cat.categoryName}
            </a>
        </c:forEach>
    </div>

    <!-- =============================================
         3. PRODUCT GRID (4-COLUMN BESPOKE LAYOUT)
         ============================================= -->
    <div class="row g-4 mb-5">
        <c:forEach items="${products}" var="p" varStatus="loop">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="glass-card p-3 h-100 d-flex flex-column justify-content-between">
                    
                    <!-- Top Card Deck: Drop Tag & Wishlist -->
                    <div class="d-flex align-items-center justify-content-between w-100 mb-2">
                        <span class="badge-drop" style="font-size: 9px; padding: 4px 10px;">
                            ${not empty p.category.categoryName ? p.category.categoryName : 'Sneaker'}
                        </span>
                        <button class="btn btn-sm p-0 rounded-circle text-muted" style="width: 32px; height: 32px; background: rgba(255,255,255,0.8);">
                            <i class="far fa-heart"></i>
                        </button>
                    </div>

                    <!-- Sneaker Canvas Floating Area -->
                    <div class="d-flex align-items-center justify-content-center my-3 text-center" style="min-height: 180px;">
                        <a href="<c:url value='/product/detail?id=${p.productId}'/>" class="text-decoration-none">
                            <img src="${p.images.startsWith('http') ? p.images : (pageContext.request.contextPath.concat('/assets/images/').concat(p.images))}" 
                                 alt="${p.productName}" 
                                 class="sneaker-img-float img-fluid"
                                 style="max-height: 160px; object-fit: contain;"
                                 onerror="this.src='${pageContext.request.contextPath}/assets/images/sneaker_hero.png'">
                        </a>
                    </div>

                    <!-- Bottom Content Deck -->
                    <div class="pt-2 border-top border-white">
                        <div class="d-flex align-items-center justify-content-between mb-1">
                            <span class="small fw-bold text-uppercase" style="color: #e0148d; font-size: 11px;">
                                <i class="fas fa-store me-1"></i> ${p.seller.sellername}
                            </span>
                            <span class="text-muted" style="font-size: 11px;">Mã: #${p.productCode != null ? p.productCode : p.productId}</span>
                        </div>

                        <h5 class="font-display fw-bold text-dark text-truncate mb-2" title="${p.productName}">
                            <a href="<c:url value='/product/detail?id=${p.productId}'/>" class="text-dark text-decoration-none">
                                ${p.productName}
                            </a>
                        </h5>

                        <!-- Sizing Matrix Pills -->
                        <div class="d-flex align-items-center gap-1 mb-3">
                            <span class="glass-pill px-2 py-0.5 text-muted" style="font-size: 10px; font-weight: 700;">US 8</span>
                            <span class="glass-pill px-2 py-0.5 text-white bg-dark" style="font-size: 10px; font-weight: 700;">US 9.5</span>
                            <span class="glass-pill px-2 py-0.5 text-muted" style="font-size: 10px; font-weight: 700;">US 10</span>
                            <span class="glass-pill px-2 py-0.5 text-muted" style="font-size: 10px; font-weight: 700;">US 11</span>
                        </div>

                        <!-- Price & Action Buttons -->
                        <div class="d-flex align-items-center justify-content-between pt-2 border-top border-white">
                            <div>
                                <small class="text-muted d-block" style="font-size: 10px; text-transform: uppercase;">Giá niêm yết</small>
                                <span class="font-display fw-bold fs-5 text-dark">
                                    <fmt:formatNumber value="${p.price}" pattern="#,###"/> ₫
                                </span>
                            </div>
                            <div class="d-flex align-items-center gap-2">
                                <a href="<c:url value='/cart/add?productId=${p.productId}'/>" 
                                   class="btn btn-dark rounded-circle p-2 d-flex align-items-center justify-content-center shadow-sm" 
                                   style="width: 36px; height: 36px; background-color: #0d131f;" title="Thêm vào giỏ hàng">
                                    <i class="fas fa-shopping-bag text-warning" style="font-size: 13px;"></i>
                                </a>
                                <a href="<c:url value='/product/detail?id=${p.productId}'/>" 
                                   class="btn-aura-primary text-decoration-none px-3 py-2 small" title="Xem chi tiết sản phẩm">
                                    <i class="fas fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
