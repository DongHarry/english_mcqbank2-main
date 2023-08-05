<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Trang chủ - English HUS</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-responsive.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
  <link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
        rel="stylesheet" type="text/css">

</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="/images/hus2_pixian.png" alt=""></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">


      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"> Home </a></li>
        <li><a href="#"> About </a></li>
        <li><a href="${pageContext.request.contextPath}/login-page"> Login </a></li>
        <li><a href="${pageContext.request.contextPath}/register"> Register </a></li>
        <div class="icon"> <i class="fa fa-search"></i> </div>
      </ul>
    </div> <!-- /.navbar-collapse -->
  </div>
</nav> <!--  end menu  -->

<div class="info">
  <div class="container">
    <div class="row">
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <h3>English HUS</h3>
        <h4>Đơn vị đào tạo uy tín chất lượng hàng đầu Việt Nam</h4>
      </div>
      <div class="text-right col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <ol class="breadcrumb">
          <li>
            <a href="#">Home</a>
          </li>
          <li>
            <a href="#">Link</a>
          </li>
          <li class="active">Current</li>
        </ol>
      </div>

    </div>
  </div>

</div> <!-- end info -->

<div class="container">
  <div class="row">
    <div class="col-lg-12">
      <div id="carousel-id" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-id" data-slide-to="0" class=""></li>
          <li data-target="#carousel-id" data-slide-to="1" class=""></li>
          <li data-target="#carousel-id" data-slide-to="2" class="active"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
                  <div class="container">
                    <div class="row">

                      <div class="span5">
                        <div class="carousel-caption">
                          <h1>Đào tạo chất lượng</h1>
                          <p class="lead" style="margin-left: -197px;"> Chúng tôi cung cấp cho các bạn những kiến
                            thức tốt nhất.</p>
                        </div>
                      </div>

                      <div class="span6">
                        <img
                                src="${pageContext.request.contextPath}/images/slide/aaa.jpg"
                                alt="img not found aab" />
                      </div>
                    </div>
                  </div>

          </div>
          <div class="item">
                  <div class="container">
                    <div class="row">

                      <div class="span5">
                        <div class="carousel-caption">
                          <h1>Đề thi phân cấp</h1>
                          <p class="lead" style="margin-left: -65px;">Chúng tôi cung cấp cho các bạn các dạng đề thi có nhiều cấp độ.</p>
                        </div>
                      </div>

                      <div class="span6">
                        <img
                                src="${pageContext.request.contextPath}/images/slide/slide2.jpg"
                                alt="img not found aab" />
                      </div>
                    </div>
                  </div>

          </div>
          <div class="item">
                  <div class="container">
                    <div class="row">

                      <div class="span5">
                        <div class="carousel-caption">
                          <h1>Thi thử online</h1>
                          <p class="lead" style="margin-left: -234px;">Các bạn sẽ được trải nghiệm thi online.</p>
                        </div>
                      </div>

                      <div class="span6">
                        <img
                                src="${pageContext.request.contextPath}/images/slide/slide3.jpg"
                                alt="img not found aab" />
                      </div>
                    </div>
                  </div>

          </div>
        </div>
        <!--Carousel nav -->
        <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        <!--Carousel nav -->
      </div> <!--end slide image-->
    </div>
  </div>
</div> <!--end container carousel-->


<div class="container">
  <div class="row">
    <div class="span8">
      <img
              src="${pageContext.request.contextPath}/images/background3.png">
    </div>

    <div class="span4">
      <!--   <img class="hidden-phone" src="Template/Frontend/img/icon4.png" alt="img not found"> -->
      <h1 align="center">Tin cậy - uy tín</h1>
      <p align="justify">Mỗi năm, có hàng nghìn lượt học viên đã tham
        dự các khóa học tiếng Anh tại English-HUS và đạt kết quả như ý muốn. Chúng
        tôi tự hào là một trong những trung tâm ngoại ngữ được yêu thích,
        là địa chỉ tin cậy của các bạn sinh viên Đại học Quốc gia Hà Nội,
        và nhiều người đi làm trên địa bàn Hà Nội.</p>

    </div>
  </div>
</div>

<!-- Map -->
<section id="contact" class="map">
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.919164751597!2d105.80540227504778!3d20.99587718
  890756!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acbf0df2c0e5%3A0xd740a66998e1a0ed!2zVHLGsOG7nW5nIMSQ4bqhaS
  Bo4buNYyBLaG9hIGjhu41jIFThu7Egbmhpw6puLCDEkOG6oWkgaOG7jWMgUXXhu5FjIGdpYSBIw6AgTuG7mWk!5e0!3m2!1svi!2s!4v1691232715411!5m2!
  1svi!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-dow
  ngrade"></iframe>
</section>

<!-- Footer -->
<footer  class="footer">
  <!-- style=" height: 20px; width:100%;left: 0;bottom: 0; " -->
  <div class="container">
    <div class="row">


      <div class="span6" align="center">Copyright &copy; English-HUS 2020-2024 | All Rights Reserved<br>
        <small>HA NOI UNIVERSITY OF SCIENCE</small>
      </div>


      <div class="span6">
        <div class="social pull-right">
          <a href="#"><img src="${pageContext.request.contextPath}/images/social/googleplus.png" alt=""></a>
          <a href="#"><img src="${pageContext.request.contextPath}/images/social/dribbble.png" alt=""></a>
          <a href="#"><img src="${pageContext.request.contextPath}/images/social/twitter.png" alt=""></a>
          <a href="#"><img src="${pageContext.request.contextPath}/images/social/dribbble.png" alt=""></a>
          <a href="#"><img src="${pageContext.request.contextPath}/images/social/rss.png" alt=""></a>
        </div>
      </div>
    </div>
  </div>
</footer> <!--end footer-->

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>
