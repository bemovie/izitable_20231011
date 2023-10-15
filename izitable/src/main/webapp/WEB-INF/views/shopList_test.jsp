<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 문교수님 CSS -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"> -->

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<!-- 문교수님 CSS -->

<%-- <jsp:include page="../header.jsp"></jsp:include> --%>

<link rel="stylesheet" type="text/css" href="../../../resources/css/modal.css">

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3deea4e437afacaccf5d342a0a21b891&libraries=services"></script>

<!-- 내 위치 가져오기 -->
<script src="../../../resources/js/kakaomap/pos.js"></script>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px; text-align: center">
<div id="contents">
<div id="bbs_wrap">	
		
<form method="post" id="filterform" action="/list" style="margin: 10px;">
<select id="si" name="si">
	<option value="서울">서울</option>
	<option value="대전">대전</option>
</select>
<select id="gu" name="gu">
	<option value="동구">동구</option>
	<option value="서구">서구</option>
	<option value="대덕구">대덕구</option>
</select>
<select id="dong" name="dong">
	<option value="가양동">가양동</option>
	<option value="비래동">비래동</option>
</select>
<select id="categoryNo" name="categoryNo">
	<option value="1">한식</option>
	<option value="2">일식</option>
</select>
<!-- <button onclick="applyFn()">적용</button> -->
<button type="submit" class="btn" id="filter">적용</button>
</form>

<script>


