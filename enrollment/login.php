 <!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <link rel="icon" type="image/x-icon" href="img/logo.png" />

  <title>Login | Enrollment System</title>
 	

<?php include('./header.php'); ?>

    <?php
    session_start();
    require __DIR__.'/services/AuthService.php';


    if (isset($_SESSION['login_id'])) {
        header("location:index.php?page=home");
        exit(); // Ensure that you stop execution after a header redirect
    }

    $authService = new AuthService();

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        try {
            $email = $_POST['username'];
            $password = $_POST['password'];
            $result = $authService->loginUser($email, $password);
            if ($result != null) {
                $token = $result->firebaseUserId();
                echo "<script>alert('Successfully logged in ${token}')</script>";
//                header("location:index.php?page=home");
//                exit();
            } else {
                echo "<script>alert('Invalid email or password')</script>";
            }
        } catch (\Exception $e) {
            echo "<script>alert('An error occurred')</script>";
        }
    }
    ?>

</head>
<style>
	body{
		width: 100%;
	    height: calc(100%);
	    background-image: url("img/bg.jpeg")
	}
	main#main{
		width:100%;
		height: calc(100%);
		background:white;
	}
	#login-right{
		position: absolute;
		right:0;
		width:40%;
		height: calc(100%);
		background:white;
		display: flex;
		align-items: center;
		flex-flow: wrap;
	}
	#login-right .card{
		margin: auto
	}
</style>

<body>


  <main id="main" class="login alert-info">

  		<div id="login-right">
				<div class="col-md-12 text-center">
				<img src="img/school-logo.png" style="height: 90px; width: 98px">
					<h4><strong>Bugayong Integrated School Academic Management System - Login</strong></h4>
				</div>
			
  			<div class="card col-md-8">
  				
  				<div class="card-body">
  					<form id="login-form" method="post">
  						<div class="form-group">
  							<label for="username" class="control-label">Username</label>
  							<input type="text" id="username" name="username" class="form-control">
  						</div>
  						<div class="form-group">
  							<label for="password" class="control-label">Password</label>
  							<input type="password" id="password" name="password" class="form-control">
  						</div>
  						<center><button class="btn-sm btn-block btn-wave col-md-4 btn-primary">Login</button></center>
  					</form>
  				</div>
  			</div>
  		</div>
   

  </main>

  <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

</body>
<!--</body>-->
<!--<script>-->
<!--	$('#login-form').submit(function(e){-->
<!--		e.preventDefault()-->
<!--		$('#login-form button[type="button"]').attr('disabled',true).html('Logging in...');-->
<!--		if($(this).find('.alert-danger').length > 0 )-->
<!--			$(this).find('.alert-danger').remove();-->
<!--		$.ajax({-->
<!--			url:'ajax.php?action=login',-->
<!--			method:'POST',-->
<!--			data:$(this).serialize(),-->
<!--			error:err=>{-->
<!--				console.log(err)-->
<!--		$('#login-form button[type="button"]').removeAttr('disabled').html('Login');-->
<!---->
<!--			},-->
<!--			success:function(resp){-->
<!--				if(resp == 1){-->
<!--					location.reload('index.php?page=home');-->
<!--				}else{-->
<!--					$('#login-form').prepend('<div class="alert alert-danger">Username or password is incorrect.</div>')-->
<!--					$('#login-form button[type="button"]').removeAttr('disabled').html('Login');-->
<!--				}-->
<!--			}-->
<!--		})-->
<!--	})-->
<!--</script>	-->
</html>