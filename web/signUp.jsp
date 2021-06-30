<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Sign Up Form</title>
        <style>
            vis{display: block;
                width: 30vw;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="home">Home Page</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">


                        <c:if test="${sessionScope.user == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Welcome, be a member to get more discount!</a>

                            </li>

                        </c:if>
                    </ul>

                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <a class="btn btn-success btn-sm ml-3" href="show">
                            <i class="fa fa-shopping-cart"></i> Cart
                            <span class="badge badge-light"></span>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <%--<jsp:include page="slider.html"></jsp:include> --%>  
        <section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading"><b>SWP</b> Bakery </h1>
                <p class="lead text-muted mb-0">High Quality Products Only</p>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                        </ol>
                    </nav>
                </div>
            </div>
            <div id="logreg-forms"> 
                <form action="signUp" method="post" class="form-signin">
                    <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign up</h1>
                    <p class="text-danger">${mess}</p>
                    <input name="fullName" type="text" id="userFullName" class="form-control" placeholder="Full Name" required autofocus="">
                    <input name="address" type="text" id="address" class="form-control" placeholder="Address" required autofocus="">
                    <input name="phoneNumber" type="text" id="phoneNumber" class="form-control" placeholder="Phone Number" required autofocus="">
                    <!--                <input type="radio" id="userGender" name="gender" value="male"> Male
                                    <input type="radio" id="userGender" name="gender" value="female" checked> Female
                                    <input type="radio" id="userGender" name="gender" value="other"> Other-->
                    <input name="user" type="text" id="user-name" class="form-control" placeholder="Email" required= autofocus="">
                    <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus="">
                    <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus="">

                    <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
                    <a href="Login.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
                </form>
                <br>

            </div>
            <jsp:include page="Footer.jsp"></jsp:include>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script>
                function toggleResetPswd(e) {
                    e.preventDefault();
                    //                $('#logreg-forms .form-signin').toggle() // display:block or none
                    //                $('#logreg-forms .form-reset').toggle() // display:block or none
                }

                function toggleSignUp(e) {
                    e.preventDefault();
                    //                $('#logreg-forms .form-signin').toggle(); // display:block or none
                    //                $('#logreg-forms .form-signup').toggle(); // display:block or none
                }

                $(() => {
                    //                // Login Register Form
                    //                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                    //                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                    //                $('#logreg-forms #btn-signup').click(toggleSignUp);
                    //                $('#logreg-forms #cancel_signup').click(toggleSignUp);
                })
            </script>

    </body>
</html>