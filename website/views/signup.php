
<?php
	if(isset($_POST['username'])):
		$username = $_POST['username'];
		$query = "select*from users where username='$username'";
		$result = $con->query($query);
		if(mysqli_num_rows($result) > 0):
			$alert = "Tên đăng nhập này đã tồn tại. Mời bạn chọn 1 tên khác!";
		else:
			$password = md5($_POST['password']);
			$fullname = $_POST['fullname'];
			$mobile = $_POST['mobile'];
			$address = $_POST['address'];
			$email = $_POST['email'];
			$query = "insert users(username,password,fullname,mobile,address,email) values('$username','$password','$fullname','$mobile','$address','$email')";
			$con->query($query);
			header("location: ?option=login");
		endif;
	endif;
?>

<section class='signup'>
	<br>
	<h1>Đăng kí tài khoản</h1>
	<br>
	<section><?=isset($alert)?$alert:""?></section>
	<section class='signup-info' >
		<form method="post" onsubmit="if(confrmpassword.value!=password.value){alert('Xác nhận mật khẩu không đúng!'); confirmpasswpord.value=''; confirmpassword.focus(); return false;}">
			
				<div class='signup-info-main'>
					<input  class="signup-box signup-box2" type="text" name="username" required placeholder='Username...'>
				
				
					<input class="signup-box signup-box2" type="text" name="fullname" required placeholder='Fullname...'>
				
				
					<input class="signup-box signup-box2" type="password" name="password" required placeholder='Password...'>
				
				
					<input class="signup-box signup-box2" type="password" name="confirmpassword" required placeholder='Confirmpassword...'>
				
				
					<input class="signup-box signup-box1"  type="tel" name="mobile" required placeholder='Mobile...'>
				
				
					<input class="signup-box signup-box1" resize  name="address"  required placeholder='Address..'></input>
				
				
					<input class="signup-box signup-box1" type="text" name="email" placeholder='Email...'>
				
				
					<input class="btn btn-sm btn-info btn-signup" type="submit" value="Đăng ký">

				</div>
				
			</table>
		</form>
	</section>
</section>