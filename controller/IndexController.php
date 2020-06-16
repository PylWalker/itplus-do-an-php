<?php

class IndexController extends Controller{
    public function IndexAction(){

        $objModelCongTy = new CompanyModel();
        $this->view->LoadListCompany = $objModelCongTy->LoadListIndex();
        $objModelBannerIndex = new BannerIndexModel();
        $this->view->LoadListBannerIndex = $objModelBannerIndex->LoadBannerIndex();
        $objModelXe = new XeModel();
        $this->view->LoadListXeIndex = $objModelXe->LoadListCarIndex();
        $objModelBaiViet = new BaiVietModel();
        $this->view->LoadListBaiVietIndex = $objModelBaiViet->LoadBaiVietIndex();


        $this->view->LoadXeDuLich = $objModelXe->LoadXeDuLich();
        $this->view->LoadXeCuoiHoi = $objModelXe->LoadXeCuoiHoi();
        $this->view->LoadXeLeHoi = $objModelXe->LoadXeLeHoi();
        $this->view->LoadXeBanTai = $objModelXe->LoadXeBanTai();
        $this->view->LoadBVM = $objModelBaiViet->LoadBaiVietMoi();





    	}

    public function CompanyAction(){

        $objModel = new CompanyModel();
        $objModelReply = new ReplyCompanyModel();
        if (!isset($_GET['id-ct']))
            header('Location:?action=list-company');
        else
        $objModel->id_cong_ty = $_GET['id-ct'];

        $this->view->LoadOne = $objModel->LoadOne();
        $this->view->LoadListLoaiXe = $objModel->LoadLoaiXe();
        $this->view->LoadXeMoi = $objModel->LoadXeMoi();
        $this->view->LoadXeNoiBat = $objModel->LoadXeNoiBat();
        $this->view->LoadXeThueNhieu = $objModel->LoadXeThueNhieu();
        $this->view->LoadBaiViet = $objModel->LoadBaiViet();
        $this->view->Comment = $objModel->LoadListComment();
        $this->view->Reply = $objModelReply->LoadList();

    }	
    public function AlbumAction(){
        $objModel = new CompanyModel();

        if (!isset($_GET['id-ct']))
            header('Location:?action=list-company');
        else
            $objModel->id_cong_ty = $_GET['id-ct'];

        $this->view->LoadOne = $objModel->LoadOne();
        $this->view->LoadListLoaiXe = $objModel->LoadLoaiXe();

    }
    public function NewsAction(){
        $objModel = new CompanyModel();
        $objModelReply = new ReplyCompanyModel();
        if (!isset($_GET['id-ct']))
            header('Location:?action=list-company');
        else
            $objModel->id_cong_ty = $_GET['id-ct'];

        $this->view->LoadOne = $objModel->LoadOne();
        $this->view->LoadListLoaiXe = $objModel->LoadLoaiXe();
        $this->view->LoadBVNB = $objModel->LoadBaiVietNoiBat();
        $this->view->LoadBV = $objModel->LoadTinTuc();





    }
    public function IntroductionAction(){
        $objModel = new CompanyModel();
        $objModelReply = new ReplyCompanyModel();
        if (!isset($_GET['id-ct']))
            header('Location:?action=list-company');
        else
            $objModel->id_cong_ty = $_GET['id-ct'];

        $this->view->LoadOne = $objModel->LoadOne();
        $this->view->LoadListLoaiXe = $objModel->LoadLoaiXe();

    }
    public function Introduction2Action(){
        
    }
    public function ContactAction(){

        $objModel = new CompanyModel();

        if (!isset($_GET['id-ct']))
            header('Location:?action=list-company');
        else
            $objModel->id_cong_ty = $_GET['id-ct'];

        $this->view->LoadOne = $objModel->LoadOne();
        $this->view->LoadListLoaiXe = $objModel->LoadLoaiXe();
    	
    }
    public function DetailItemAction(){
        $objModel = new CompanyModel();
        $objModelXe = new XeModel();
        $objModelReply  = new ReplyXeModel();
        $objModelGallery = new GalleryModel();

        if (!isset($_GET['id-ct']))
            header('Location:?action=list-company');
        else{
            $objModel->id_cong_ty = $_GET['id-ct'];


        }
        $this->view->LoadOne = $objModel->LoadOne();

        if (isset($_GET['id-xe'])) {
            $objModelXe->id_xe = $_GET['id-xe'];
            $objModelGallery->id_car = $_GET['id-xe'];

            $this->view->LoadXe = $objModelXe->LoadOne();
            $this->view->Comment = $objModelXe->LoadListComment();
            $this->view->Reply = $objModelReply->LoadList();


            $this->view->Gallery = $objModelGallery->LoadList();


        }
        else
            header('Location:?action=list-item&id-ct='.$_GET['id-ct']);



    }
    public function DetailNewsAction(){
        $objModel = new CompanyModel();
        $objModelDetail = new BaiVietModel();
        if (!isset($_GET['id-ct']))
            header('Location:?action=list-company');
        else {
            $objModel->id_cong_ty = $_GET['id-ct'];
            $objModelDetail->id_cong_ty = $_GET['id-ct'];
        }
        if (!isset($_GET['id-bv']))
            header('Location:?action=news');
        else
            $objModelDetail->id_bv = $_GET['id-bv'];




        $this->view->LoadOne = $objModel->LoadOne();
        $this->view->LoadListLoaiXe = $objModel->LoadLoaiXe();
        $this->view->LoadDetail = $objModelDetail->LoadOne();
    }
    public function ListItemAction(){
        $objModel = new CompanyModel();
        $objModelXe = new XeModel();

        if (!isset($_GET['id-ct']))
            header('Location:?action=list-company');
        else{
            $objModel->id_cong_ty = $_GET['id-ct'];
            $objModelXe->id_cong_ty = $_GET['id-ct'];
        }

        $this->view->LoadOne = $objModel->LoadOne();
        $this->view->LoadListLoaiXe = $objModel->LoadLoaiXe();
        $this->view->LoadNSX = $objModel->LoadNSX();
        $this->view->LoadList = $objModelXe->LoadList();

        if (isset($_GET['id-lx'])) {
            $objModelXe->loai_xe = $_GET['id-lx'];

            $this->view->LoadLoaiXe = $objModelXe->LoadTheLoaiXe();
        }







    }
    public function LoginAction(){





        $objModel = new UserModel();

        if (isset($_POST) && !empty($_POST)){
            $err = array();


            $bieu_thuc_username = '/^[a-zA-Z0-9_]{6,100}$/';
            $bieu_thuc_password = '/^[a-zA-Z0-9]{6,100}$/';

            if (!preg_match($bieu_thuc_username,$_POST['txt_username']))
                $err['username_err'] = 'Tên đăng nhập không hợp lệ';
            if (!preg_match($bieu_thuc_password,$_POST['txt_passwd']))
                $err['passwd_err'] = 'Mật khẩu không hợp lệ';


            $this->view->err = $err;
            if (empty($this->view->err)){

                $objModel->ten_dang_nhap = $_POST['txt_username'];
                $objModel->passwd = $_POST['txt_passwd'];

                $res = $objModel->Login();

                if(is_a($res,'stdClass')){
                    // đăng nhập thành công
                    unset($res->passwd); //xóa pass khỏi user
                    $_SESSION['auth'] = $res;
                    header('Location:index.php');
//                    if ($_SESSION['auth']->nhom_tai_khoan_id == 1)
//                        header('Location:?controller=admin-user');
//                    else
//                        // chuyển trang về trang chủ
//                        header('Location:'.base_path);
                }else{
                    $this->view->err[] = $res;
                }



            }







        }








    }
    public function LogoutAction(){

        session_unset();
        header('Location:index.php');


    }
    public function ListCompanyAction(){

        $objModel = new CompanyModel();
        $this->view->LoadList = $objModel->LoadList();




    }
    public function ProfileAction(){









    }
    public function OrderListAction(){


        $objModel = new ThueXeModel();
        $objModelCompany = new CompanyModel();
        $objModelCompany->id_user = $_SESSION['auth']->id_user;
        $id_ct = $objModelCompany->LoadTaiKhoanCongTy();

        $objModel->id_cong_ty = $id_ct['id'];
        $this->view->LoadListOrder = $objModel->LoadList();

        echo "<pre>";
        print_r($_POST);
        echo "</pre>";




    }
    public function DetailOrderAction(){

        $objModel = new ThueXeModel();
        if (!isset($_GET['id-order']) || empty($_GET['id-order']))
            header('Location:?action=order-list');
        else
            $objModel->id_order = $_GET['id-order'];

        $this->view->LoadOne = $objModel->LoadOne();




    }
    public function DeleteOrderAction(){
        $objModel = new ThueXeModel();
        if (!isset($_GET['id-order']) || empty($_GET['id-order']))
            header('Location:?action=order-list');
        else
            $objModel->id_order = $_GET['id-order'];

        $res = $objModel->Delete();

        header('Location:?action=order-list');


    }
    public function DatThueAction(){

        $objModel = new ThueXeModel();

        $objModel->id_cong_ty = $_POST['id-ct'];
        $objModel->id_xe = $_POST['id-xe'];
        $objModel->id_user = $_SESSION['auth']->id_user;
        $objModel->noi_dung = $_POST['content'];

        $res = $objModel->AddNew();



        if (is_numeric($res)){

            $this->view->thongbao = 'Yeu cau dat thue cua ban da duoc gui di,cong ty se lien he voi ban trong thoi gian som nhat';



        }
        else

            $this->view->err = 'Yeu cau dat thue cua ban khong thanh cong';










    }
    public function HoSoAction(){

        $objModel = new CompanyModel();

        $objModel->id_user = $_SESSION['auth']->id_user;

        $this->view->LoadOne = $objModel->LoadHoSo();







    }
    public function EditHoSoAction(){
        $objModel = new CompanyModel();

        $objModel->id_user = $_SESSION['auth']->id_user;

        $this->view->LoadOne = $objModel->LoadHoSo();

        $email = $this->view->LoadOne['email'];



        if (isset($_POST) && !empty($_POST)){

            $objModel->file_name = $_FILES['f_upload']['name'];
            $objModel->file_type = $_FILES['f_upload']['type'];
            $objModel->file_tmp_name = $_FILES['f_upload']['tmp_name'];
            $objModel->file_size = $_FILES['f_upload']['size'];
            $objModel->file_error = $_FILES['f_upload']['error'];

            $res = $objModel->XuLyUpload();

//            [ten_ct] => Công ty Điện máy anh dũng
//            [sdt_ct] => 092938181
//    [dai_dien] => Nguyễn Công Dũng
//            [sdt_dai_dien] => 01676594189
//    [email] => dienmayanhdung@gmail.com
//            [gioi_thieu]

            $objModel->ten_cong_ty = $_POST['ten_ct'];
            $objModel->sdt_cong_ty = $_POST['sdt_ct'];
            $objModel->ten_dai_dien = $_POST['dai_dien'];
            $objModel->sdt_dai_dien = $_POST['sdt_dai_dien'];
            if ($email != $_POST['email'])
                $objModel->email = $_POST['email'];
            $objModel->gioi_thieu = $_POST['gioi_thieu'];
            $objModel->logo = $res['file_url'];

            $update = $objModel->Update();















        }






    }

