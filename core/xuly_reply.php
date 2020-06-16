<?php

session_start();


$content = $_POST["mess"];
$id_comment = $_POST['id_comment'];

$id_user = $_POST["id-user"];
$dt = new DateTime();
$c_time = $dt->format('Y-m-d');
$anh = $_SESSION['avatar'];
$ho_ten = $_POST["ho-ten"];
//$anh = $_POST["anh"];

$conn = mysqli_connect("localhost","root","","project_thue_xe");
mysqli_set_charset($conn,'utf8');
// Kiểm tra kết nối
if (mysqli_connect_errno($conn)){
    echo "Lỗi kết nối: " . mysqli_connect_error($conn);
}

$sql = "INSERT INTO tb_reply_xe(noi_dung_reply,ngay_dang,id_comment,id_user_reply)
            VALUES ('$content','$c_time','$id_comment','$id_user')";

$res = mysqli_query($conn,$sql);

mysqli_close($conn);

echo"<div id = 'reply-content2' >
         <div class='row' >
               <div class='col-md-1 col-xs-3' >
                    <img src = '$anh' class='img-fluid avatar' alt = 'Responsive image' >
               </div >
               <div class='col-md-11 col-xs-9' >
                      <p class='ten' > $ho_ten <span class='chuc-vu' ><i class='fa fa-star' aria - hidden = 'true' > Quản trị viên </i ></span ><span class='ngay-comment' > $c_time </span ></p ></p >
                      <p class='comment' > $content</p >
                                    
                                    
               </div >
         </div >
     </div >";