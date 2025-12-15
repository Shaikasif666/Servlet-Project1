<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Reset Password</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
  :root{--accent:#0fb3a6;}
  html,body{height:100%; margin:0; font-family:Inter, sans-serif;}
  .bg {position:fixed; inset:0; z-index:-2; background-image:url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1600&q=80'); background-size:cover; filter:blur(6px) brightness(.7); transform:scale(1.03);}
  .overlay{position:fixed; inset:0; background:linear-gradient(135deg, rgba(15,179,166,0.12), rgba(3,82,89,0.08)); z-index:-1;}

  .wrap{display:flex; align-items:center; justify-content:center; min-height:100vh; padding:20px;}
  .card{width:420px; max-width:95%; padding:28px; border-radius:14px; backdrop-filter:blur(6px); background:rgba(255,255,255,0.92); box-shadow:0 12px 30px rgba(2,22,22,0.12);}
  .btn-accent{background:linear-gradient(90deg,var(--accent),#057a72); color:#fff; border:none; border-radius:999px; padding:10px 16px;}
  .back{margin-top:12px; text-align:center;}
</style>
</head>
<body>
<div class="bg" aria-hidden="true"></div>
<div class="overlay" aria-hidden="true"></div>

<div class="wrap">
  <div class="card">
    <h4 class="mb-2 text-primary"><i class="fa fa-key"></i> Reset Password</h4>
    <p class="text-muted small mb-3">Enter your username and choose a new password.</p>

    <form method="post" action="UpdateController">
      <input type="hidden" name="action" value="updatePassword">
      <div class="form-group">
        <label>Username</label>
        <input type="text" name="username" class="form-control" placeholder="username" required id="name">
         <p id="h1"></p>
      </div>

      <div class="form-group">
        <label>New Password</label>
        <input type="password" name="password" class="form-control" placeholder="new password" required id="pwd">
        <p id="pwdMsg"></p>
      </div>

      <button class="btn-accent btn-block">Update Password</button>
    </form>

    <div class="back">
      <a href="index.jsp" class="small text-muted"><i class="fa fa-arrow-left"></i> Back to Login</a> &nbsp; | &nbsp;
      <a href="deleteAccount.jsp" class="small text-muted">Delete Account</a>
    </div>
  </div>
</div>

<script>
//username blur
document.getElementById("name").addEventListener("blur", validateName);
//password blur
document.getElementById("pwd").addEventListener("blur", validatePwd);

function validateName() {
 let n = document.getElementById("name").value;
 let msg = document.getElementById("h1");

 if (n.trim() === "") {
     msg.innerHTML = "Username required *";
     msg.style.color = "red";
 } else {
     msg.innerHTML = "";
 }
}

function validatePwd() {
 let p = document.getElementById("pwd").value;
 let msg = document.getElementById("pwdMsg");

 if (p.trim() === "") {
     msg.innerHTML = "Password required *";
     msg.style.color = "red";
 } 
 else if (p.length < 6) {
     msg.innerHTML = "Password must be at least 6 characters";
     msg.style.color = "red";
 } 
 else {
     msg.innerHTML = "";
 }
}
</script>



</body>
</html>
