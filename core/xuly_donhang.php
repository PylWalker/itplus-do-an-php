<?php

$id_tt = $_POST['id_tt'];
$id_dh = $_POST['id_dh'];

$conn = mysqli_connect("localhost","root","","project_thue_xe");
mysqli_set_charset($conn,'utf8');
// Kiểm tra kết nối
if (mysqli_connect_errno($conn)){
    echo "Lỗi kết nối: " . mysqli_connect_error($conn);
}

$sql = "UPDATE tb_lien_he_thue_xe SET trang_thai = $id_tt WHERE id = $id_dh";


$res = mysqli_query($conn,$sql);
mysqli_close($conn);