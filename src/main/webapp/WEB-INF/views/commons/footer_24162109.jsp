<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="glass-footer py-5 mt-auto">
    <div class="container-fluid px-lg-5">
        <!-- Top Section: Brand & Student Info Deck -->
        <div class="row g-4 align-items-center pb-4 border-bottom border-white">
            <div class="col-lg-5">
                <div class="d-flex align-items-center gap-2 mb-2">
                    <span class="font-display fw-bold fs-4 tracking-tight text-dark">AURA<span style="color: #e0148d;">KICKS</span></span>
                    <span class="badge-drop">Official Flagship</span>
                </div>
                <p class="text-muted small mb-0" style="max-width: 420px;">
                    Hệ thống phân phối giày Sneaker và giày thể thao chính hãng. Nền tảng thương mại điện tử công nghệ Java Servlet, JPA và SiteMesh Decorators.
                </p>
            </div>

            <!-- Card Thông tin sinh viên (Bắt buộc theo yêu cầu Câu 1) -->
            <div class="col-lg-7">
                <div class="glass-pill p-3 px-4 d-flex flex-wrap align-items-center justify-content-between gap-3 shadow-sm">
                    <div class="d-flex align-items-center gap-2">
                        <div class="rounded-circle bg-dark text-white p-2 d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">
                            <i class="fas fa-user-graduate text-warning"></i>
                        </div>
                        <div>
                            <small class="text-muted text-uppercase d-block" style="font-size: 10px; font-weight: 700; letter-spacing: 0.05em;">Sinh viên thực hiện</small>
                            <strong class="text-dark fs-6">Đinh Phú Sỹ</strong>
                        </div>
                    </div>
                    
                    <div class="d-flex align-items-center gap-2">
                        <div class="rounded-circle bg-dark text-white p-2 d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">
                            <i class="fas fa-id-card text-info"></i>
                        </div>
                        <div>
                            <small class="text-muted text-uppercase d-block" style="font-size: 10px; font-weight: 700; letter-spacing: 0.05em;">Mã số sinh viên</small>
                            <strong class="text-dark fs-6">24162109</strong>
                        </div>
                    </div>

                    <div class="d-flex align-items-center gap-2">
                        <div class="rounded-circle bg-danger text-white p-2 d-flex align-items-center justify-content-center" style="width: 36px; height: 36px;">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <div>
                            <small class="text-muted text-uppercase d-block" style="font-size: 10px; font-weight: 700; letter-spacing: 0.05em;">Mã đề thi</small>
                            <strong class="text-danger fs-6">Đề số 05</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bottom Copyright -->
        <div class="d-flex flex-column flex-md-row align-items-center justify-content-between pt-4 gap-3">
            <span class="text-muted small">
                &copy; 2026-2027 <strong>AURA KICKS LABS</strong>. Bài Kiểm Tra Quá Trình - Môn Lập Trình Web.
            </span>
            <div class="d-flex align-items-center gap-3 text-muted small">
                <span>Servlet + JPA (Hibernate)</span>
                <span>•</span>
                <span>SiteMesh Decorators</span>
                <span>•</span>
                <span>SQL Server</span>
            </div>
        </div>
    </div>
</footer>
