<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bankers</title>
	<link rel="stylesheet" href="../css/index.css">
</head>

<div class="vl"></div>
    <div class="vi"></div>
    <section id="index">
        <div class="container">
            <div class="index-self">
                <div class="left">
                    <h2>BANKERS</h2>
                    <p>국내 소규모 스타트업을 위한 기업대상 클라우드 서비스 BANKERS입니다.</p>
                    <p>BANKERS는 서버 고가용성과 오토스케일링, 알람 메일을 지원합니다.</p>
                    <p>고성능 VM과 넉넉한 RAM, 충분한 저장용량까지 저렴한 가격에 이용해보세요.</p>
                </div>
                <div class="right">
                    <form action="/login" method="post">
                        <h2>Login</h2>
                        <input type="text" id="id" placeholder="ID" name="loginID">
                        <input type="password" id="password" placeholder="PW" name="loginPW">
                        <input type="submit" value="Login">
                    </form>
                </div>
            </div>
        </div>
    </section>

    <section id="contact">
        <div class="container">
            <div class="contact-me">
                <div class="right">
                    <form action="" method="">
                        <h2>CONTACT US</h2>
                        <div class="contactform">
                            <label for="name">name</label>
                            <input type="text" id="name" autocomplete="off">
                        </div>
                        <div class="contactform">
                            <label for="email">email</label>
                            <input type="text" id="email" autocomplete="off">
                        </div>
                        <div class="contactform">
                            <label for="msg">massage</label>
                            <textarea id="msg" autocomplete="off"></textarea>
                        </div>
                        <button>Send</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>

</html>