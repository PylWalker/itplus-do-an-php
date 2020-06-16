
<?php
if(isset($_GET['data'])){
$data = $_GET['data'];
$con = mysqli_connect("localhost","root","","project_thue_xe");
// Kiểm tra kết nối
if (mysqli_connect_errno()){
echo "Lỗi kết nối: " . mysqli_connect_error();
}
 
$sql = "SELECT * FROM tb_xe WHERE ten_xe LIKE '%$data%'";
$result = mysqli_query($con, $sql);
while($row = mysqli_fetch_assoc($result)){
	$link_detail = "?action=detail-item&id-ct={$row['id_cong_ty']}&id-xe={$row['id']}";
echo "
	<a href='$link_detail'>
	<div class='live-search'>
		<img src = '{$row['hinh_anh']}' class='img-fluid' style='max-width:50px' id='left'>
		<p id='left'>{$row['ten_xe']}<br>Số ghế:{$row['so_ghe']}</p>
		<div class='clr'></div>






	</div>
	</a>





";
}
//Đóng kết nối
mysqli_close($con);
 
}
?>