    public function ChangePasswdAction(){

        $objModel  = new UserModel();

        $objModel->id_user = $_SESSION['auth']->id_user;

        $LoadOne = $objModel->LoadOne();


        if (isset($_POST) && !empty($_POST)) {

            //Kiem tra input
            $this->view->err = array();

            if ($LoadOne['passwd']!= $_POST['old_pass'])
                $this->view->err[] = "Mật khẩu cũ không đúng";
            if ($_POST['new_pass']!= $_POST['new_pass2'])
                $this->view->err[] = "Nhập lại mật khẩu không đúng";

            if (empty($this->view->err)){

                $objModel->passwd = $_POST['new_pass'];
                $res = $objModel->ChangePassword();

                if (!is_string($res)){

                    header('Location:?action=change-passwd');

                }
                else
                    $this->view->err[] = $res;








            }








        }









    }

    public function CarAction(){

        $objModel = new XeModel();
        $objModelCompany = new CompanyModel();

        $objModelCompany->id_user = $_SESSION['auth']->id_user;

        $id_ct = $objModelCompany->LoadTaiKhoanCongTy();

        $objModel->id_cong_ty = $id_ct['id'];

        $this->view->LoadList = $objModel->LoadList();







    }

    public function DetailCarAction(){


        $objModel = new XeModel();

        $objModel->id_xe = $_GET['id-xe'];

        $this->view->LoadOne = $objModel->LoadOne();










    }
    public function UpdateCarAction(){
        $objModel = new XeModel();
        $objModelNSX = new NhaSanXuatModel();
        $objModelLoaiXe = new LoaiXeModel();

        $objModel->id_xe = $_GET['id-xe'];

        $this->view->LoadOne = $objModel->LoadOne();
        $this->view->LoadNSX = $objModelNSX->LoadList();
        $this->view->LoaiXe = $objModelLoaiXe->LoadList();

//        echo "<pre>";
//        print_r($_POST);
//        print_r($_FILES);
//        echo "</pre>";

        if (isset($_POST) && !empty($_POST)){

            $this->view->err = array();





            if (isset($_FILES) && $_FILES['f_upload']['name']!=''){
            $objModel->file_name = $_FILES['f_upload']['name'];
            $objModel->file_type = $_FILES['f_upload']['type'];
            $objModel->file_tmp_name = $_FILES['f_upload']['tmp_name'];
            $objModel->file_size = $_FILES['f_upload']['size'];
            $objModel->file_error = $_FILES['f_upload']['error'];

            $res = $objModel->XuLyUpload();

            if (!isset($res['file_url']))
                $this->view->err = $res;

            else
            $objModel->hinh_anh = $res['file_url'];

//            header('Location:?action=update-car&id-xe='.$_GET['id-xe']);

            }



            $objModel->ten_xe = $_POST['ten_xe'];
            $objModel->gia_thue_moi = $_POST['gia_moi'];
            $objModel->gia_thue_cu = $_POST['gia_cu'];
            $objModel->mau_xe = $_POST['mau_xe'];
            $objModel->so_ghe = $_POST['so_ghe'];
            $objModel->doi_xe = $_POST['doi_xe'];
            $objModel->loai_xe = $_POST['loai_xe'];
            $objModel->id_nsx = $_POST['nsx'];
            $objModel->bien_so = $_POST['bien_so'];
            $objModel->van_toc = $_POST['van_toc'];
            $objModel->gioi_thieu_xe = $_POST['gioi_thieu_xe'];


            $update = $objModel->Update();

//            header('Location:?action=update-car&id-xe='.$_GET['id-xe']);
















        }





    }
    public function AddCarAction(){



        $objModel = new XeModel();
        $objModelCompany = new CompanyModel();

        $objModelCompany->id_user = $_SESSION['auth']->id_user;
        $res = $objModelCompany->LoadTaiKhoanCongTy();

        $id_ct = $res['id'];

        $objModelNSX = new NhaSanXuatModel();
        $objModelLoaiXe = new LoaiXeModel();

        $this->view->NSX = $objModelNSX->LoadList();
        $this->view->LoaiXe = $objModelLoaiXe->LoadList();

        if (isset($_POST) && !empty($_POST)){

            $this->view->err = array();

            //kiem tra input

            if (empty($this->view->err)){

                $objModel->file_name = $_FILES['f_upload']['name'];
                $objModel->file_type = $_FILES['f_upload']['type'];
                $objModel->file_tmp_name = $_FILES['f_upload']['tmp_name'];
                $objModel->file_size = $_FILES['f_upload']['size'];
                $objModel->file_error = $_FILES['f_upload']['error'];

                $res = $objModel->XuLyUpload();

                if (!isset($res['file_url']))
                    $this->view->err = $res;

                else
                {
                    $objModel->hinh_anh = $res['file_url'];
                    $objModel->id_cong_ty = $id_ct;
                    $objModel->ten_xe = $_POST['ten_xe'];
                    $objModel->mau_xe = $_POST['mau_xe'];
                    $objModel->so_ghe = $_POST['so_ghe'];
                    $objModel->van_toc = $_POST['van_toc'];
                    $objModel->bien_so = $_POST['bien_so'];
                    $objModel->gia_thue_moi = $_POST['gia'];
                    $objModel->id_nsx = $_POST['nsx'];
                    $objModel->loai_xe = $_POST['loai_xe'];
                    $objModel->gioi_thieu_xe = $_POST['gioi_thieu'];

                    $res = $objModel->AddNew();

                    if (is_numeric($res))
                        header('Location:?action=car');

                    else
                        $this->view->err = $res;













                }












            }










        }








    }
    public function DeleteCarAction(){

        $objModel = new XeModel();

        if(!isset($_GET['id-xe']))
            header('Location:?action=car');
        else
            $objModel->id_xe = $_GET['id-xe'];


        $res = $objModel->Delete();

        header('Location:?action=car');





    }
    public function BaiVietAction(){

        $objModel = new BaiVietModel();
        $objModelCompany = new CompanyModel();

        $objModelCompany->id_user = $_SESSION['auth']->id_user;

        $id_ct = $objModelCompany->LoadHoSo();


        $objModel->id_cong_ty = $id_ct['id'];

        $this->view->LoadList = $objModel->LoadList();







    }
    public function EditBaiVietAction(){

        $objModel = new BaiVietModel();


        $objModel->id_bv = $_GET['id-bv'];

        $this->view->LoadOne = $objModel->LoadOneBaiViet();

        if (isset($_POST) && !empty($_POST)){

            $this->view->err = array();

            //1.Kiem tra input


            if (isset($_FILES) && !empty($_FILES)){

                $objModel->file_name = $_FILES['f_upload']['name'];
                $objModel->file_type = $_FILES['f_upload']['type'];
                $objModel->file_tmp_name = $_FILES['f_upload']['tmp_name'];
                $objModel->file_size = $_FILES['f_upload']['size'];
                $objModel->file_error = $_FILES['f_upload']['error'];

                $res = $objModel->XuLyUpload();

                if (!isset($res['file_url']))
                    $this->view->err = $res;
                else
                    $objModel->hinh_anh = $res['file_url'];

             }


             if (empty($this->view->err)){









             }
















        }




    }

