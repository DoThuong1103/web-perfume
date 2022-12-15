<?php
	if(isset($_POST['productName'])){
		$productName=$_POST['productName'];
		$query="select * from products where productName='$productName'";
		if(mysqli_num_rows($con->query($query))!=0){
			$alert="Đã tồn tại tên sản phẩm này!";
		}else{
			$brandid=$_POST['brandid'];
			$productPrice=$_POST['productPrice'];
			$productDescription=$_POST['productDescription'];
			$productStatus=$_POST['productStatus'];
			
			$store="../image/";
			$imageName=$_FILES['productImage']['name'];
			$imageTemp=$_FILES['productImage']['tmp_name'];
	 		$exp3=substr($imageName, strlen($imageName)-3);
			$exp4=substr($imageName, strlen($imageName)-4);
			if($exp3=='jpg'||$exp3=='png'||$exp3=='bmp'||$exp3=='gif'||$exp3=='JPG'||$exp3=='PNG'||$exp3=='BMP'||$exp3=='GIF'||$exp4=='jpeg'||$exp4=='JPEG'||$exp4=='webp'||$exp4=='WEBP'){
				$imageName=time().'_'.$imageName;
				move_uploaded_file($imageTemp, $store.$imageName);
				$con->query("insert products(brandid,productName,productImage,productPrice, productDescription, productStatus) values('$brandid','$productName','$imageName','$productPrice','$productDescription','$productStatus')");
				header("location: ?option=product");
			}else{
				$alert="Flie đã chọn không phải file ảnh!";
			}
			
		}
	}
?>
<?php $brands=$con->query("select*from brands");?>
<h1>Thêm sản phẩm</h1><br>
<section class="alerts"><?=isset($alert)?$alert:''?></section>
<section class="container col-md-6">
	<form method="post" enctype="multipart/form-data">
		<section class="form-group" >
			<label>Hãng:</label>
			<select name="brandid" class="form-control">
				<option hidden>--Chọn hãng--</option>
				<?php foreach($brands as $item):?>
					<option value="<?=$item['id']?>"><?=$item['brandName']?></option>
				<?php endforeach;?>
			</select>
		</section><br>
		<section class="form-group" >
			<label>Tên :</label>
			<input name="productName" class="form-control" required>
		</section><br>
		<section class="form-group" >
			<label>Giá :</label>
			<input type="number" min="100000" name="productPrice" class="form-control" required>
		</section><br>
		<section class="form-group" >
			<label>Ảnh :</label>
			<input type="file" name="productImage" class="form-control" required>
		</section><br>
		<section class="form-group" >
			<label>Mô tả :</label>
			<textarea name="productDescription" id="description"></textarea>
			<script>CKEDITOR.replace("productDescription");</script>
		</section><br>
		<section class="form-group">
			<label>Trạng thái: </label><br><br>
			<input type="radio" name="productStatus" value="1" checked>Active&emsp;&emsp;
			 <input type="radio" name="productStatus" value="0">Unactive
		</section><br>
		<section><input type="submit" value="Thêm" class="btn btn-primary">&emsp;&emsp;<input type="button" value="Quay lại" class="btn btn-primary" onclick="location= '?option=product';"></section>
	</form>
</section>