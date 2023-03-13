<!DOCTYPE html>
<html>
<head>
    <title> Design Login </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet"integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" />
  <style>
    *, *:before, *:after{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Nunito', sans-serif;
}

body{
  width: 100%;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: -webkit-linear-gradient(left, #7579ff, #b224ef);
  font-family: 'Nunito', sans-serif;
 background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
    background-size: 400% 400%;
    animation: gradient 15s ease infinite;
}

@keyframes gradient {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

input, button{
  border:none;
  outline: none;
  background: none;
}

.cont{
  overflow: hidden;
  position: relative;
  width: 900px;
  height: 550px;
  background: #fff;
  box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);
}

.form{
  position: relative;
  width: 640px;
  height: 100%;
  padding: 50px 30px;
  border-radius: 15px;
  -webkit-transition:-webkit-transform 1.2s ease-in-out;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}

h2{
  width: 100%;
  font-size: 30px;
  text-align: center;
  margin-top: 17px;
}

label{
  display: block;
  width: 260px;
  margin: 25px auto 0;
  text-align: center;
}

label span{
  font-size: 14px;
  font-weight: 600;
  color: #505f75;
  text-transform: uppercase;
}

input{
  display: block;
  width: 100%;
  margin-top: 5px;
  font-size: 16px;
  
  padding-bottom: 9px;
  padding-top: 9px;
  border-radius: 17px;
  text-align: center;
  font-family: 'Nunito', sans-serif; 
  background: f4f1fa;
}
#text1{
  background-image: url(email.png);
  position: left;
  padding-left: 20px;
  background-size: 35px;
  background-repeat: no-repeat;
  border-radius: 8px;
}
#text2{
  background-image: url(password.png);
  position: left;
  padding-left: 20px;
  background-size: 35px;
  background-repeat: no-repeat;
  border-radius: 8px;
}
#text3{
  background-image: url(Name.png);
  position: left;
  padding-left: 20px;
  background-size: 30px;
  background-repeat: no-repeat;
  border-radius: 20px;

}
#text4{
  background-image: url(email.png);
  position: left;
  padding-left: 20px;
  background-size: 35px;
  background-repeat: no-repeat;
  border-radius: 8px;
}
#text5{
  background-image: url(password.png);
  position: left;
  padding-left: 20px;
  background-size: 35px;
  background-repeat: no-repeat;
  border-radius: 8px;
}


button{
  display: block;
  margin: 0 auto;
  width: 260px;
  height: 36px;
  border-radius: 30px;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
}