document.addEventListener('DOMContentLoaded', function() {
	let ff = document.querySelector('#filterform');
	let tb = document.querySelector('#shopListTable > tbody');
	let rowTemp = document.querySelector('#row');

document.querySelector('#filter').addEventListener('click', function(){
	alert("a");
	refreshList();
});
	
function refreshList() {
	
    //db에서 회원 목록 받기 위한 요청
    fetch('/api/list', {
	method: 'POST',
	//body: new URLSearchParams({x: xInp.value, y: yInp.value})
	body: new FormData(ff)
}).then(response=>response.json())
.then(function(data){ //response.json()의 결과가 인자로 전달
	console.log(data);
	//let studentList = data;
	
	
	
	tb.innerHTML = ''; //tbody 내용 초기화

             //let htmlStr = '';
             //let elmArr = [];
             let dfrag = document.createDocumentFragment();
             for (let i = 0; i < data.length; i++) {
                 const s = data[i];
                 //htmlStr += '<tr><td>' + studentList[i].stuNo + '</td><td>' + studentList[i].stuName + '</td><td>' + studentList[i].stuScore + '</td><td><button type="button">변경</button></td></tr>';    
                 //htmlStr += '<tr><td>' + s.stuNo + '</td><td>' + s.stuName + '</td><td>' + s.stuScore + '</td><td><button type="button">변경</button></td></tr>';    
                 
                 //htmlStr += `<tr><td>${s.stuNo}</td><td>${s.stuName}</td><td>${s.stuScore}</td><td><button type="button">변경</button></td></tr>`;    
                 

                 // let tr = document.createElement('tr'); //<tr></tr>
                 // let td1 = document.createElement('td'); //<td></td>
                 // td1.textContent = s.stuNo; //<td>s.stuNo</td>
                 // tr.append(td1); //<tr><td>s.stuNo</td></tr>
                 // let td2 = document.createElement('td'); //<td></td>
                 // td2.textContent = s.stuName; //<td>s.stuName</td>
                 // tr.append(td2); //<tr><td>s.stuName</td></tr>
                 // let td3 = document.createElement('td'); //<td></td>
                 // td3.textContent = s.stuScore; //<td>s.stuScore</td>
                 // tr.append(td3); //<tr><td>s.stuScore</td></tr>
                 // let td4 = document.createElement('td'); //<td></td>
                 // let btn = document.createElement('button'); //<button></button>
                 // btn.type='button'; //<button type="button"></button>
                 // btn.textContent = '변경'; //<button type="button">변경</button type="button">
                 // td4.append(btn); //<td><button type="button">변경</button type="button"></td>
                 // tr.append(td4); //<tr><td><button type="button">변경</button type="button"></td></tr>
                 // tb.append(tr);


                 let r = rowTemp.content.cloneNode(true); //템플릿 내용을 복제
                 //r.querySelectorAll('td')[0].innerHTML = s.stuNo; //성능 상으로는 tag를 인식 안 하는 textContent가 좀 더 빠름,
                 //r.querySelectorAll('td')[1].innerHTML = s.stuName;
                 //r.querySelectorAll('td')[2].innerHTML = s.stuScore;

                 //r.querySelector('td.no').innerHTML = s.stuNo; //성능 상으로는 tag를 인식 안 하는 textContent가 좀 더 빠름,
                 //r.querySelector('td.name').innerHTML = s.stuName;
                 //r.querySelector('td.score').innerHTML = s.stuScore;

                 r.querySelector('.compName').innerHTML = s.compName; //성능 상으로는 tag를 인식 안 하는 textContent가 좀 더 빠름,
                 r.querySelector('.compCall').innerHTML = s.compCall;
                 r.querySelector('.categoryNo').innerHTML = s.categoryNo;
                 r.querySelector('.booking').setAttribute('data-no', s.shopNo);
                 //elmArr.push(r);
                 dfrag.append(r); //문서 조각에 담음,
                 //tb.append(r);
             }

             //tb.append(...elmArr); //tb.append(elmArr[0], elmArr[1], elmArr[2]);
             tb.append(dfrag); //DocumentFragment의 내용을 tb의 내용에 추가

             //htmlStr += '<tr><td>' + studentList[0].stuNo + '</td><td>' + studentList[0].stuName + '</td><td>' + studentList[0].stuScore + '</td><td><button type="button">변경</button></td></tr>';
             //htmlStr += '<tr><td>' + studentList[1].stuNo + '</td><td>' + studentList[1].stuName + '</td><td>' + studentList[1].stuScore + '</td><td><button type="button">변경</button></td></tr>';
             //htmlStr += '<tr><td>' + studentList[2].stuNo + '</td><td>' + studentList[2].stuName + '</td><td>' + studentList[2].stuScore + '</td><td><button type="button">변경</button></td></tr>';
     
             //tb.innerHTML = htmlStr; //tag가 들어가서, tag가 해석이 되야 하므로, textContent 대신 innerHTML 사용
	
             
	
}).catch(function(error){
	console.log(error);
	alert('회원목록 조회 실패');
});
     	
         

     }
     
}

</script>

<div id="map" style="width:500px;height:400px;margin: 0 auto;"></div>

<table id="shopListTable">
        <thead><tr><th>매장이름</th><th>전화번호</th><th>카테고리</th><th>관리</th></tr></thead>
        <tbody>
        </tbody>
</table>

<template id="row">
        <tr><td class="compName"></td><td class="compCall"></td><td class="categoryNo"></td><td><button type="button" class="booking">예약</button></td></tr>
</template>


<div>
<table>
	<thead>
		<tr>
			<th>매장이름</th>
			<th>전화번호</th>
			<th>카테고리</th>
			<th>관리</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${list}">
		<tr>
			<td>${item.compName}</td>
			<td>${item.compCall}</td>
			<td>${item.categoryNo}</td>
			<td>
				<button><a href="/booking/shop/${item.shopNo}">예약</a></button>
				<%-- <button id="booking_${item.shopNo}"><a href="#reservation">예약</a></button> --%>
			</td>
		</tr>
		</c:forEach>	
		
		<c:if test="${list.size() < 1}">
		<tr>
			<td colspan="6">검색 된 예약이 없습니다</td>
		</tr>
		</c:if>
		
	</tbody>
</table>
</div>


<!-- 카카오 지도 생성 -->
<script src="../../../resources/js/kakaomap/map.js"></script>

<!-- 카테고리에 따른 지도 중심 이동 -->
<script>
/* 주소-좌표 변환 */
	
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
//console.log(cityval)
geocoder.addressSearch(sival + " " + guval + " " + dongval, function(result, status) {

// 정상적으로 검색이 완료됐으면 
if (status === kakao.maps.services.Status.OK) {
	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
}

//지도의 중심을 결과값으로 받은 위치로 이동시킵니다
map.setCenter(coords);
</script>
	    
<!-- 카테고리에 따른 마커 생성 -->
<c:forEach var="item" items="${list}">
<p>위도 : ${item.latitude}, 경도 : ${item.longitude}</p>

<script>
//var lat = [];
//var lng = [];

alert(`${item.latitude}, ${item.longitude}`);




var positions = [
	{
        title: `${item.compName}`, 
        latlng: new kakao.maps.LatLng(${item.latitude}, ${item.longitude})
    }
]

//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {
	
	// 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
 	// 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
    	document.getElementById('myModal').style.display = 'block';
    	fetch(`item/${item.shopNo}`, {
            method: "GET",
        });
    	document.getElementById('cn').innerHTML = `${item.compName}`;
    	document.getElementById('ca').innerHTML = `${item.compAddr1}`;
    	document.getElementById('cc').innerHTML = `${item.compCall}`;
    	document.getElementById('sn').value = `${item.shopNo}`;

    	alert("매장번호" + ${item.shopNo});
    });   
}

