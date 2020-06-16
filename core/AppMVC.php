<?php
class AppMVC {
    /**
    Hàm nhận các tham số từ url để điều khiển
     */
    public function run(){
        // echo '<pre>';
        // 	print_r($_GET);
        // echo '</pre>';
        $controller = isset($_GET['controller'])? $_GET['controller']:'index';
        $action = isset($_GET['action'])? $_GET['action']:'index';
        //kiem tra phan quyen
        // if(!$this->CheckACL($controller,$action)){
        //     // không có quyền vào action hiện tại

        //     echo "<p style='color: red; text-align:center'>Bạn chưa được cấp quyền sử dụng thao tác này!</p>";
        //     die();
        // }

        // chuyển tham số url thành tên lớp
        $classController = str_replace('-', ' ', $controller);
        $classController = ucwords($classController);
        $classController = str_replace(' ', '', $classController);
        $classController .= 'Controller';
//        echo "Ten lop: $classController <br>";
        // chuyển biến action thành tên action
        $actionName = str_replace('-', ' ', $action);
        $actionName = ucwords($actionName);
        $actionName = str_replace(' ', '', $actionName);
        $actionName .= 'Action';
        $objController = new $classController(); // tạo mới đối tượng controller
        if(!method_exists($objController, $actionName))
            die('Page <b>'. $actionName .'</b> not found!');
        $objController->currentController = strtolower($controller);
        $objController->currentPage = strtolower($action);
        $objController->$actionName(); // lệnh gọi page của đối tượng controller
        $objController->loadLayout();


    }
   //  private function CheckACL($controller, $page){
   //      if (isset($_SESSION['auth']) && $_SESSION['auth']->nhom_tai_khoan_id == 1)
   //          return true;

   //      //admin-nha-san-xuat_index
   //      $str_check = $controller .'_'. $action;
   //      $arrDefaultAllow = array('index_index', 'index_login','index_signup','index_logout');
   //      //1. kiểm tra action có nằm trong mảng mặc định public ko
   //      if(in_array($str_check,$arrDefaultAllow))
   //          return true;
   //      //2. Nếu chưa login thì yêu cầu login
   //      if(empty($_SESSION['auth']))
   //      {
   //          header('Location: '.base_path.'?action=login');
   //          return false;
   //      }
   //      if(empty($_SESSION['auth']->permission_allow)){
   //          // đăng nhập rồi, nhưng chưa có danh sách quyền thì lấy trong csdl ra
   //          $id_nhom_tk = $_SESSION['auth']->nhom_tai_khoan_id;
   //          $sql_check = "SELECT * FROM tb_phan_quyen
			// 	INNER JOIN tb_chuc_nang_website ON  tb_phan_quyen.id_chuc_nang = tb_chuc_nang_website.id
			// 	WHERE tb_phan_quyen.id_ntk = {$id_nhom_tk} AND tb_phan_quyen.trang_thai = 1
			// ";
   //          $objModel = new Model();
   //          $res = mysqli_query($objModel->getConn(),$sql_check);
   //          if(mysqli_errno($objModel->getConn())){
   //              die("Loi truy van phan quyen: ". mysqli_error($objModel->getConn()));
   //          }
   //          // không có lỗi truy vấn
   //          $arrTmp = array();
   //          while($row = mysqli_fetch_assoc($res)){
   //              $arrTmp[] = $row['link'];

   //          }
   //          mysqli_free_result($res);
   //          // lưu mảng link vào trong session để lượt vào trang web tiếp sẽ không phải kết nối CSDL
   //          $_SESSION['auth']->permission_allow = $arrTmp;
   //      }
   //      // kiểm tra quyền với session
   //      if(in_array($str_check, $_SESSION['auth']->permission_allow)){
   //          return true;
   //      }else{
   //          return false;
   //      }
   //  }
}