.submit{
  margin-top: 40px;
  margin-bottom: 30px;
  text-transform: uppercase;
  font-weight: 600;
  font-family: 'Nunito', sans-serif;
  background: -webkit-linear-gradient(left, #7579ff, #b224ef);
}

.submit:hover{
  background: -webkit-linear-gradient(left, #b224ef, #7579ff);
}

.forgot-pass{
  margin-top: 100px;
  margin-left: 230px;
  text-align: center;
  font-size: 14px;
  font-weight: 600;
  color: #0c0101;
  cursor: pointer;
}

.forgot-pass:hover{
  color: red;
}

.social-media{
  width: 100%;
  text-align: center;
  margin-top: 30px;
  margin-bottom: 20px;
}

.social-media ul{
  list-style: none;
}

.social-media ul li{
  display: inline-block;
  cursor: pointer;
  margin: -2px 6px;

}

.social-media img{
  width: 30px;
  height: 30px;
  border: 1px solid #fff;
  border-radius: 12px;

}

.sub-cont{
  overflow: hidden;
  position: absolute;
  left: 640px;
  top: 0;
  width: 900px;
  height: 100%;
  padding-left: 260px;
  background: #fff;
  -webkit-transition: -webkit-transform 1.2s ease-in-out;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out;
}

.cont.s-signup .sub-cont{
  -webkit-transform:translate3d(-640px, 0, 0);
          transform:translate3d(-640px, 0, 0);
}

.img{
  overflow: hidden;
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 260px;
  height: 100%;
  padding-top: 360px;
}

.img:before{
  content: '';
  position: absolute;
  right: 0;
  top: 0;
  width: 900px;
  height: 100%;
  background-image: url(bg.jpg);
  background-size: cover;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}

.img:after{
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.3);
}

.cont.s-signup .img:before{
  -webkit-transform:translate3d(640px, 0, 0);
          transform:translate3d(640px, 0, 0);
}

.img-text{
  z-index: 2;
  position: absolute;
  left: 0;
  top: 50px;
  width: 100%;
  padding: 0 20px;
  text-align: center;
  color: #fff;
  -webkit-transition:-webkit-transform 1.2s ease-in-out;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}

.img-text h2{
  margin-bottom: 10px;
  font-weight: normal;
}

.img-text p{
  font-size: 14px;
  line-height: 1.5;
}

.cont.s-signup .img-text.m-up{
  -webkit-transform:translateX(520px);
          transform:translateX(520px);
}

.img-text.m-in{
  -webkit-transform:translateX(-520px);
          transform:translateX(-520px);
}

.cont.s-signup .img-text.m-in{
  -webkit-transform:translateX(0);
          transform:translateX(0);
}


.sign-in{
  padding-top: 63px;
  -webkit-transition-timing-function:ease-out;
          transition-timing-function:ease-out;
}

.cont.s-signup .sign-in{
  -webkit-transition-timing-function:ease-in-out;
          transition-timing-function:ease-in-out;
  -webkit-transition-duration:1.2s;
          transition-duration:1.2s; 
  -webkit-transform:translate3d(640px, 0, 0);
          transform:translate3d(640px, 0, 0);
}

.img-btn{
  overflow: hidden;
  z-index: 2;
  position: relative;
  width: 100px;
  height: 36px;
  margin: 0 auto;
  background: transparent;
  color: #fff;
  text-transform: uppercase;
  font-size: 15px;
  cursor: pointer;
}

.img-btn:after{
  content: '';
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: 2px solid #fff;
  border-radius: 30px;
}

.img-btn span{
  position: absolute;
  left: 0;
  top: 0;
  display: -webkit-box;
  display: flex;
  -webkit-box-pack:center;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  -webkit-transition:-webkit-transform 1.2s;
  transition: -webkit-transform 1.2s;
  transition: transform 1.2s;
  transition: transform 1.2s, -webkit-transform 1.2s;;
}

.img-btn span.m-in{
  -webkit-transform:translateY(-72px);
          transform:translateY(-72px);
}

.cont.s-signup .img-btn span.m-in{
  -webkit-transform:translateY(0);
          transform:translateY(0);
}

.cont.s-signup .img-btn span.m-up{
  -webkit-transform:translateY(72px);
          transform:translateY(72px);
}

.sign-up{
  -webkit-transform:translate3d(-900px, 0, 0);
          transform:translate3d(-900px, 0, 0);
}

.cont.s-signup .sign-up{
  -webkit-transform:translate3d(0, 0, 0);
          transform:translate3d(0, 0, 0);
}
  </style>
 
</head>
<body>
  <div class="cont">
    <div class="form sign-in">
	<img src="logo.png" style="margin-right:-100px; margin-top:-57px; width:200px">
      <h2 style="font-size:40px; color: #7579ff; margin-top:20px">Login to DESK</h2>
     <h6 style="color:grey; margin-top:50px"><center>provide your Email and Password to continue with DESK</center></h6>
     <form action="login" method="POST"> 
     <label>
       <input type="email" id=text1 name="lemail" placeholder="Email" required style="background-color:#f4f1fa; margin-top: 	22px;" >
      </label>
      <label>
    <input type="password" id=text2 name="lpassword" placeholder = "Password" required style="background-color: #f4f1fa; margin-top: -12px" >
      </label>

      <button  class="submit" type="submit" value="required">Login</button>
	<a class="forgot-pass" href="silder.html"><u>Forgot Password ?</u></a>
     </form>
   </div>
    <div class="sub-cont">
      <div class="img">
        <div class="img-text m-up">
          <h2>New here?</h2>
          <p>Sign up and We at Desk Solve Every Students Problems!</p>
        </div>
        <div class="img-text m-in">
	 <h2>Welcome</h2>
          <p>If you already has an account, just Login. We've missed you!</p>
        </div>
        <div class="img-btn">
          <span class="m-up">Sign Up</span>
          <span class="m-in">Login</span>
        </div>
      </div>
      <div class="form sign-up">
          <form action="checkConnection" method="post">
	<img src="logo.png" style="margin-right:1px; margin-top:-57px; width : 200px">
	
	<h2 style="font-size:40px; color: #7579ff; margin-top:30px; margin-left : -10px"> Create Account </h2>
	<!--<h6 style="grey><center> or use your email for registration</center></h6> -->
	<div class="social-media">
        <ul>
          <li><img src="facebook.png"></li>
          <li><img src="twitter.png"></li>
         <li><img src="google.png"></li>
          <li><img src="instagram.png"></li>
        </ul>
	</div>

        <label>
		<h6 style="color:grey"><center> or use your email for registration</center></h6>
        	<input class="myInput" name="cname" type="text"  id="text3" placeholder = " Name " required style="background-color:#f4f1fa; margin-top:20px"> 
        </label>
        <label>
          <input class="myInput"  type="text" name="cemail"  id="text4" placeholder = " Email " required style="background-color:#f4f1fa; margin-top:-20px">
        </label>
        <label>
          <input class="myInput" type="password" name="cpassword" id="text5"  placeholder = " Password " required style="background-color:#f4f1fa; margin-top:-20px">
        </label>
        <label>
         <!-- <input type="password" placeholder = " Confirm Password " required style="background-color:#f4f1fa; margin-top:-20px"> -->
        </label>
        <button type="submit" class="submit" value="required" style="margin-top:30px">Sign Up</button>
          </form>
      </div>
    </div>
  </div>
<script>
  document.querySelector('.img-btn').addEventListener('click', function()
    {
        document.querySelector('.cont').classList.toggle('s-signup')
    }
);


</script>
</body>
</html>
