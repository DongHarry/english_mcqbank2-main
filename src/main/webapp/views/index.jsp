<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!--title-->
  <title>Apelish - Phần mềm thi Tiếng Anh</title>

  <!--favicon icon-->
  <link rel="icon" href="${pageContext.request.contextPath}/resource/img/favicon.png" type="image/png" sizes="16x16">

  <!-- font-awesome css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font-awesome.min.css">

  <!--themify icon-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/themify-icons.css">

  <!-- magnific popup css-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/magnific-popup.css">

  <!--owl carousel -->
  <link href="${pageContext.request.contextPath}/resource/css/owl.theme.default.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resource/css/owl.carousel.min.css" rel="stylesheet">

  <!-- bootstrap core css -->
  <link href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css" rel="stylesheet">

  <!-- custom css -->
  <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet">

  <!-- responsive css -->
  <link href="${pageContext.request.contextPath}/resource/css/responsive.css" rel="stylesheet">

  <script src="${pageContext.request.contextPath}/resource/js/vendor/modernizr-2.8.1.min.js"></script>
  <!-- HTML5 Shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/resource/js/vendor/html5shim.js"></script>
  <script src="${pageContext.request.contextPath}/resource/js/vendor/respond.min.js"></script>
  <![endif]-->

</head>


<body>

<!-- Preloader -->
<div id="preloader">
  <div id="loader"></div>
</div>
<!--end preloader-->

