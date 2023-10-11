<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Ű����� ��Ұ˻��ϱ�</title>

<style>
#modalOpenButton, #modalCloseButton {
  cursor: pointer;
}

#modalContainer {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContent {
  position: absolute;
  background-color: #ffffff;
  width: 300px;
  height: 150px;
  padding: 15px;
}

#modalContainer.hidden {
  display: none;
}
</style>

<style>
#modalContent {
  position: absolute;
  background-color: #ffffff;
  width: 300px;
  height: 150px;
  padding: 15px;
}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3deea4e437afacaccf5d342a0a21b891&libraries=services"></script>

<!-- �� ��ġ �������� -->
<script>
function locationLoadSuccess(pos){
// ���� ��ġ �޾ƿ���
var currentPos = new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude);

// ���� �̵�(���� ��ġ�� �����ٸ� �ε巴�� �̵�)
map.panTo(currentPos);

// ��Ŀ ����
var marker = new kakao.maps.Marker({
    position: currentPos
});

// ������ ��Ŀ�� �ִٸ� ����
marker.setMap(null);
marker.setMap(map);
};

function locationLoadError(pos){
alert('��ġ ������ �������µ� �����߽��ϴ�.');
};

//��ġ �������� ��ư Ŭ����
function getCurrentPosBtn(){
navigator.geolocation.getCurrentPosition(locationLoadSuccess,locationLoadError);
};
</script>
<!-- <script src="../resources/js/map.js"></script> -->   



</head>
<body>

<div id="modalContainer" class="hidden">
  <div id="modalContent">
    <p>��� â �Դϴ�.</p>
    <button id="modalCloseButton">�ݱ�</button>
  </div>
</div>


<select id="city">
	<option value="����">����</option>
	<option value="����">����</option>
</select>
<select id="gu">
	<option value="����">����</option>
	<option value="����">����</option>
</select>
<select id="dong">
	<option value="����1��">����1��</option>
	<option value="����2��">����2��</option>
</select>
<select id="dish">
	<option value="�ѽ�">�ѽ�</option>
	<option value="�Ͻ�">�Ͻ�</option>
</select>
<button onclick="applyFn()">����</button>

<!-- 
<script>
function applyFn(){
	var city  = document.getElementById("city");
	var cityval = (city.options[city.selectedIndex].value);
	
	var gu  = document.getElementById("gu");
	var guval = (gu.options[gu.selectedIndex].value);
	
	var dong  = document.getElementById("dong");
	var dongval = (dong.options[dong.selectedIndex].value);
	
	var dish  = document.getElementById("dish");
	var dishval = (dish.options[dish.selectedIndex].value);
	
	alert("value = " + cityval + guval + dongval + dishval);
	
	/* 		
	var selectedindex = city.selectedIndex;
	alert("value = "+value+" , selectedindex = "+selectedindex); 
	*/
};
</script>
 -->

<div id="map" style="width:500px;height:400px;"></div>



<!-- īī�� ���� ���� -->
<script>
// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ǥ���� ���������� �Դϴ�
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
        //center: new kakao.maps.LatLng(pos.coords.latitude,pos.coords.longitude), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>





<script>
function searchBtn() {
	
	// ��� �˻� ��ü�� �����մϴ�
	var ps = new kakao.maps.services.Places(); 
	
	// input���� Ű���� ���� 
	var keyword = document.querySelector('#search').value;	
		
	// Ű����� ��Ҹ� �˻��մϴ�
	ps.keywordSearch(keyword, placesSearchCB, {
		radius : 2000,
		location: new kakao.maps.LatLng(37.566826, 126.9786567)
	});
};

// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
		
        //if ( bounds =! null )
        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
        map.setBounds(bounds);
    } 
}

// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
function displayMarker(place) {
	
    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
    kakao.maps.event.addListener(marker, 'click', function() {
    	
    	//modal.classList.remove('hidden');
    	
        
    	// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
        infowindow.setContent(
       		'<div style="padding:5px;font-size:12px;">' + place.place_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.road_address_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.phone + '</div>'
        );
        infowindow.open(map, marker);
        
        
    });
}