//검색 결과가 있을 때, 첫 번째 마커를 기준으로 지도 중심을 설정합니다
if (positions.length > 0) {
    map.setCenter(positions[0].latlng);
}
</script>

</c:forEach>


<!-- <script language="JavaScript"> window.name = "Test_Dialog"; </script>
<a href="http://www.egocube.pe.kr/" target="Test_Dialog">Click!</a> -->


<div id="myModal" class="modal">
	<div class="modal-content">
		<span class="close">&times;</span>
		<div id="cn">
		</div>
		<div id="ca">
		</div>
		<div id="cc">
		</div>
		
		<form action="/booking/add" method="post">
		<input type="number" id="sn" name="shopNo" hidden="hidden">
		<input type="number" name="userNo" hidden="hidden" value="${sessionScope.user.userNo}">
		
		<div class="accordion border-0 accordion-s" id="accordion-group-6">
		
                    <div class="accordion-item">
                    
                        <button class="accordion-button collapsed px-0" type="button" data-bs-toggle="collapse" data-bs-target="#accordion6-1">
                            <!-- <span class="font-600 font-13">예약 날짜 선택</span> -->
                            <input class="font-600 font-13 datepicker" name="bookingDate" value="예약 날짜 선택">
                            <i class="bi bi-chevron-down font-20"></i>
                        </button>
                        
                        <div id="accordion6-1" class="accordion-collapse collapse" data-bs-parent="#accordion-group-6">
                            <p class="pb-3 opacity-60">
                                <!-- <input class="datepicker"> -->
                                <script>
                                $(function(){
                                    $('.datepicker').datepicker();
                                })
                                </script>
                            </p>
                        </div>
                        
                    </div>

                    <div class="accordion-item">
                        
                        <button class="accordion-button collapsed px-0" type="button" data-bs-toggle="collapse" data-bs-target="#accordion6-2">
                            <input type="text" id="bookingTime" class="font-600 font-13" name="bookingTime" value="예약 시간 선택">
                            <i class="bi bi-chevron-down font-20"></i>
                        </button>
                        
                        <div id="accordion6-2" class="accordion-collapse collapse" data-bs-parent="#accordion-group-6">
                        	
                        	<script>
                        	function bookingTime( item ) {
                        		document.querySelector('#bookingTime').value = $(item).text();
                        	}
                        	</script>
                        
                            <div class="mb-2 pb-2"></div>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">11:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">12:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">13:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">14:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">17:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">18:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">19:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">20:00</a>
                                <a href="#" class="btn btn-xxs gradient-orange" style="width:100px; margin: 0 auto;" onclick="bookingTime(this)">21:00</a>
                            <div class="mb-2"></div> 
                            
                        </div>
                    </div>

                    <div class="accordion-item">
                    
                        <button class="accordion-button collapsed px-0" type="button" data-bs-toggle="collapse" data-bs-target="#accordion6-3">
                            <input type="number" id="tit_bookingMemNum" name="bookingMemNum" class="font-600 font-13" value="예약 인원 선택">
                            <i class="bi bi-chevron-down font-20"></i>
                        </button>
                        
                        <div id="accordion6-3" class="accordion-collapse collapse" data-bs-parent="#accordion-group-6">
                            <p class="pb-3 opacity-60">
                            1~10명까지 선택 가능합니다.<br>
                            방문하시는 인원을 선택하세요.
                            </p>

                            <div class="row">
                                <div class="col-6"  style="margin: 0 auto;">
                                    <div class="stepper rounded-s">
                                    	<script>
                                    	function count(type) {
                                    		let bmn = document.querySelector('#bookingMemNum').value;
                                    		
                                    		if(type === 'plus') {
                                    			bmn = parseInt(bmn) + 1;
                                    			if (bmn > 10) {
                                    				return false;
                                    			}
                                    		}
                                    		else if(type === 'minus')  {
                                    			bmn = parseInt(bmn) - 1;
                                    			if (bmn < 1) {
                                    				return false;
                                    			}
                                    		}
                                    		document.querySelector('#bookingMemNum').value = bmn;
                                    		document.querySelector('#tit_bookingMemNum').value = bmn;
										}
                                    	
                                    	function plus() {
                                    		//document.querySelector('#nop').value += 1;
                                    		//var nop = document.querySelector('#nop').value                                    		
                                    		//console.log(typeof(Number(nop)));
                                    		//console.log(Number(nop));
                                    		//Number(nop) = Number(nop) + 1;
										}
                                    	</script>
                                    	
                                        <a href="#"><i class="bi bi-dash font-18 color-red-dark" onclick="count('minus')"></i></a>
                                        <input type="number" id="bookingMemNum" class="color-theme" min="1" max="10" value="1">
                                        <a href="#"><i class="bi bi-plus font-18 color-green-dark" onclick="count('plus')"></i></a>
                                        
                                    </div>
                                </div>
                            </div>
                            
                        </div>

                    </div>
                </div>
		
		<div>
			<button type="submit" id="booking">예약하기</button>
		</div>
		</form>
		
	</div>
