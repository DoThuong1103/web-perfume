
<?php $product=mysqli_fetch_array($con->query("select* from products where id=".$_GET['id']));?>
<?php
	if(isset($_POST['productName'])){
		$productName=$_POST['productName'];
		$query="select * from products where productName='$productName' and id!=".$product['id'];
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
				unlink($store.$product['productImage']);
			}else{
			$alert="Flie đã chọn không phải file ảnh!";
			}
			if(empty($imageName)){
				$imageName=$product['productImage'];
			}
			}
			$con->query("update products set brandid='$brandid', productName='$productName', productPrice='$productPrice', productImage='$imageName', productDescription='$productDescription', productStatus='$productStatus' where id=".$product['id']);
			header("location: ?option=product");
			
			
		}
?>
<?php $brands=$con->query("select*from brands");?>
<h1>Update sản phẩm</h1><br>
<section class="alerts"><?=isset($alert)?$alert:''?></section>
<section class="container col-md-6">
	<form method="post" enctype="multipart/form-data">
		<section class="form-group" >
			<label>Hãng:</label>
			<select name="brandid" class="form-control">
				<option hidden>--Chọn hãng--</option>
				<?php foreach($brands as $item):?>
					<option  value="<?=$item['id']?>"<?=$item['id']==$product['brandid']?'selected':''?>><?=$item['brandName']?></option>
				<?php endforeach;?>
			</select>
		</section><br>
		<section class="form-group" >
			<label>Tên :</label>
			<input name="productName" class="form-control" required value="<?=$product['productName']?>">
		</section><br>
		<section class="form-group" >
			<label>Giá :</label>
			<input type="number" min="100000" name="productPrice" class="form-control" required value="<?=$product['productPrice']?>">
		</section><br>
		<section class="form-group" >
			<label>Ảnh :</label><br>
			<img src="../image/<?=$product['productImage']?>" width="70%">
			<input type="file" name="productImage" class="form-control">
		</section><br>
		<section class="form-group" >
			<label>Mô tả :</label>
			<textarea name="productDescription" id="description"><?=$product['productDescription']?></textarea>
			<script>CKEDITOR.replace("productDescription");</script>
		</section><br>
		<section class="form-group">
			<label>Trạng thái: </label><br><br>
			<input type="radio" name="productStatus" value="1" <?=$product['productStatus']==1?'checked':''?> >Active&emsp;&emsp;
			 <input type="radio" name="productStatus" value="0" <?=$product['productStatus']==0?'checked':''?>>Unactive
		</section><br>
		<section><input type="submit" value="Update" class="btn btn-primary">&emsp;&emsp;<input type="button" value="Quay lại" class="btn btn-primary" onclick="location= '?option=product';"></section>
	</form>
</section>