<?php
session_start();
    $content = $_POST["mess"];
    $id_xe = $_POST['id_xe'];
    $id_user = $_POST['id_user'];
    $c_time = $_POST['ngay_gio_binh_luan'];
    $ho_ten = $_POST['ho_ten'];
    $anh = $_SESSION['auth']->avatar;
//    $anh = $_POST['anh'];
    $conn = mysqli_connect("localhost","root","","project_thue_xe");
    mysqli_set_charset($conn,'utf8');
    // Kiểm tra kết nối
    if (mysqli_connect_errno($conn)){
        echo "Lỗi kết nối: " . mysqli_connect_error($conn);
    }

    $sql = "INSERT INTO tb_binh_luan_xe(noi_dung,ngay_gio_binh_luan,id_xe,id_user)
            VALUES ('$content','$c_time','$id_xe','$id_user')";


    $res = mysqli_query($conn,$sql);
    $last_id = mysqli_insert_id($conn);

    mysqli_close($conn);

    echo"<div class='row haha'>
            <div class='col-md-1 col-xs-3' >
              <img src = '$anh' class='img-fluid avatar' alt = 'Responsive image' >
             </div >
             <div class='col-md-11 col-xs-9 haha' >
                  <p class='ten'> $ho_ten <span class='ngay-comment' > $c_time </span ></p >
                  <p class='comment'> $content</p>
                  <p class='reply'> Trả lời </p >";
             echo "<form method='post' action=''>
                      <div class='reply-content'>                                  
                            <textarea rows='3' class='form-control rep-mess{$last_id}' placeholder=''></textarea>
                            <p class='detail' ><input type = 'submit' class='hvr-shadow-radial reply-button' data-comid='{$last_id}' value='Reply'></p >
                      </div >
            
                    </form >";





            echo "</div>";
         echo "</div>";




?>