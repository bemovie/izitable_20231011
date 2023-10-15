<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="../header.jsp"></jsp:include>

<body>

<jsp:include page="../nav.jsp"></jsp:include>

    <!-- ***** Reservation Us Area Starts ***** -->
    <section class="section" id="reservation">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center">
                    <div class="left-text-content">
                        <div class="section-heading">
                            <h6>Contact Us</h6>
                            <h2>Here You Can Make A Reservation Or Just walkin to our cafe</h2>
                        </div>
                        <p>Donec pretium est orci, non vulputate arcu hendrerit a. Fusce a eleifend riqsie, namei
                            sollicitudin urna diam, sed commodo purus porta ut.</p>
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
                                    <span><a href="#">hello@company.com</a><br><a href="#">info@company.com</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 식당 예약 -->
                <div class="col-lg-6">
                    <div class="contact-form">
                        <form id="contact" action="" method="post">
                        <input type="hidden" name="shopNo" id="shopNo" value="${shop.shopNo}">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h4>Table Reservation</h4>
                                </div>
                                <div class="col-lg-6">
                                    <div id="filterDate2">
                                        <div class="input-group date" data-date-format="dd/mm/yyyy">
                                            <input name="date" id="date" type="text" class="form-control"
                                                placeholder="dd/mm/yyyy">
                                            
                                            <!-- 날짜 선택시(날짜 input 클릭) ajax 발생 -->
                                            <script>
	                                        //~ fetch api 방식 ~
	                                        sInp = document.querySelector('#shopNo');
	                                        dInp = document.querySelector('#date');
	                                        tInp = document.querySelector('#time');
	                                  		dInp.onchange = function() {
	                                  			alert('test');
	                                  			console.log(sInp.value, dInp.value);
	                                  			fetch('/booking/date', {
	                                  				method: 'POST',
	                                  				body: new URLSearchParams({shopNo: sInp.value, bookingDate: dInp.value})
	                                  			}).then(function(response) {
	                                  				//let data = response.json();
	                                  				return response.json();
	                                  			}).then(function(data){ //response.json()의 결과가 인자로 전달
	                                  				console.dir(data);
	                                  				resElm.innerHTML = data.sum +','+ data.mul;
	                                  			}).catch(function(error){
	                                  				console.log(error);
	                                  				//alert(error);
	                                  			});
	                                  		};
                                            </script>
                                                
                                                
                                                
                                            <div class="input-group-addon">
                                                <span class="glyphicon glyphicon-th"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <fieldset>
                                        <select value="time" name="time" id="time">
                                            <option value="time">시간</option>
                                            <c:forEach var="item" items="${timelist}" >
                                            	<option name="${item.hour}" id="${item.hour}">${item.hour}</option>
                                            </c:forEach>
                                        </select>
                                    </fieldset>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <fieldset>
                                        <select value="number-guests" name="number-guests" id="number-guests">
                                            	<option value="number-guests">인원수</option>
                                            <c:forEach var="item" items="${tablelist}" >
                                            	<option name="${item.number}" id="${item.number}">${item.number}</option>
                                            </c:forEach>
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
                                        <button type="submit" id="form-submit" class="main-button-icon">Make A
                                            Reservation</button>
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
    <script src="/resources/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="/resources/assets/js/popper.js"></script>
    <script src="/resources/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/resources/assets/js/owl-carousel.js"></script>
    <script src="/resources/assets/js/accordions.js"></script>
    <script src="/resources/assets/js/datepicker.js"></script>
    <script src="/resources/assets/js/scrollreveal.min.js"></script>
    <script src="/resources/assets/js/waypoints.min.js"></script>
    <script src="/resources/assets/js/jquery.counterup.min.js"></script>
    <script src="/resources/assets/js/imgfix.min.js"></script>
    <script src="/resources/assets/js/slick.js"></script>
    <script src="/resources/assets/js/lightbox.js"></script>
    <script src="/resources/assets/js/isotope.js"></script>

    <!-- Global Init -->
    <script src="/resources/assets/js/custom.js"></script>
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