<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap"
        rel="stylesheet">

    <title>Klassy Cafe - Restaurant HTML Template</title>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="resources/assets/css/font-awesome.css">

    <link rel="stylesheet" href="resources/assets/css/template_izitable.css">

    <link rel="stylesheet" href="resources/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="resources/assets/css/lightbox.css">

    <style>
        .search {
            margin-left: 100px;
            margin-top: 30px;
            float: left;
            width: 450px;
        }

        .search input {
            width: 100%;
            border: 1px solid #bbb;
            border-radius: 8px;
            padding: 10px 12px;
            font-size: 14px;
        }

        .search img {
            position: absolute;
            width: 17px;
            top: 42px;
            right: 430px;
            margin: 0;
        }

        .nav2 {
            margin-left: 10px;
            margin-top: 30px;
        }
    </style>
</head>

<body>

    <!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-xs-12">
                    <div class="right-text-content">
                        <ul class="social-icons">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="logo">
                        <a href="index.html"><img src="resources/assets/images/IZITABLE_logo_white.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-4 col-xs-12">
                    <div class="left-text-content">
                        <p>© Copyright IZITABLE Co.

                            <br>Design: VITAMIN C
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ***** Footer End ***** -->

    <!-- jQuery -->
    <script src="resources/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="resources/assets/js/popper.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="resources/assets/js/owl-carousel.js"></script>
    <script src="resources/assets/js/accordions.js"></script>
    <script src="resources/assets/js/datepicker.js"></script>
    <script src="resources/assets/js/scrollreveal.min.js"></script>
    <script src="resources/assets/js/waypoints.min.js"></script>
    <script src="resources/assets/js/jquery.counterup.min.js"></script>
    <script src="resources/assets/js/imgfix.min.js"></script>
    <script src="resources/assets/js/slick.js"></script>
    <script src="resources/assets/js/lightbox.js"></script>
    <script src="resources/assets/js/isotope.js"></script>

    <!-- Global Init -->
    <script src="resources/assets/js/custom.js"></script>
    <script>

        $(function () {
            var selectedClass = "";
            $("p").click(function () {
                selectedClass = $(this).attr("data-rel");
                $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("." + selectedClass).fadeOut();
                setTimeout(function () {
                    $("." + selectedClass).fadeIn();
                    $("#portfolio").fadeTo(50, 1);
                }, 500);

            });
        });

    </script>
</body>

</html>