<div id="main" class="main-content-wraper">
  <div class="main-content-inner">

    <!--start header section-->
    <header class="header">
      <!--start navbar-->
      <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <div class="row">
            <div class="navbar-header page-scroll">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                      data-target="#myNavbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand page-scroll" href="/home">
                <img src="../resource/img/logo.png" alt="logo">
              </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="navbar-collapse collapse" id="myNavbar">
              <ul class="nav navbar-nav navbar-right">
                <li class="active"><a class="page-scroll" href="#hero">Home</a></li>
                <li><a class="page-scroll" href="#features">Features</a></li>
                <li><a class="page-scroll" href="#pricing">Pricing</a></li>
                <li><a class="page-scroll" href="#faqs">Faq</a></li>
                <li><a class="page-scroll" href="#news">News</a></li>
                <li><a class="page-scroll" href="#contact">Contact</a></li>
              </ul>
            </div>

          </div>
        </div>
      </div>
      <!--end navbar-->
    </header>
    <!--end header section-->

    <!--start hero section-->
    <section id="hero" class="section-lg section-hero section-circle">
      <!--background circle shape-->
      <div class="shape shape-style-1 shape-primary">
        <span class="circle-150"></span>
        <span class="circle-50"></span>
        <span class="circle-50"></span>
        <span class="circle-75"></span>
        <span class="circle-100"></span>
        <span class="circle-75"></span>
        <span class="circle-50"></span>
        <span class="circle-100"></span>
        <span class="circle-50"></span>
        <span class="circle-100"></span>
      </div>
      <!--background circle shape-->
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            <div class="hero-content-wrap">
              <div class="hero-content">
                <h1>Apelish - Luyện thi Tiếng Anh</h1>
                <p>Cái tên Apelish gắn liền với ‘’hành trình’’ Startup Việt, với những dự án bảo trợ chuyên môn và đồng hành kiến thức học thuật cùng VnExpress, VTV7, VTV2.. </p>
                <div class="slider-action-btn">
                  <a href="/register" class="btn softo-solid-btn">Đăng kí ngay để trải nghiệm</a>
                  <a href="#" class="btn btn-icon"><i class="fa fa-android"></i></a>
                  <a href="#" class="btn btn-icon"><i class="fa fa-windows"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="mobile-slider-area">
              <div class="phone">
                <img src="../resource/img/iphone-x-frame.png" alt="Phone" class="img-responsive">
                <div class="mobile-slider owl-carousel owl-theme">
                  <div class="item"><img src="../resource/img/top-screen-1.png" alt="Screen 1"
                                         class="img-responsive"></div>
                  <div class="item"><img src="../resource/img/top-screen-5.png" alt="Screen 1"
                                         class="img-responsive"></div>
                  <div class="item"><img src="../resource/img/top-screen-2.png" alt="Screen 2"
                                         class="img-responsive"></div>
                  <div class="item"><img src="../resource/img/top-screen-6.png" alt="Screen 2"
                                         class="img-responsive"></div>
                  <div class="item"><img src="../resource/img/top-screen-3.png" alt="Screen 3"
                                         class="img-responsive"></div>
                  <div class="item"><img src="../resource/img/top-screen-7.png" alt="Screen 3"
                                         class="img-responsive"></div>
                  <div class="item"><img src="../resource/img/top-screen-8.png" alt="Screen 3"
                                         class="img-responsive"></div>
                </div>
              </div>

              <div class="slider-indicator">
                <ul>
                  <li id="prev">
                    <i class="fa fa-angle-left"></i>
                  </li>
                  <li id="next">
                    <i class="fa fa-angle-right"></i>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="section-shape">
        <img src="../resource/img/waves-shape.svg" alt="shape image">
      </div>
    </section>
    <!--end hero section-->

    <!--start promo section-->
    <section class="promo-section ptb-90">
      <div class="promo-section-wrap">
        <div class="container">
          <div class="row">
            <div class="col-md-3 col-sm-6">
              <div class="bg-secondary single-promo-section text-center">
                <div class="single-promo-content">
                  <span class="ti-face-smile  "></span>
                  <h6>Dễ sử dụng</h6>
                  <p>Thao tác dễ dàng, tiện lợi</p>
                </div>
                <div class="line"></div>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="bg-secondary single-promo-section text-center">
                <div class="single-promo-content">
                  <span class="ti-vector"></span>
                  <h6>Giao diện thân thiện</h6>
                  <p>Các hình ảnh đơn giản, gần gũi với nguời dùng</p>
                </div>
                <div class="line"></div>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="bg-secondary single-promo-section text-center">
                <div class="single-promo-content">
                  <span class="ti-palette"></span>
                  <h6>Gắn liền với những dự án bảo trợ và đồng hành kiến thức học thuật</h6>
                  <p>Kết nối với nhiều báo điện tử, trang thông tin uy tín như Dân Trí, kênh 14, Vietnamnet, VTV, VTC…</p>
                </div>
                <div class="line"></div>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="bg-secondary single-promo-section text-center">
                <div class="single-promo-content">
                  <span class="ti-headphone-alt"></span>
                  <h6>24/7 Support</h6>
                  <p>Giải đáp, hỗ trợ mọi thắc mắc của người dùng</p>
                </div>
                <div class="line"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--end promo section-->

    <!--start features section-->
    <section id="features" class="bg-secondary ptb-90">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading text-center">
              <h3>Apelish Features</h3>
              <p>Apelish - Luyện thi Tiếng Anh luôn hướng tới sự hoàn thiện và trải nghiệm tuyệt vời nhất đến người dùng.
                Luôn nắm bắt và cập nhật các xu hướng công nghệ mới nhất.</p>
            </div>
          </div>
        </div>
        <div class="row align-items-center">
          <div class="col-md-4 col-sm-6">
            <!--feature single start-->
            <div class="single-feature mb-5">
              <div class="feature-icon">
                <div class="icon icon-shape bg-color white-text">
                  <i class="fa fa-object-ungroup"></i>
                </div>
              </div>
              <div class="feature-content">
                <h5>Bài thi phong phú</h5>
                <p class="mb-0">Modular and interchangable componente between layouts and even demos.</p>
              </div>
            </div>
            <!--feature single end-->
            <!--feature single start-->
            <div class="single-feature mb-5">
              <div class="feature-icon">
                <div class="icon icon-shape bg-color white-text">
                  <i class="fa fa-dropbox"></i>
                </div>
              </div>
              <div class="feature-content">
                <h5>Nhiều chủ đề lựa chọn</h5>
                <p class="mb-0">Modular and interchangable componente between layouts and even demos.</p>
              </div>
            </div>
            <!--feature single end-->
            <!--feature single start-->
            <div class="single-feature mb-5">
              <div class="feature-icon">
                <div class="icon icon-shape bg-color white-text">
                  <i class="fa fa-smile-o"></i>
                </div>
              </div>
              <div class="feature-content">
                <h5>Hướng dẫn trực tiếp 24/7</h5>
                <p class="mb-0">Modular and interchangable componente between layouts and even demos.</p>
              </div>
            </div>
            <!--feature single end-->
          </div>
          <div class="col-md-4 hidden-sm hidden-xs">
            <div class="feature-image">
              <img src="../resource/img/feature-image.png" class="pos-hcenter img-responsive" alt="">
            </div>
          </div>
          <div class="col-md-4 col-sm-6">
            <!--feature single start-->
            <div class="single-feature mb-5">
              <div class="feature-icon">
                <div class="icon icon-shape bg-color white-text">
                  <i class="fa fa-file-archive-o"></i>
                </div>
              </div>
              <div class="feature-content">
                <h5>Luôn update các bài thi mới nhất</h5>
                <p class="mb-0">Modular and interchangable componente between layouts and even demos.</p>
              </div>
            </div>
            <!--feature single end-->
            <!--feature single start-->
            <div class="single-feature mb-5">
              <div class="feature-icon">
                <div class="icon icon-shape bg-color white-text">
                  <i class="fa fa-adjust"></i>
                </div>
              </div>
              <div class="feature-content">
                <h5>Hình ảnh sống động, rõ nét</h5>
                <p class="mb-0">Modular and interchangable componente between layouts and even demos.</p>
              </div>
            </div>
            <!--feature single end-->
            <!--feature single start-->
            <div class="single-feature mb-5">
              <div class="feature-icon">
                <div class="icon icon-shape bg-color white-text">
                  <i class="fa fa-smile-o"></i>
                </div>
              </div>
              <div class="feature-content">
                <h5>Dễ dàng sử dụng</h5>
                <p class="mb-0">Modular and interchangable componente between layouts and even demos.</p>
              </div>
            </div>
            <!--feature single end-->
          </div>
        </div>

      </div>
    </section>
    <!--end features section-->

    <!--start app video section-->
    <div id="video-app" class="video-app-1"
         style="background: url('img/video-play.jpg')no-repeat center center / cover">
      <div class="overlay-1">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="video-play-button">
                <a href="https://www.youtube.com/watch?v=nipyzMW9l6I"
                   class="video video-play mfp-iframe" data-toggle="modal"
                   data-target="#video-popup">
                  <span class="ti-control-play"></span>
                </a>
              </div>
            </div>
          </div>
        </div>
        <img src="../resource/img/bg-wave-sym.png" alt="shape image" class="img-responsive">
      </div><!-- end overlay -->
    </div>
    <!--end app video section-->

    <!--start pricing-->
    <section id="pricing" class="pricing-section ptb-90">
      <div class="pricing-section-wrap">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="section-heading text-center">
                <h3>Pricing Plan</h3>
                <p>Chúng tôi tin rằng Apelish sẽ đáp ứng các nhu cầu của bạn. <br>
                  Hãy bắt đầu ngay hôm nay!.</p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="bg-color-sky-light">
              <div class="content-md container">
                <div class="row">
                  <div class="col-md-4">
                    <!--start pricing single-->
                    <div class="pricing-single bg-secondary">
                      <div class="pricing-single-header">
                        <h4>Basic</h4>
                        <span>Individual</span>
                      </div>
                      <div class="pricing-single-content">
                        <div class="mb-40">
                          <span class="price-icon-sign"><i class="fa fa-dollar"></i></span>
                          <span class="main-price">7.</span>
                          <span class="sub-price">00</span>
                          <span class="main-price-info">Month</span>
                        </div>
                        <div class="center-block">
                          <button type="button" class="softo-btn-outline">Mua ngay</button>
                        </div>
                      </div>
                    </div>
                    <!--end pricing single-->
                  </div>
                  <div class="col-md-4">
                    <!--start pricing single-->
                    <div class="pricing-single bg-secondary">
                      <div class="pricing-single-header">
                        <h4>Premium</h4>
                        <span>Business</span>
                      </div>
                      <div class="pricing-single-content">
                        <div class="mb-40">
                          <span class="price-icon-sign"><i class="fa fa-dollar"></i></span>
                          <span class="main-price">15.</span>
                          <span class="sub-price">00</span>
                          <span class="main-price-info">Month</span>
                        </div>
                        <div class="center-block">
                          <button type="button" class="btn softo-solid-btn">Mua ngay</button>
                        </div>
                      </div>
                    </div>
                    <!--end pricing single-->
                  </div>
                  <div class="col-md-4">
                    <!--start pricing single-->
                    <div class="pricing-single bg-secondary">
                      <div class="pricing-single-header">
                        <h4>Ultimate</h4>
                        <span>Enterprise</span>
                      </div>
                      <div class="pricing-single-content">
                        <div class="mb-40">
                          <span class="price-icon-sign"><i class="fa fa-dollar"></i></span>
                          <span class="main-price">23.</span>
                          <span class="sub-price">00</span>
                          <span class="main-price-info">Month</span>
                        </div>
                        <div class="center-block">
                          <button type="button" class="btn softo-btn-outline">Mua ngay</button>
                        </div>
                      </div>
                    </div>
                    <!--end pricing single-->
                  </div>
                </div>
                <!--end row-->
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--end pricing-->

    <!--testimonial section start-->
    <section class="testimonial-section bg-secondary ptb-90">
      <div class="testimonial-wrap">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="section-heading text-center">
                <h3>300+ giáo viên truyền cảm hứng</h3>
                <p>Tài năng, cá tính và tâm huyết trong từng bài giảng</p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="owl-carousel owl-theme testimonial-slider">
                <div class="item">
                  <div class="single-testimonial-item">
                    <span class="blockquote-icon"><i class="fa fa-quote-left"></i></span>
                    <div class="testimonial-content">
                      <p>Chọn làm giáo viên xuất phát từ một suy nghĩ trẻ con khi mình học cấp hai.
                        Làm giáo viên tiếng Anh là một nghề khó, vì mỗi học sinh
                        lại có một tính cách khác nhau, tuy nhiên, nếu có thể làm các bạn yêu môn này được,
                        và tự tin khi giao tiếp, thì dù tiếng Anh của bạn tệ đến đâu thì bạn vẫn có thể khá
                        hơn rất nhiều, vì các bạn tự tin mà phải không?</p>
                    </div>
                    <div class="testimonial-author">
                      <img src="../resource/img/testimonial-4.png" alt="">
                      <div class="testimonial-author-info">
                        <h6>Ms Trang Chuối</h6>
                        <span>Dynamic Fighter</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item">
                  <div class="single-testimonial-item">
                    <span class="blockquote-icon"><i class="fa fa-quote-left"></i></span>
                    <div class="testimonial-content">
                      <p>Cô đã đến với tiếng Anh và yêu vẻ đẹp của ngôn ngữ này một cách hoàn toàn tình cờ.
                        Sau khi thử thách bản thân bằng việc nộp đơn vào vị trí giáo viên tiếng Anh,
                        cô chợt nhận ra tiếng Anh chính là định mệnh của bản thân và sứ mệnh của cô là
                        lan truyền niềm đam mê ấy cho học sinh của cô thông qua việc thúc đẩy và truyền
                        cảm hứng cho các bạn.</p>
                    </div>
                    <div class="testimonial-author">
                      <img src="../resource/img/testimonial-4.png" alt="">
                      <div class="testimonial-author-info">
                        <h6>Ms.Phương Hoa</h6>
                        <span>Resilient Fighter</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item">
                  <div class="single-testimonial-item">
                    <span class="blockquote-icon"><i class="fa fa-quote-left"></i></span>
                    <div class="testimonial-content">
                      <p>Mình đã cố gắng hết sức để học tiếng Anh và đạt điểm IELTS tổng thể 8.0, bao gồm 9.0 Reading
                        và Listening mà mình thực sự tự hào. Lời cuối cùng, mình muốn nói rằng: Khoản đầu tư tốt
                        nhất bạn có thể làm là cho chính bản thân bạn, và với tất cả các học viên trẻ của mình ở đây,
                        hãy cho mình cơ hội làm bài kiểm tra IELTS sẽ là bước đầu tiên tốt nhất.
                      </p>
                    </div>
                    <div class="testimonial-author">
                      <img src="../resource/img/testimonial-4.png" alt="">
                      <div class="testimonial-author-info">
                        <h6>Mr Nam Dương</h6>
                        <span>Muscular Fighter</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="item">
                  <div class="single-testimonial-item">
                    <span class="blockquote-icon"><i class="fa fa-quote-left"></i></span>
                    <div class="testimonial-content">
                      <p>Đã nhiều năm kể từ ngày mình quyết định theo đuổi sự nghiệp giáo dục, đó là khoảng mười năm trước.
                        Lúc đó, mình rất háo hức trở thành một người có thể giúp truyền cảm hứng cho các bạn học viên,
                        khi mình hiểu những khó khăn mà họ có thể gặp phải khi họ muốn học ngoại ngữ từ kinh nghiệm
                        của bản thân. Đặc biệt là khi tiếng Anh đang ngày càng trở nên phổ biến,
                        học viên thực sự cần một cố vấn giỏi để giúp đỡ và tư vấn, hoặc có thể chỉ đơn giản
                        là cung cấp cho họ nguồn cảm hứng mới.</p>
                    </div>
                    <div class="testimonial-author">
                      <img src="../resource/img/testimonial-4.png" alt="">
                      <div class="testimonial-author-info">
                        <h6>Mr. Huy Thạch</h6>
                        <span>Gregarious Fighter</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--testimonial section end-->

    <!--start faq section-->
    <section id="faqs" class="faq-section ptb-90">
      <div class="faq-section-wrap">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="section-heading">
                <h3>Faq's</h3>
                <p>Trước khi chúng ta có cơ hội gặp gỡ, cảm ơn bạn đã sẵn lòng tìm hiểu tại đây.
                  Đội ngũ Apelish rất vui được cùng bạn chia sẻ những câu chuyện đằng sau thương hiệu đáng tự hào.</p>
              </div>
              <div class="panel-group" id="accordion">
                <!-- Start Single Item -->
                <div class="panel panel-default">
                  <div class="panel-heading" id="headingOne">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">
                        Về Apelish - Luyện thi Tiếng Anh
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                      <p>★ Hành trình của những chiến binh không mệt mỏi để thắp nên những ngọn lửa đam mê với IELTS, từng bước chinh phục điểm số IELTS như mong muốn. </br>

                        ★ Là khoảng thời gian từ con số 1 trở thành số 29 cơ sở trên toàn quốc đồng thời phát triển hệ thống học trực tuyến rộng khắp thế giới. </br>

                        ★ Là những năm Apelish miệt mài với mục tiêu Phổ cập IELTS cho người Việt và hoàn thành sứ mệnh Vì 1 triệu Người Việt đạt 6.5 IELTS. </br>

                        ★ Chặng đường cải tiến phương pháp đào tạo, là thay đổi hoàn thiện, cùng hàng nghìn học viên vươn lên đạt thành công với sự cố gắng giữ vững mức giá học phí rẻ nhất. </p>
                    </div>
                  </div>
                </div>
                <!-- End Single Item -->
                <!-- Start Single Item -->
                <div class="panel panel-default">
                  <div class="panel-heading" id="headingTwo">
                    <h4 class="panel-title">
                      <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                        Về Giáo viên
                      </a>
                    </h4>
                  </div>
                  <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                      <p>Đội ngũ giáo viên chuyên môn giỏi, xuất thân từ các các trường học uy tín hàng đầu quốc tế
                        hoặc trường ngoại ngữ có tiếng tại Việt Nam, đồng thời sở hữu chứng chỉ TESOL với phương
                        pháp và kỹ năng giảng dạy chuyên sâu. Bên cạnh đó giáo viên IELTS Fighter được tinh
                        tuyển, đào tạo khắt khe, áp dụng đồng bộ phương pháp RIPL trong giảng dạy, giúp học viên
                        cán đích thành công. </p>
                    </div>
                  </div>
                </div>
                <!-- End Single Item -->
                <!-- Start Single Item -->
                <div class="panel panel-default">
                  <div class="panel-heading" id="headingThree">
                    <h4 class="panel-title">
                      <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                        Về Phương pháp đào tạo
                      </a>
                    </h4>
                  </div>
                  <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                      <p>Học viên Apelish không chỉ đơn thuần được bồi dưỡng về mặt kiến thức logic,
                        chắt lọc mà còn được thúc đẩy cảm hứng học tập, đẩy mạnh tính thực hành và phát
                        triển khả năng tự khám phá kiến thức của bản thân. Chúng tôi đặt trọng tâm vào việc
                        xây dựng chân dung một học trò thành công, sở hữu những tính cách, kỹ năng không thể
                        thiếu trong thế kỷ 21. </p>
                    </div>
                  </div>
                </div>
                <!-- End Single Item -->
                <!-- Start Single Item -->
                <div class="panel panel-default">
                  <div class="panel-heading" id="headingFour">
                    <h4 class="panel-title">
                      <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                        Câu chuyện của Apelish
                      </a>
                    </h4>
                  </div>
                  <div id="collapseFour" class="panel-collapse collapse">
                    <div class="panel-body">
                      <p>Từ khát khao lan tỏa tình yêu IELTS tới hành trình 7 năm - 60 cơ sở - chắp
                        cánh cho hàng triệu người chinh phục ước mơ... </p>
                    </div>
                  </div>
                </div>
                <!-- End Single Item -->
              </div>
            </div>
            <div class="col-md-6">
              <div class="faq-img">
                <img src="../resource/img/faq-right.png" class="img-responsive" alt="faq image">
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--end faq section-->

    <!--start product counter section-->
    <section class="product-counter-section ptb-50">
      <div class="product-counter-wrap">
        <div class="container">
          <div class="row">
            <div class="col-md-5 col-sm-6">
              <div class="counter-content-wrap">
                <span class="ti-cup"></span>
                <h6 class="counter-title"><strong>Apelish</strong></h6>
                <p>Đội ngũ đáng tin cậy</p>
              </div>
            </div>
            <div class="col-md-7 col-sm-6">
              <ul class="counter-list list-inline text-right">
                <li>
                  <span class="count">5000+</span>
                  <span class="title">Users</span>
                </li>
                <li>
                  <span class="count">300+</span>
                  <span class="title">Đề thi</span>
                </li>
                <li>
                  <span class="count">24/7</span>
                  <span class="title">Hỗ trợ trực tuyến</span>
                </li>

              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--end product counter section-->

    <!--start blog section -->
    <section id="news" class="ptb-90 bg-secondary">
      <div class="blog-section-wrap">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="section-heading text-center">
                <h3>Báo chí nói về Apelish</h3>
                <p>Cái tên Apelish gắn liền với ‘’hành trình kỳ lân’’ Startup Việt, với những dự án bảo trợ
                  chuyên môn và đồng hành kiến thức học thuật cùng VnExpress, VTV7, VTV2... Ngoài ra Apelish
                  còn kết nối với nhiều báo điện tử, trang thông tin uy tín như báo Giáo dục thời đại của
                  Bộ Giáo dục, Dân Trí, kênh 14, Vietnamnet, VTV, VTC… để phủ sóng rộng rãi thông tin,
                  kiến thức về IELTS, những kinh nghiệm học và thi IELTS mới nhất đến đông đảo độc giả.</p>
              </div>
            </div>
          </div>
          <div class="row">
            <div id="sliderBlog" class="owl-carousel">
              <div class="single-blog-article">
                <div class="blog-post-img-thumb">
                  <a href="blog-details.html" target="_blank">
                    <img src="../resource/img/blog-img1.jpg" alt="">
                  </a>
                </div>
                <div class="blog-post-content-area">
                  <h3><a href="blog-details.html" target="_blank">VnExpress - Apelish thuộc top 10 dịch vụ người Việt tin dùng</a></h3>
                  <p>Sự kiện thường niên Lễ trao giải Hàng Việt tốt được người Việt tin dùng 2022 đã xứng tên 10 dịch vụ được yêu
                    thích nhất trong năm, sau khi tiến hành khảo sát trên toàn quốc. </p>
                  <div class="blog-footer-area">
                    <a class="readmore-btn" href="https://ielts-fighter.com/tin-tuc/vnexpress-ielts-fighter-top-10-dich-vu-2022_mt1641797458.html" target="_blank">Read
                      More <i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>

              <div class="single-blog-article">
                <div class="blog-post-img-thumb">
                  <a href="blog-details.html" target="_blank">
                    <img src="../resource/img/blog-img2.jpg" alt="">
                  </a>
                </div>
                <div class="blog-post-content-area">
                  <h3><a href="blog-details.html" target="_blank">Kenh14 - ISTEP, kỳ thi đánh giá năng lực
                    tiếng Anh cho học sinh Gen Z</a></h3>
                  <p>ISTEP (IELTS Fighter Junior's Special
                    Test of English Proficiency) được thiết kế chuyên biệt, dành riêng cho học sinh Gen Z từ lớp
                    6 đến lớp 10. Bài thi được nghiên cứu và đồng tổ chức bởi đội ngũ IELTS Fighter Junior và
                    IDP Education Việt Nam.</p>
                  <div class="blog-footer-area">
                    <a class="readmore-btn" href="https://ielts-fighter.com/tin-tuc/kenh14---istep-ky-thi-danh-gia-nang-luc-tieng-anh-cho-hoc-sinh-gen-z_mt1641797140.html" target="_blank">Read
                      More <i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>

              <div class="single-blog-article">
                <div class="blog-post-img-thumb">
                  <a href="blog-details.html" target="_blank">
                    <img src="../resource/img/blog-img3.jpg" alt="">
                  </a>
                </div>
                <div class="blog-post-content-area">
                  <h3><a href="blog-details.html" target="_blank">VNExpress - IELTS Fighter sáp nhập thêm Globalway tạo hệ sinh thái du học toàn diện</a></h3>
                  <p>VNExpress - Sáng ngày 28/08/2021 hệ thống đào tạo Anh ngữ IELTS Fighter và IMAP Việt Nam chính thức sáp nhập thương hiệu Du học - Định cư
                    - Đầu tư - Bất Động Sản hàng đầu Việt Nam - Globalway vào hệ sinh thái của doanh nghiệp. </p>
                  <div class="blog-footer-area">
                    <a class="readmore-btn" href="https://ielts-fighter.com/tin-tuc/vnexpress---ielts-fighter-sap-nhap-them-globalway-tao-he-sinh-thai-du-hoc-toan-dien_mt1641797136.html" target="_blank">Read
                      More <i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>
              <div class="single-blog-article">
                <div class="blog-post-img-thumb">
                  <a href="blog-details.html" target="_blank">
                    <img src="../resource/img/blog-img4.jpg" alt="">
                  </a>
                </div>
                <div class="blog-post-content-area">
                  <h3><a href="blog-details.html" target="_blank">Vietnamnet - IELTS Fighter nâng cấp phương
                    pháp đào tạo RIPL đề cao trải nghiệm học viên</a></h3>
                  <p>Phương pháp giảng dạy mới RIPL được tinh chọn dựa trên phản hồi khách quan của học viên và
                    được nghiên cứu bởi đội ngũ giáo viên xuất sắc, các chuyên gia đào tạo và Hội đồng Cố vấn
                    Chuyên môn IELTS Fighter và IMAP Việt Nam.</p>
                  <div class="blog-footer-area">
                    <a class="readmore-btn" href="https://ielts-fighter.com/tin-tuc/vietnamnet---ielts-fighter-nang-cap-phuong-phap-dao-tao-ripl-de-cao-trai-nghiem-hoc-vien_mt1641797133.html" target="_blank">Read
                      More <i class="fa fa-angle-right"></i></a>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>
    <!--end blog section -->

    <!--contact us section start-->
    <section id="contact" class="contact-us ptb-90">
      <div class="contact-us-wrap">
        <div class="container">
          <div class="row">
            <div class="col-md-5">
              <div class="section-heading">
                <h3>Apelish - Luyện thi Tiếng Anh</h3>
                <p>
                  Với sứ mệnh Tiên phong Phổ cập IELTS cho người Việt, Apelish nỗ lực mỗi ngày
                  để cùng các bạn học IELTS dàng hơn, chinh phục được đỉnh cao IELTS, phục vụ các mục tiêu phía trước. </br>
                  - Đối tác Bạch kim của IDP Việt Nam </br>
                  - Đối tác uy tín lâu năm của VnExpress, Viettel, Panasonic...</p>
              </div>
              <div class="footer-address">
                <h6>Địa chỉ</h6>
                <p>334 Nguyễn Trãi, Thanh Xuân, Hà Nội</p>
                <ul>
                  <li><i class="fa fa-phone"></i> <span>Phone: +84 337.812.611</span></li>
                  <li><i class="fa fa-envelope-o"></i> <span>Email : <a
                          href="mailto:phamduongvietanh_t65@hus.edu.vn">phamduongvietanh_t65@hus.edu.vn</a></span>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-md-7">
              <form:form action="${pageContext.request.contextPath}/sendContactMail" method="POST" id="contactForm1" class="contact-us-form" novalidate="novalidate">
                <h6>Đừng bỏ lỡ cơ hội</h6>
                <div class="row">
                  <div class="col-sm-6 col-xs-12">
                    <div class="form-group">
                      <input type="text" class="form-control" name="name"
                             placeholder="Họ và tên" required="required">
                    </div>
                  </div>
                  <div class="col-sm-6 col-xs-12">
                    <div class="form-group">
                      <input type="email" class="form-control" name="email"
                             placeholder="Địa chỉ email" required="required">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-6 col-xs-12">
                    <div class="form-group">
                      <input type="text" name="phone" value="" class="form-control"
                             id="phone" placeholder="Số điện thoại">
                    </div>
                  </div>
                  <div class="col-sm-6 col-xs-12">
                    <div class="form-group">
                      <input type="text" name="company" value="" size="40"
                             class="form-control" id="company" placeholder="Địa chỉ">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xs-12">
                    <div class="form-group">
                                                    <textarea name="message" id="message" class="form-control" rows="7"
                                                              cols="25" placeholder="Bạn cần hỗ trợ điều gì?"></textarea>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-12 mt-20">
                    <button type="submit" class="btn softo-solid-btn pull-right"
                            id="btnContactUs">
                      Gửi
                    </button>
                  </div>
                </div>
              </form:form>
              <p class="form-message"></p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--contact us section end-->

    <!--start footer section-->
    <footer class="footer-section bg-secondary ptb-60">
      <div class="footer-wrap">
        <div class="container">
          <div class="row">
            <div class="col-md-6 col-md-offset-3">
              <div class="footer-single-col text-center">
                <img src="../resource/img/logo-color.png" alt="footer logo">
                <div class="footer-social-list">
                  <ul class="list-inline">
                    <li><a href="#"> <i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"> <i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"> <i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"> <i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"> <i class="fa fa-youtube"></i></a></li>
                  </ul>
                </div>
                <div class="copyright-text">
                  <p>&copy; copyright <a href="#">ApeTech</a> Software Template By <a
                          href="" target="_blank">Team INTX</a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!--end footer section-->

  </div><!--end main content inner-->
</div>
<!--end main container -->


<!--=========== all js file link ==============-->

<!-- main jQuery -->
<script src="${pageContext.request.contextPath}/resource/js/jquery-3.3.1.min.js"></script>

<!-- bootstrap core js -->
<script src="${pageContext.request.contextPath}/resource/js/bootstrap.min.js"></script>

<!-- smothscroll -->
<script src="${pageContext.request.contextPath}/resource/js/jquery.easeScroll.min.js"></script>

<!--owl carousel-->
<script src="${pageContext.request.contextPath}/resource/js/owl.carousel.min.js"></script>

<!-- scrolling nav -->
<script src="${pageContext.request.contextPath}/resource/js/jquery.easing.min.js"></script>

<!--fullscreen background video js-->
<script src="${pageContext.request.contextPath}/resource/js/jquery.mb.ytplayer.min.js"></script>

<!--typed js -->
<script src="${pageContext.request.contextPath}/resource/js/typed.min.js"></script>

<!--magnific popup js-->
<script src="${pageContext.request.contextPath}/resource/js/magnific-popup.min.js"></script>

<!-- custom script -->
<script src="${pageContext.request.contextPath}/resource/js/scripts.js"></script>

</body>
</html>
