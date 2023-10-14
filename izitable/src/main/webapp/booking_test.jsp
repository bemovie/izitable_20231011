<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

    <title>Izitable-Reservation</title>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="resources/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="resources/assets/css/font-awesome.css">

    <link rel="stylesheet" href="resources/assets/css/template_izitable.css">

    <link rel="stylesheet" href="resources/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="resources/assets/css/lightbox.css">

	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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

    <!-- ***** Reservation Us Area Starts ***** -->
    <section class="section" id="reservation" >
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center">
                    <div class="left-text-content">
                        <div class="section-heading">
                            <h6>Contact Us</h6>
                            <h2>이벤트 및 인원수 등 추가적인 문의 필요시 이지테이블(IZITABLE) 또는 매장으로 직접 연락 부탁드립니다.</h2>
                        </div>
                        <p>If you need additional inquiries such as events and number of people, please contact the IZITABLE or the store directly.</p>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="phone">
                                    <i class="fa fa-phone"></i>
                                    <h4>Phone Numbers</h4>
                                    <span><a href="#">080-090-0990</a><br><a href="#">080-090-0880</a></span>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="message">
                                    <i class="fa fa-envelope"></i>
                                    <h4>Emails</h4>
                                    <span><a href="#">Izitable@company.com</a><br><a href="#">Izitable-info@company.com</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="contact-form">
                        <form id="contact" action="" method="post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>Table Reservation</h4>
                                </div>
                                <div class="col-lg-12">
                                    <div id="filterDate2">
                                        <div class="input-group date" data-date-format="dd/mm/yyyy">
                                            <input name="date" id="date" type="text" class="form-control"
                                                placeholder="dd/mm/yyyy">
                                            <div class="input-group-addon">
                                                <span class="glyphicon glyphicon-th"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <select value="time" name="time" id="time">
                                            <option value="time">Time</option>
                                            <option name="1" id="1">09:00</option>
                                            <option name="2" id="2">10:00</option>
                                            <option name="3" id="3">11:00</option>
                                            <option name="4" id="4">12:00</option>
                                            <option name="5" id="5">13:00</option>
                                            <option name="6" id="6">14:00</option>
                                            <option name="7" id="7">15:00</option>
                                            <option name="8" id="8">16:00</option>
                                            <option name="9" id="9">17:00</option>
                                            <option name="10" id="10">18:00</option>
                                            <option name="11" id="11">19:00</option>
                                            <option name="12" id="12">20:00</option>
                                            <option name="13" id="13">21:00</option>
                                            <option name="14" id="14">22:00</option>
                                        </select>
                                    </fieldset>
                                </div>
                                
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <select value="number-guests" name="number-guests" id="number-guests">
                                            <option value="number-guests">Number Of Guests</option>
                                            <option name="1" id="1">1</option>
                                            <option name="2" id="2">2</option>
                                            <option name="3" id="3">3</option>
                                            <option name="4" id="4">4</option>
                                            <option name="5" id="5">5</option>
                                            <option name="6" id="6">6</option>
                                            <option name="7" id="7">7</option>
                                            <option name="8" id="8">8</option>
                                            <option name="9" id="9">9</option>
                                            <option name="10" id="10">10</option>
                                        </select>
                                    </fieldset>
                                </div>
                                
                                
                                <div class="col-lg-12">
                                    <fieldset>
                                        <textarea name="message" rows="6" id="message" placeholder="Message"
                                            required=""></textarea>
                                    </fieldset>
                                </div>
                                <div class="col-lg-12">
                                    <fieldset>
                                        <button type="submit" id="form-submit" class="main-button-icon">예약완료하기</button>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Reservation Area Ends ***** -->
    
    
   

    <!-- jQuery -->
    <script src="resources/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="resources/assets/js/popper.js"></script>
    <script src="resources/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
   
    <script src="resources/assets/js/datepicker.js"></script>
    

    <!-- Global Init -->
    <script src="resources/assets/js/custom.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    $(function() {
        $("#date").datepicker({
            dateFormat: "yy년 mm월 dd일", // 한국식 날짜 형식으로 변경 (년, 월, 일 추가)
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // 요일 이름 한국어로 설정
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월 이름 한국어로 설정
            nextText: '다음 달', // 다음 달 버튼 텍스트 설정
            prevText: '이전 달', // 이전 달 버튼 텍스트 설정
        });
    });
</script>
    
    
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