//�迭�� �߰��� ��Ŀ���� ������ ǥ���ϰų� �����ϴ� �Լ��Դϴ�
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
}

</script>


<script>

function applyFn(){
	
	var city  = document.getElementById("city");
	var cityval = (city.options[city.selectedIndex].value);
	
	var gu  = document.getElementById("gu");
	var guval = (gu.options[gu.selectedIndex].value);
	
	var dong  = document.getElementById("dong");
	var dongval = (dong.options[dong.selectedIndex].value);
	
	var dish  = document.getElementById("dish");
	var dishval = (dish.options[dish.selectedIndex].value);
	
	alert("value = " + cityval + guval + dongval + dishval);
	
	/* 		
	var selectedindex = city.selectedIndex;
	alert("value = "+value+" , selectedindex = "+selectedindex); 
	*/

	/* �ּ�-��ǥ ��ȯ */
	
	//�ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
	var geocoder = new kakao.maps.services.Geocoder();
	
	// �ּҷ� ��ǥ�� �˻��մϴ�
	console.log(cityval)
	geocoder.addressSearch(cityval + " " + guval + " " + dongval, function(result, status) {
	
	    // ���������� �˻��� �Ϸ������ 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">������ġ</div>'
	        });
	        infowindow.open(map, marker);
	
	        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
	        map.setCenter(coords);
	        
	        
	        
	        /* ~ ī�װ� �˻� ~ */
	    	
	    	// ��� �˻� ��ü�� �����մϴ�
	    	var ps = new kakao.maps.services.Places(); 
	    	
	    	// input���� Ű���� ���� 
	    	//var keyword = document.querySelector('#search').value;	
	    		
	    	// Ű����� ��Ҹ� �˻��մϴ�
	    	ps.keywordSearch(dishval, placesSearchCB, {
	    		radius : 2000,
	    		location: coords
	    	});


	    	// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
	    	function placesSearchCB (data, status, pagination) {
	    	    if (status === kakao.maps.services.Status.OK) {

	    	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
	    	        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
	    	        var bounds = new kakao.maps.LatLngBounds();

	    	        for (var i=0; i<data.length; i++) {
	    	            displayMarker(data[i]);    
	    	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	    	        }       
	    			
	    	        //if ( bounds =! null )
	    	        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
	    	        map.setBounds(bounds);
	    	    } 
	    	}
	    	
	    	// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
	    	function displayMarker(place) {
	    		
	    	    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
	    	    var marker = new kakao.maps.Marker({
	    	        map: map,
	    	        position: new kakao.maps.LatLng(place.y, place.x) 
	    	    });

	    	    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
	    	    kakao.maps.event.addListener(marker, 'click', function() {
	    	    	
	    	    	//modal.classList.remove('hidden');
	    	    	
	    	        
	    	    	// ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
	    	        /* infowindow.setContent(
	    	       		'<div style="padding:5px;font-size:12px;">' + place.place_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.road_address_name + '</div><br><div style="padding:5px;font-size:12px;">' + place.phone + '</div>'
	    	        );
	    	        infowindow.open(map, marker); */
	    	        
	    	        
	    	    });
	    	}
	    } 
	});
};
</script>


<input id="search" value="" />
<input type="button" onclick="searchBtn()" value="�˻�"> 


<button type="button" id="getMyPositionBtn" onclick="getCurrentPosBtn()">�� ��ġ ��������</button>

<button id="modalOpenButton">���â ����</button>



<!-- ��� -->
<script>
//const modalOpenButton = document.getElementById('modalOpenButton');
const modalCloseButton = document.getElementById('modalCloseButton');
const modal = document.getElementById('modalContainer');

/*
modalOpenButton.addEventListener('click', () => {
  modal.classList.remove('hidden');
});
*/

modalCloseButton.addEventListener('click', () => {
  modal.classList.add('hidden');
});
</script>



</body>
</html>