    public function DeleteBaiVietAction(){






        
    }
    public function AddnewsAction(){
        echo "<pre>";
        print_r($_POST);
        echo "</pre>";

    }

    public function CommentListAction(){

        $objModel = new XeModel();





    }

    public function DeleteCommentAction(){







    }
    public function PhanHoiAction(){





    }
    
    public function DanhGiaAction(){






    }
    public function ListCarAction(){

        $objModel = new XeModel();






        $trang = @$_GET['trang'];
        //thực hiện phân trang
        //1.Đếm tổng số bản ghi theo điều kiện
        $tong_so_ban_ghi = $objModel->CountCar();
        if (!is_numeric($tong_so_ban_ghi))
            die("$tong_so_ban_ghi");
        //Tinh tong so trang
//        echo "Tổng số bản ghi:".$tong_so_ban_ghi;
        $tong_so_trang = ceil($tong_so_ban_ghi/rows_per_page);

        //Chi dinh lai so trang hien tai
        if ($trang <=0)
            $trang = 1;
        if ($trang > $tong_so_trang)
            $trang = $tong_so_trang;

        //Tim vi tri se lay du lieu

        $offset = ($trang - 1) * rows_per_page;

        $objModel->offset = $offset;
        $this->view->tong_so_trang = $tong_so_trang;


        $this->view->LoadList = $objModel->LoadListCar();




    }
    public function ListBlogAction(){



    }
    public function RegisterAction(){



        
    }


}