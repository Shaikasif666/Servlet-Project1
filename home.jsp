<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - Vcube Portal</title>

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body, html {
            height: 100%;
            margin: 0;
            overflow: hidden;
            font-family: 'Poppins', sans-serif;
        }

        /* Fullscreen Background Carousel */
        .carousel-item img {
            object-fit: cover;
            width: 100%;
            height: 100vh;
            filter: blur(3px) brightness(0.7);
        }

        /* Glass Container */
        .content-box {
            backdrop-filter: blur(12px);
            background: rgba(255, 255, 255, 0.15);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            color: white;
            max-width: 450px;
        }

        .welcome-text {
            font-size: 30px;
            font-weight: 600;
            line-height: 1.3;
        }

        .btn-custom {
            width: 100%;
            border-radius: 30px;
            padding: 12px;
            font-weight: 500;
            margin-top: 10px;
        }

        .photo-container img {
            width: 350px;
            height: 350px;
            border-radius: 20px;
            object-fit: cover;
            box-shadow: 0 8px 20px rgba(0,0,0,0.4);
        }

        .centered-section {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 75%;
        }
    </style>
</head>

<body>

<!-- 🔹 Background Carousel -->
<div id="bgCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://images.unsplash.com/photo-1503676260728-1c00da094a0b" />
        </div>
        <div class="carousel-item">
            <img src="https://images.unsplash.com/photo-1523050854058-8df90110c9f1" />
        </div>
        <div class="carousel-item">
            <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c" />
        </div>
    </div>
</div>

<!-- 🔹 Main Section with Photo Left + Content Right -->
<div class="centered-section">
    <div class="row align-items-center">

        <!-- PHOTO LEFT -->
        <div class="col-md-6 text-center">
            <!-- Replace with your own photo -->
            <div class="photo-container">
                <img src="images/itachi.jpeg" class="photo-container">

            </div>
        </div>

        <!-- CONTENT RIGHT -->
        <div class="col-md-6">
            <div class="content-box">

                <h2 class="welcome-text mb-3">
                    Welcome, <%= username %> 👋
                </h2>

                <p class="text-light mb-4">
                    You have successfully logged in to your <strong>Vcube Portal</strong>.
                    Manage your profile and settings from here.
                </p>

                <a href="myproject.jsp" class="btn btn-info btn-custom">
                    <i class="fa fa-user" ></i> MY Project 
                </a>

                <a href="forgotPassword.jsp" class="btn btn-warning btn-custom">
                    <i class="fa fa-key"></i> Change Password
                </a>

                <a href="deleteAccount.jsp" class="btn btn-danger btn-custom">
                    <i class="fa fa-trash"></i> Delete Account
                </a>

                <a href="index.jsp" class="btn btn-light btn-custom">
                    <i class="fa fa-sign-out-alt"></i> Logout
                </a>

            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
