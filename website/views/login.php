<?php
	if(isset($_POST['username'])):
		$username = $_POST['username'];
		$password = md5($_POST['password']);
		$query = "select * from users where username ='$username' and password = '$password'";
		$result = $con->query($query);
		if(mysqli_num_rows($result) == 0):
			$alert = "Sai tên đăng nhập hoặc mật khẩu!";
		else:
			$user = mysqli_fetch_array($result);
			if($user['status'] == 0):
				$alert = "Tài khoản của bạn đang bị khóa!";
			else:
				$_SESSION['user1'] = $username;
				if(isset($_GET['order'])){
					header("location: ?option=order");
				}
				elseif(isset($_GET['productid'])){
					$userid=$user['id'];
					$productid=$_GET['productid'];
					$content=$_SESSION['content'];
					$con->query("insert comments (userid, productid,date,content) values('$userid','$productid', now(), '$content' )");
					echo"<script>alert('Your comment is submit') </script>";
					header("location:?option=productdetail&id=".$productid);
				}
				else{
					header("location: ?option=news");
				}
			endif;
		endif;	
	endif;
?>
<section class='login'>
	<br>
	<br>
	<h1>Đăng nhập tài khoản</h1>
	<br><br>
	<section><?=isset($alert)?$alert:""?></section>

	<section class='login-info'>
		<form method="post">
		<table>
			<tr>
				<td>
					<input class='login-username' type="text" name="username" placeholder='Username...'>
				</td>
			</tr>
			<tr>
				<td>
					<input class='login-password' type="password" name="password" placeholder='Password...'>
				</td>
			</tr>

		<tr>
			<td >
				<input class="btn btn-info btn-login" type="submit" value="Đăng nhập">
			</td>
		</tr>
		<tr>
			
			<td >
				<div class='login__sign-up'>
					<hr>
					<a href="?option=signup" >Tạo tài khoản mới</a>
				</div>
			</td>
		</tr>
		</table>
	</form>
	</section>
</section>