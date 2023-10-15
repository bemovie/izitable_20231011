<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
</head>

<body>

<jsp:include page="../nav.jsp"></jsp:include>

	<div>
	   <jsp:include page="../header.jsp"></jsp:include>
	</div>

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
                                        
                                       <input type="date" id="myDate" max="2023-10-25" placeholder="예약 가능 날짜">
                                            
                                            <div class="input-group-addon">
                                                <span class="glyphicon glyphicon-th"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-12 col-sm-12">
                                    <fieldset>
                                        <select value="time" name="time" id="time">
                                            <option value="time">예약 가능 시간</option>
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
                                            <option value="number-guests">인원수</option>
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
// JavaScript를 사용하여 현재 날짜를 가져오는 함수
function getCurrentDate() {
    var today = new Date();
    var year = today.getFullYear();
    var month = (today.getMonth() + 1).toString().padStart(2, '0');
    var day = today.getDate().toString().padStart(2, '0');
    return year + '-' + month + '-' + day;
}

// JavaScript를 사용하여 특정 날짜에 월을 더하는 함수
function addMonths(date, months) {
    var d = new Date(date);
    d.setMonth(d.getMonth() + months);
    return d;
}

// <input> 요소와 min, max를 업데이트
var myDateInput = document.getElementById('myDate');
var currentDate = getCurrentDate();
var oneMonthLater = addMonths(currentDate, 1);

myDateInput.value = currentDate; // 현재 날짜로 <input>의 value 업데이트
myDateInput.min = currentDate; // 최소 날짜 업데이트
myDateInput.max = oneMonthLater.toISOString().slice(0, 10); // 1개월 후의 날짜로 최대 날짜 업데이트
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

<jsp:include page="../footer.jsp"></jsp:include>

</body>

</html>