<?php
$query="select*from users where username='".$_SESSION['user1']."'";
$users=mysqli_fetch_array($con->query($query));
?>
<?php
if(isset($_POST['name'])){
    $name=$_POST['name'];
    $mobile=$_POST['mobile'];
    $address=$_POST['address'];
    $email=$_POST['email']; 
    $note=$_POST['note'];
    $ordermethodid=$_POST['ordermethodid'];
    $userid=$users['id'];
    $query="insert orders (ordermethodid,userid,name,address,mobile,email,note)values($ordermethodid,$userid,'$name','$address','$mobile','$email','$note')";

$con->query($query);
$query="select id from orders order by id desc limit 1";
$orderid=mysqli_fetch_array($con->query($query))['id'];
foreach($_SESSION['cart'] as $key=>$value){
    $productid=$key;
    $number=$value;
    $query="select productPrice from products where id=$key";
    $productPrice=mysqli_fetch_array($con->query($query))['productPrice'];
    $query="insert orderdetail values($productid,$orderid,$number,$productPrice, $number*$productPrice)";
    $con->query($query);

}
unset($_SESSION['cart']);
header("location:?option=ordersuccess");
}
?>

<br>	
<h1 style="  text-align: center; ">ĐẶT HÀNG</h1><hr><br>		
<form method="post">
<h2 style="  text-align: center; ">THÔNG TIN NGƯỜI NHẬN HÀNG</h2><br>	
<section style="  text-align: center; ">
 		<table class="table table-bordered">
			<tr>
				<td> <label >HỌ TÊN:</label></td>
				<td class="boxbn"><input class="textbox" name="name" value="<?=$users['fullname']?>"></td>
			</tr>
			<tr>
				<td> <label >ĐIỆN THOẠI:</label></td>
				<td class="boxbn"><input class="textbox" type="tel" name="mobile" value="<?=$users['mobile']?>"></td>
			</tr>
			<tr>
				<td><label >ĐỊA CHỈ:</label></td>
				<td class="boxbn"><textarea class="textbox" name="address"  rows="3"><?=$users['address']?></textarea></td>
			</tr>
			<tr>
				<td><label >EMAIL:</label></td>
				<td class="boxbn"><input class="textbox" type="email" name="email"  value="<?=$users['email']?>"></td>
			</tr>
			<tr>
				<td> <label >GHI CHÚ:</label></td>
				<td class="boxbn"><textarea class="textbox" name="note" id=""  rows="3"></textarea></td>
			</tr>
		</table> 
   <h2 style="  text-align: center; "> CHỌN HÌNH THỨC THANH TOÁN</h2><br>	
  <section style="  text-align: center; ">
  <?php
   $query="select * from ordermethod where status";
   $result=$con->query($query);
   ?>
   <select name="ordermethodid" >
       <?php foreach($result as $item):?>
        <option value="<?=$item['id']?>"><?=$item['name']?></option>
        <?php endforeach;?>
   </select><br><br><hr>	
   <section>
       <input class="btn btn-info " type="submit" value="ĐẶT HÀNG" style="margin-top:20px; margin-bottom: 20px;">
   </section>
  </section>
 </form>