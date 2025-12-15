<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Delete Account</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
  :root{--accent:#0fb3a6;}
  html,body{height:100%; margin:0; font-family:Inter, sans-serif;}
  .bg{position:fixed; inset:0; z-index:-2; background-image:url('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?auto=format&fit=crop&w=1600&q=80'); background-size:cover; filter:blur(6px) brightness(.6); transform:scale(1.03);}
  .overlay{position:fixed; inset:0; background:linear-gradient(135deg, rgba(15,179,166,0.06), rgba(0,0,0,0.16)); z-index:-1;}

  .wrap{display:flex; align-items:center; justify-content:center; min-height:100vh; padding:20px;}
  .card{width:420px; max-width:95%; padding:26px; border-radius:14px; background:rgba(255,255,255,0.96); box-shadow:0 12px 30px rgba(2,22,22,0.12);}
  .danger {color:#c62828;}
  .btn-danger-custom{background:#c62828; border:none; color:#fff; border-radius:999px;}
  .back{margin-top:12px; text-align:center;}
</style>
</head>
<body>
<div class="bg" aria-hidden="true"></div>
<div class="overlay" aria-hidden="true"></div>

<div class="wrap">
  <div class="card">
    <h4 class="mb-2 danger"><i class="fa fa-triangle-exclamation"></i> Delete Account</h4>
    <p class="text-muted small mb-3">This action is <strong>permanent</strong>. Please confirm your credentials to delete your account.</p>

    <form method="post" action="DeleteController">
      <input type="hidden" name="action" value="deleteAccount">
      <div class="form-group">
        <label>Username</label>
        <input type="text" name="username" class="form-control" placeholder="username" required>
      </div>

      <div class="form-group">
        <label>Password</label>
        <input type="password" name="password" class="form-control" placeholder="password" required>
      </div>

      <button class="btn-danger-custom btn-block">Delete My Account</button>
    </form>

    <div class="back">
      <a href="index.jsp" class="small text-muted"><i class="fa fa-arrow-left"></i> Back to Login</a>
    </div>
  </div>
</div>
</body>
</html>
