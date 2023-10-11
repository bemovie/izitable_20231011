<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
    <title>관리자 회원 관리</title>
</head>
<body>
     <div class="total">
         총 매장 수 <strong><c:out value=""/></strong> 곳
     </div>
     <div id="content">
      <div class="container">
         <div id="contents">
           <div id="bbs_wrap">
                <!-- table 태그３  -->
                <div class="bbs_list">
                  <div>
                    <h4>매장관리</h4>
                    <p>
                      관리자 전용 관리자가 회원 관리가 가능한 페이지 <br>
                      확인 하면 이 부분은 삭제를 해주세요!
                    </p>
                    <div>
                    <table class="list_table">
                    <thead>
                        <tr>
                          <th scope="col">회원번호</th>
                          <th scope="col">회원이름</th>
                          <th scope="col">연락처</th>
                          <th scope="col">캐시</th>
                          <th scope="col">가입날짜</th>
                          <th scope="col">관리</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>미지정</td>
                          <td>미지정</td>
                          <td>미지정</td>
                          <td>미지정</td>
                          <td>미지정</td>
                          <td>
                            <button type="submit"  class="btn btn-danger btn-sm">수정</button>
                            <button type="submit"  class="btn btn-warning btn-sm">삭제</button>
                        </td>
                        </tr>
                        <tr>
                          <td>미지정</td>
                          <td>미지정</td>
                          <td>미지정</td>
                          <td>미지정</td>
                          <td>미지정</td>
                          <td>
                            <button type="submit"  class="btn btn-danger btn-sm">수정</button>
                            <button type="submit"  class="btn btn-warning btn-sm">삭제</button>
                          </td>
                        </tr>
                        <tr>
                          <td>미지정</td>
                          <td >미지정</td>
                          <td >미지정</td>
                          <td >미지정</td>
                          <td >미지정</td>
                          <td >
                            <button type="submit"  class="btn btn-danger btn-sm">수정</button>
                            <button type="submit"  class="btn btn-warning btn-sm">삭제</button>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
           </div>
         </div>
        </div>
      </div>

</body>
</html>