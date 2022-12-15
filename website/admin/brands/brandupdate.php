<?php 
	$query="select * from brands where id=".$_GET['id'];
	$result=$con->query($query);
	$brand=mysqli_fetch_array($result);
?>
<?php
	if(isset($_POST['brandName'])){
		$brandName=$_POST['brandName'];
		$query="select * from brands where brandName='$brandName' and id!=".$brand['id'];
		if(mysqli_num_rows($con->query($query))!=0){
			$alert="Đã hãng khác mang tên này!";
		}else{
			$status=$_POST['status'];
			$con->query("update brands set brandName='$brandName', brandStatus='$status' where id=".$brand['id']);
			header("location: ?option=brand");
		}
	}
?>
<h1>Update hãng</h1><br>
<section class="alerts"><?=isset($alert)?$alert:''?></section>
<section class="container col-md-3">
	<form method="post">
		<section class="form-group" >
			<label>Tên hãng:</label>
		</section><br>
		<section>
			<input name="brandName" class="form-control" value="<?=$brand['brandName']?>">
		</section><br>
		<section class="form-group">
			<label>Trạng thái: </label><br><br>
			<input type="radio" name="status" value="1" <?=$brand['brandStatus']==1?'checked':''?> >Active&emsp;&emsp;
			 <input type="radio" name="status" value="0" <?=$brand['brandStatus']==0?'checked':''?>>Unactive
		</section><br>
		<section><input type="submit" value="Update" class="btn btn-primary">&emsp;&emsp;<input type="button" value="Back" class="btn btn-outline-secondary" onclick="location= '?option=brand';"></section>
	</form>
</section>