</div>

<div>
${info.shopNo}
</div>



<!-- 적용x -->
<script>
//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
}
</script>

<script>
function applyFn(){
	
	var si  = document.getElementById("si");
	var sival = (si.options[si.selectedIndex].value);
	
	var gu  = document.getElementById("gu");
	var guval = (gu.options[gu.selectedIndex].value);
	
	var dong  = document.getElementById("dong");
	var dongval = (dong.options[dong.selectedIndex].value);
	
	var category  = document.getElementById("category");
	var categoryval = (category.options[category.selectedIndex].value);
	
	alert("value = " + sival + guval + dongval + categoryval);
	
	/* 		
	var selectedindex = city.selectedIndex;
	alert("value = "+value+" , selectedindex = "+selectedindex); 
	*/
	
	

	/* 주소-좌표 변환 */
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	//console.log(cityval)
	geocoder.addressSearch(sival + " " + guval + " " + dongval, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">적용위치</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
		        
		        
		        
	        /* ~ 카테고리 검색 ~ */
	    	
	    	// 장소 검색 객체를 생성합니다
	    	var ps = new kakao.maps.services.Places(); 
	    	
	    	// input에서 키워드 받음 
	    	//var keyword = document.querySelector('#search').value;	
	    		
	    	// 키워드로 장소를 검색합니다
	    	ps.keywordSearch(categoryval, placesSearchCB, {
	    		radius : 2000,
	    		location: coords
	    	});
	
	
	    	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	    	function placesSearchCB (data, status, pagination) {
	    	    if (status === kakao.maps.services.Status.OK) {
	
	    	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	    	        // LatLngBounds 객체에 좌표를 추가합니다
	    	        var bounds = new kakao.maps.LatLngBounds();
	
	    	        for (var i=0; i<data.length; i++) {
	    	            displayMarker(data[i]);    
	    	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	    	        }       
	    			
	    	        //if ( bounds =! null )
	    	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    	        map.setBounds(bounds);
	    	    } 
	    	}
	    	
	    	// 지도에 마커를 표시하는 함수입니다
	    	function displayMarker(place) {
	    		
	    	    // 마커를 생성하고 지도에 표시합니다
	    	    var marker = new kakao.maps.Marker({
	    	        map: map,
	    	        position: new kakao.maps.LatLng(place.y, place.x) 
	    	    });
	
	    	    // 마커에 클릭이벤트를 등록합니다
	    	    kakao.maps.event.addListener(marker, 'click', function() {
	    	    	document.getElementById('myModal').style.display = 'block';
	    	    });
	    	    	
	   	    	//modal.classList.remove('hidden');
	   	    	
	   	        
	   	    	// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	   	        /* infowindow.setContent(
	   	       		'<div style="padding:5px;font-size:12px;">' + place.place_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.road_address_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.phone + '</div>'
	   	        );
	   	        infowindow.open(map, marker); */
	    	        
			};
		}	
	});
};
</script>
<!-- 적용x -->



<script>
//모달 닫기 버튼 이벤트 처리
document.querySelector('.close').addEventListener('click', function() {
    document.getElementById('myModal').style.display = 'none';
});

// 모달 바깥 영역 클릭 시 모달 닫기
window.addEventListener('click', function(event) {
    var modal = document.getElementById('myModal');
    if (event.target === modal) {
        modal.style.display = 'none';
    }
});
</script>

<button type="button" id="getMyPositionBtn" onclick="getCurrentPosBtn()">내 위치 가져오기</button>



</div>
</div>
</div>
</div>

</body>
</html>