<h1>ĐĂNG NHẬP TRANG QUẢN TRỊ ADMIN</h1>
	<section class="alerts"><?=isset($alert)?$alert:''?></section><br>
	<form method="post" class="container col-md-3">	
		<table class="table table-bordered brandadmin" border="0px">
			<tr>
				<td>
				
					<label>Username</label>
				</td>
				<td>
					<input  name="username">
				
				</td>
			</tr>
		<br>
		<tr>
			<td>
			<label>Password</label>
			</td>
			<td>
			<input type="password" name="password">
			</td>
		</tr><br>
		<tr>
			<td colspan="2"><input type="submit" value="Đăng nhập"></td>
		</tr>
		
	</table>
	</form>