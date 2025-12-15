<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login / Signup</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
  /* Carousel background */
  :root {
    --accent: #0fb3a6; /* teal accent */
  }
  html,body { height:100%; margin:0; font-family: 'Inter', sans-serif; }
  .bg-carousel { position:fixed; inset:0; z-index:-2; overflow:hidden; }
  .slide {
    position:absolute; inset:0; background-size:cover; background-position:center;
    filter: blur(6px) brightness(0.6);
    transform: scale(1.05);
    animation: slideFade 18s infinite;
    opacity:0;
  }
  .slide.s1 { background-image:url('https://images.unsplash.com/photo-1517816743773-6e0fd518b4a6?auto=format&fit=crop&w=1600&q=80'); animation-delay:0s;}
  .slide.s2 { background-image:url('https://images.unsplash.com/photo-1503676260728-1c00da094a0b?auto=format&fit=crop&w=1600&q=80'); animation-delay:6s;}
  .slide.s3 { background-image:url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1600&q=80'); animation-delay:12s;}
  @keyframes slideFade {
    0%{opacity:0} 6%{opacity:1} 30%{opacity:1} 36%{opacity:0} 100%{opacity:0}
  }

  /* overlay */
  .bg-overlay { position:fixed; inset:0; background:linear-gradient(135deg, rgba(15,179,166,0.18), rgba(3,82,89,0.12)); z-index:-1; }

  /* Center card */
  .wrap {
    min-height:100vh; display:flex; align-items:center; justify-content:center; padding:30px;
  }
  .glass {
    width:420px; max-width:92%;
    background: rgba(255,255,255,0.08);
    border-radius:16px;
    padding:26px;
    backdrop-filter: blur(8px) saturate(120%);
    box-shadow: 0 10px 30px rgba(3,24,24,0.35);
    color: #fff;
    transition: transform .25s ease;
  }
  .glass:hover { transform: translateY(-6px); }

  .brand { font-weight:700; letter-spacing:0.4px; color:#e8fffb; }
  h3 { color: #e8fffb; margin-bottom:18px; font-weight:600; }

  .form-control { border-radius:10px; background: rgba(255,255,255,0.1); border: none; color: #fff; }
  .form-control::placeholder { color: rgba(255,255,255,0.7); }
  label { color: #e8fffb; font-weight:500; }

  .btn-teal {
    background: linear-gradient(90deg, var(--accent), #057a72);
    border:none; border-radius:999px; padding:10px 18px; font-weight:600;
    color:#fff;
  }
  .btn-muted { background:transparent; border:1px solid rgba(255,255,255,0.18); color:#fff; border-radius:999px; }

  .small-link { color:#dffbf8; cursor:pointer; text-decoration:underline; }

  .toggle { margin-top:14px; text-align:center; color:#e8fffb; }

  /* mobile tweaks */
  @media (max-width:480px) {
    .glass { padding:18px; }
    h3 { font-size:18px; }
  }
</style>
</head>
<body>

<!-- background carousel -->
<div class="bg-carousel" aria-hidden="true">
  <div class="slide s1"></div>
  <div class="slide s2"></div>
  <div class="slide s3"></div>
</div>
<div class="bg-overlay" aria-hidden="true"></div>

<div class="wrap">
  <div class="glass">
    <div class="d-flex justify-content-between align-items-center mb-2">
      <div class="brand"><i class="fa-solid fa-graduation-cap"></i> Vcube Portal</div>
      <div class="text-right"><small style="color:#dafff7">Student Management</small></div>
    </div>

    <h3 id="form-title">Welcome — Login</h3>

    <!-- LOGIN FORM -->
    <form id="loginForm" method="post" action="LoginController">
      <div class="form-group">
        <label><i class="fa fa-user"></i> Username</label>
        <input type="text" name="username" class="form-control" placeholder="Enter username" required id="name">
         <p id="h1"></p>
      </div>

      <div class="form-group">
        <label><i class="fa fa-lock"></i> Password</label>
        <input type="password" name="password" class="form-control" placeholder="Enter password" required id="pwd">
			<p id="pwdMsg"></p>

      </div>

      <button type="submit" class="btn-teal btn-block">Login</button>

      <div class="d-flex justify-content-between align-items-center mt-3">
        <a href="forgotPassword.jsp" class="small-link"><i class="fa fa-key"></i> Forgot?</a>
        <a class="small-link" onclick="toggleForm('signup')"><i class="fa fa-user-plus"></i> Create account</a>
      </div>
    </form>

    <!-- SIGNUP FORM -->
    <form id="signupForm" method="post" action="StudentController" style="display:none; margin-top:6px;">
      <div class="form-group">
        <label><i class="fa fa-id-badge"></i> Full Name</label>
        <input type="text" name="fullname" class="form-control" placeholder="Full name" required id="fname" >
        <p id="h2"></p>
      </div>

      <div class="form-group">
        <label><i class="fa fa-user-circle"></i> Username</label>
        <input type="text" name="username" class="form-control" placeholder="Choose username" required id="uname" >
        <p id="h3"></p>
      </div>

      <div class="form-group">
        <label><i class="fa fa-lock"></i> Password</label>
        <input type="password" name="password" id="password"  class="form-control" placeholder="Password" required>
        <label id="pwdError"> </label>
      </div>

      <div class="form-group">
        <label><i class="fa fa-lock"></i> Confirm Password</label>
        <input type="password" name="repassword" id="repassword" class="form-control" placeholder="Re-enter password" required>
        <label id="repwdError"> </label>
      </div>

      <button type="submit" class="btn-teal btn-block">Sign Up</button>

      <div class="toggle">
        <span class="small-link" onclick="toggleForm('login')"><i class="fa fa-arrow-left"></i> Back to Login</span>
      </div>
    </form>

  </div>
</div>
<script>
//Password events
document.getElementById("pwd").addEventListener("focus", showPwdInfo);
document.getElementById("pwd").addEventListener("blur", validatePwd);

function showPwdInfo() {
    document.getElementById("pwdMsg").innerHTML = "Enter your password";
    document.getElementById("pwdMsg").style.color = "white";
}

function validatePwd() {
    var p = document.getElementById("pwd").value;

    if (p === "") {
        document.getElementById("pwdMsg").innerHTML = "Password is required *";
        document.getElementById("pwdMsg").style.color = "red";
    } else if (p.length < 6) {
        document.getElementById("pwdMsg").innerHTML = "Password must be at least 6 characters";
        document.getElementById("pwdMsg").style.color = "orange";
    } else {
        document.getElementById("pwdMsg").innerHTML = "";
    }
}



		document.getElementById("name").addEventListener("keypress",
				checkchars);
		document.getElementById("name").addEventListener("focus",
				DisplayInfo);
		document.getElementById("name").addEventListener("blur",
				ItemName);

		function checkchars(event) {
			var ch = event.which || event.keyCode;
			if (!((ch >= 65 && ch <= 90) || (ch >= 97 && ch <= 122)
					|| (ch == 32) || (ch == 8))) {
				event.preventDefault();
			}
		}
		function DisplayInfo() {
			document.getElementById("h1").innerHTML = "UserName";
			document.getElementById("h1").style.color = "white";
		}
		function ItemName() {
			var n = document.getElementById("name").value;
			if (n == "") {
				document.getElementById("h1").innerHTML = "UserName required *";
				document.getElementById("h1").style.color = "red";
			} else {
				document.getElementById("h1").innerHTML = "";
			}
		}
		
		document.getElementById("fname").addEventListener("blur", funame);
		document.getElementById("uname").addEventListener("blur", uname);
		
		function funame(){
				var n = document.getElementById("fname").value;
				if (n == "") {
					document.getElementById("h2").innerHTML = "FullName required *";
					document.getElementById("h2").style.color = "red";
				} else {
					document.getElementById("h2").innerHTML = "";
				}
		}
		
		function uname(){
				var n = document.getElementById("uname").value;
				if (n == "") {
					document.getElementById("h3").innerHTML = "UserName required *";
					document.getElementById("h3").style.color = "red";
				} else {
					document.getElementById("h3").innerHTML = "";
				}
		}


document.getElementById("password").addEventListener("blur", checkpassword);
document.getElementById("repassword").addEventListener("blur", checkpassword);

function checkpassword(){
	var pwd= document.getElementById("password").value;
	var repwd=document.getElementById("repassword").value;
	if(pwd==""||repwd==""){
		document.getElementById("pwdError").innerHTML=" password required!!!";
		document.getElementById("pwdError").style.color="red";
	}
	else if(pwd!=repwd){
		document.getElementById("repwdError").innerHTML="both password and confirm passwords are not matching";
		document.getElementById("repwdError").style.color="red";
	}
	else{
		document.getElementById("pwdError").innerHTML="";
		
	}
}



	</script>
<script>

  function toggleForm(mode){
    var l = document.getElementById('loginForm');
    var s = document.getElementById('signupForm');
    var title = document.getElementById('form-title');
    if(mode==='signup'){ l.style.display='none'; s.style.display='block'; title.innerText='Create an account'; }
    else { s.style.display='none'; l.style.display='block'; title.innerText='Welcome — Login'; }
  }
</script>
</body>
</html>
