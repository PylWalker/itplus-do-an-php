<?php

class CompanyModel extends Model{
    public $id;
    public $ten_cong_ty;
    public $ten_dai_dien;
    public $sdt_dai_dien;
    public $sdt_cong_ty;
    public $email;
    public $logo;
    public $so_lan_giao_dich_thanh_cong;
    public $gioi_thieu;
    public $id_user;
    public $id_tai_khoan;
    public $id_phuong;
    public $id_quan;
    public $id_tinh;
    public $file_name ;
     public $file_type ;
     public $file_tmp_name;
     public $file_size ;
     public $file_error;

     public $ten_tinh;
     public $ten_quan;
     public $ten_phuong;

     public $page;
     public $search_ten_tinh;

    protected $tb_name = "tb_cong_ty";


    public function LoadListIndex(){

        $sql = "SELECT * FROM $this->tb_name ORDER BY tb_cong_ty.so_lan_giao_dich_thanh_cong DESC LIMIT 4 ";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;







    }
    public function LoadList(){
        $sql = "SELECT * FROM $this->tb_name";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;





    }

    public function LoadListAdmin(){
        $start = ($this->page - 1)*5;
        $sql = "SELECT $this->tb_name.*,tb_tinh.ten_tinh,tb_quan.ten_quan,tb_phuong.ten_phuong
                from $this->tb_name
                inner join tb_tinh on tb_tinh.id = $this->tb_name.id_tinh
                inner join tb_quan on tb_quan.id = $this->tb_name.id_quan
                inner join tb_phuong on tb_phuong.id = $this->tb_name.id_phuong
                limit $start,5 ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objCompany = new stdClass();
            foreach($row as $field_name =>$value)
                $objCompany->$field_name = $value;
            $dataRes[] = $objCompany;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function PhanTrang()
    {
        $sqlCheck = "SELECT * FROM $this->tb_name ";
        $resCheck  =  mysqli_query($this->getConn(), $sqlCheck);
        $tong_so_trang = mysqli_num_rows($resCheck);
        $so_trang = ceil($tong_so_trang/5);
        return $so_trang;
    }

    public function LoadOne(){
        $sql = "SELECT tb_cong_ty.*,tb_tinh.ten_tinh,tb_phuong.ten_phuong,tb_quan.ten_quan FROM $this->tb_name
                INNER JOIN tb_tinh ON tb_tinh.id = tb_cong_ty.id_tinh
                INNER JOIN tb_phuong ON tb_phuong.id = tb_cong_ty.id_phuong
                INNER JOIN tb_quan ON tb_quan.id = tb_cong_ty.id_quan
                WHERE tb_cong_ty.id = $this->id";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);
        return $row;





    }
    public function LoadHoSo(){
        $sql = "SELECT tb_cong_ty.*,tb_tinh.ten_tinh,tb_phuong.ten_phuong,tb_quan.ten_quan FROM $this->tb_name
                INNER JOIN tb_tinh ON tb_tinh.id = tb_cong_ty.id_tinh
                INNER JOIN tb_phuong ON tb_phuong.id = tb_cong_ty.id_phuong
                INNER JOIN tb_quan ON tb_quan.id = tb_cong_ty.id_quan
                WHERE tb_cong_ty.id_tai_khoan = $this->id_user";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);
        return $row;











    }
    public function LoadLoaiXe(){

        $sql = "SELECT tb_xe.*,tb_the_loai_xe.ten FROM tb_xe
                INNER JOIN tb_the_loai_xe ON tb_the_loai_xe.id = tb_xe.loai_xe
                WHERE tb_xe.id = $this->id GROUP BY tb_xe.loai_xe";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;

    }
    public function LoadNSX(){
        $sql = "SELECT tb_xe.*,tb_nha_san_xuat.ten_nsx FROM tb_xe
                INNER JOIN tb_nha_san_xuat ON tb_nha_san_xuat.id = tb_xe.id_nsx
                WHERE tb_xe.id = $this->id GROUP BY tb_xe.id_nsx";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;





    }


    public function LoadXeMoi(){

        $sql = "SELECT * FROM tb_xe WHERE id = $this->id AND trang_thai_hien_thi = 1 LIMIT 6";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;



    }

    public function LoadXeNoiBat(){
        $sql = "SELECT * FROM tb_xe WHERE id = $this->id AND trang_thai_hien_thi = 1 LIMIT 8";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;



    }
    public function LoadXeThueNhieu(){
        $sql = "SELECT * FROM tb_xe WHERE id = $this->id ORDER BY so_lan_thue DESC LIMIT 8";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;







    }
    public function LoadBaiViet(){
        $sql = "SELECT * FROM tb_bai_viet WHERE id = $this->id ORDER BY luot_xem DESC LIMIT 4";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;





    }
    public function LoadListComment(){

        $sql = "SELECT tb_binh_luan_cong_ty.*,tb_user.ho_ten,tb_user.avatar FROM tb_binh_luan_cong_ty
                INNER JOIN tb_user ON tb_user.id_user = tb_binh_luan_cong_ty.id_user   
                WHERE id = $this->id
                ORDER BY ngay_gio_binh_luan DESC";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;










    }
    public function LoadBaiVietNoiBat(){
        $sql = "SELECT * FROM tb_bai_viet WHERE id = $this->id ORDER BY luot_xem DESC LIMIT 3";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;





    }
    public function LoadTinTuc(){
        $sql = "SELECT * FROM tb_bai_viet WHERE id = $this->id ORDER BY tb_bai_viet.ngay_dang DESC";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)){

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;




    }
    public function LoadTaiKhoanCongTy(){
        $sql = "SELECT * FROM tb_cong_ty WHERE id_tai_khoan = $this->id_user";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));



        $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);
        return $row;
    }
    public function XuLyUpload(){
        $res = array();

        $array_extension = array('image/gif','image/jpeg','image/png','image/svg+xml'); // mảng các loại file được chấp nhận upload
        $folder_upload = __DIR__.'/../public/assets/img/logo';
        $file_url = '/../project-xe/public/assets/img/logo';

        if($this->file_error !=0){
            // có lỗi upload
            $res['error'] ="Lỗi upload file!";
            return $res;
        }


        $file_name 		= $this->file_name;
        $file_type 		= $this->file_type;
        $file_tmp_name 	= $this->file_tmp_name;
        $file_size 		= $this->file_size;



        if(!in_array($file_type, $array_extension)){
            $res['error'] ="Lỗi định dạng file không hợp lệ!";
            return $res;
        }

        if($file_size >  1048576 ){
            $res['error'] ="Lỗi chỉ được upload file < 1Mb";
            return $res;
        }

        // đến đây là hợp lệ ==> xử lý upload file
        // Di chuyển file vào thư mục quy định
        $file_upload_new_path = $folder_upload. '/' .$file_name;

        move_uploaded_file($file_tmp_name, $file_upload_new_path);

        if(!file_exists($file_upload_new_path)){
            $res['error'] ="Lỗi move upload file";
            return $res;
        }

        // Đến đây là thành công thao tác upload
        $res['file_path'] = $file_upload_new_path;
        $res['file_url'] = $file_url.= '/' .$file_name;

        return $res;
    }
    public function Update(){
        $strWhere = '';
        if (isset($this->ten_cong_ty))
            $strWhere.= " ten_cong_ty = '$this->ten_cong_ty'";
        if (isset($this->sdt_cong_ty)){
            if ($strWhere!= '')
                $strWhere.=",sdt_cong_ty = '$this->sdt_cong_ty'";
            else
                $strWhere.="sdt_cong_ty = '$this->sdt_cong_ty'";


        }

        if (isset($this->ten_dai_dien)){
            if ($strWhere!= '')
                $strWhere.=",ten_dai_dien = '$this->ten_dai_dien'";
            else
                $strWhere.="ten_dai_dien = '$this->ten_dai_dien'";


        }
        if (isset($this->sdt_dai_dien)){
            if ($strWhere!= '')
                $strWhere.=",sdt_nguoi_dai_dien = '$this->sdt_dai_dien'";
            else
                $strWhere.="sdt_nguoi_dai_dien = '$this->sdt_dai_dien'";


        }
        if (isset($this->email)){
            if ($strWhere!= '')
                $strWhere.=",email = '$this->email'";
            else
                $strWhere.="email = '$this->email'";


        }
        if (isset($this->gioi_thieu)){
            if ($strWhere!= '')
                $strWhere.=",gioi_thieu = '$this->gioi_thieu'";
            else
                $strWhere.="gioi_thieu = '$this->gioi_thieu'";


        }
        if (isset($this->logo)){
            if ($strWhere!= '')
                $strWhere.=",logo = '$this->logo'";
            else
                $strWhere.="logo = '$this->logo'";


        }

        if (isset($this->id_tinh)){
            if ($strWhere!= '')
                $strWhere.=",id_tinh = '$this->id_tinh'";
            else
                $strWhere.="id_tinh = '$this->id_tinh'";


        }

        if (isset($this->id_quan)){
            if ($strWhere!= '')
                $strWhere.=",id_quan = '$this->id_quan'";
            else
                $strWhere.="id_quan = '$this->id_quan'";


        }

        if (isset($this->id_phuong)){
            if ($strWhere!= '')
                $strWhere.=",id_phuong = '$this->id_phuong'";
            else
                $strWhere.="id_phuong = '$this->id_phuong'";


        }




        $sql = "UPDATE $this->tb_name SET {$strWhere} WHERE id_tai_khoan = $this->id_tai_khoan";

        $res = mysqli_query($this->getConn(),$sql);

        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        return $this->id;








    }

    public function LoadTinh(){
        $start = ($this->page - 1)*5;
        if($this->search_ten_tinh!="")
            $sql = "SELECT * FROM tb_tinh where ten_tinh like '%$this->search_ten_tinh%'  limit $start,5 ";
            else
                $sql = "SELECT * FROM tb_tinh limit $start,5 ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objTinh = new stdClass();
            foreach($row as $field_name =>$value)
                $objTinh->$field_name = $value;
            $dataRes[] = $objTinh;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function LoadAllTinh(){
        $sql = "SELECT * FROM tb_tinh ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objTinh = new stdClass();
            foreach($row as $field_name =>$value)
                $objTinh->$field_name = $value;
            $dataRes[] = $objTinh;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function PhanTrangTinh()
    {
        if($this->search_ten_tinh!="")
            $sqlCheck = "SELECT * FROM tb_tinh where ten_tinh like '%$this->search_ten_tinh%'";
            else
                $sqlCheck = "SELECT * FROM tb_tinh ";
        $resCheck  =  mysqli_query($this->getConn(), $sqlCheck);
        $tong_so_trang = mysqli_num_rows($resCheck);
        $so_trang = ceil($tong_so_trang/5);
        return $so_trang;
    }

    public function LoadQuan(){
        $start = ($this->page - 1)*5;
        $sql = "SELECT * FROM tb_quan limit $start,5 ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objQuan = new stdClass();
            foreach($row as $field_name =>$value)
                $objQuan->$field_name = $value;
            $dataRes[] = $objQuan;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function LoadAllQuan(){;
        $sql = "SELECT * FROM tb_quan ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objQuan = new stdClass();
            foreach($row as $field_name =>$value)
                $objQuan->$field_name = $value;
            $dataRes[] = $objQuan;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function PhanTrangQuan()
    {
        $sqlCheck = "SELECT * FROM tb_quan ";
        $resCheck  =  mysqli_query($this->getConn(), $sqlCheck);
        $tong_so_trang = mysqli_num_rows($resCheck);
        $so_trang = ceil($tong_so_trang/5);
        return $so_trang;
    }

    public function LoadPhuong(){
        $start = ($this->page - 1)*5;
        $sql = "SELECT * FROM tb_phuong limit $start,5 ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objPhuong = new stdClass();
            foreach($row as $field_name =>$value)
                $objPhuong->$field_name = $value;
            $dataRes[] = $objPhuong;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function LoadAllPhuong(){
        $sql = "SELECT * FROM tb_phuong ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objPhuong = new stdClass();
            foreach($row as $field_name =>$value)
                $objPhuong->$field_name = $value;
            $dataRes[] = $objPhuong;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function PhanTrangPhuong()
    {
        $sqlCheck = "SELECT * FROM tb_phuong ";
        $resCheck  =  mysqli_query($this->getConn(), $sqlCheck);
        $tong_so_trang = mysqli_num_rows($resCheck);
        $so_trang = ceil($tong_so_trang/5);
        return $so_trang;
    }

    public function SaveNewCty()
    {
        $sql = "INSERT INTO $this->tb_name(ten_cong_ty,ten_dai_dien,sdt_nguoi_dai_dien,sdt_cong_ty,email,id_tai_khoan,id_phuong,id_quan,id_tinh)
                VALUES ('$this->ten_cong_ty','$this->ten_dai_dien','$this->sdt_nguoi_dai_dien','$this->sdt_cong_ty','$this->email','$this->id_tai_khoan','$this->id_phuong','$this->id_quan','$this->id_tinh')";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $new_id  = mysqli_insert_id($this->getConn());

        return $new_id;
    }

    public function DeleteCty()
    {
        $sql1 = "DELETE from tb_bai_viet where id = '$this->id'";
        $res1  =  mysqli_query($this->getConn(), $sql1);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $sql2 = "DELETE from $this->tb_name where id = '$this->id'";        
        $res2  =  mysqli_query($this->getConn(), $sql2);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        return $this->id;
    }

    public function SaveNewTinh()
    {
        $sql = "INSERT INTO tb_tinh(ten_tinh) VALUES('$this->ten_tinh')";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $new_id  = mysqli_insert_id($this->getConn());

        return $new_id;
    }

    public function SaveNewQuan()
    {
        $sql = "INSERT INTO tb_quan(ten_quan) VALUES('$this->ten_quan')";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $new_id  = mysqli_insert_id($this->getConn());

        return $new_id;
    }

    public function SaveNewPhuong()
    {
        $sql = "INSERT INTO tb_phuong(ten_phuong) VALUES('$this->ten_phuong')";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $new_id  = mysqli_insert_id($this->getConn());

        return $new_id;
    }

    public function Load1Tinh(){
        $sql = "SELECT * FROM tb_tinh WHERE id = '$this->id'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);
        return $row;
    }

    public function Load1Quan(){
        $sql = "SELECT * FROM tb_quan WHERE id = '$this->id'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);
        return $row;
    }

    public function Load1Phuong(){
        $sql = "SELECT * FROM tb_phuong WHERE id = '$this->id'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
       $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);
        return $row;
    }

    public function EditTinh()
    {
        $sql = "UPDATE tb_tinh
                SET ten_tinh = '$this->ten_tinh'
                WHERE id = '$this->id'";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        return $this->id;
    }

    public function EditQuan()
    {
        $sql = "UPDATE tb_quan
                SET ten_quan = '$this->ten_quan'
                WHERE id = '$this->id'";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        return $this->id;
    }

    public function EditPhuong()
    {
        $sql = "UPDATE tb_phuong
                SET ten_phuong = '$this->ten_phuong'
                WHERE id = '$this->id'";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        return $this->id;
    }

    public function DeleteTinh()
    {
        $sql = "DELETE from tb_tinh where id = '$this->id'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        return $this->id;
    }

    public function DeleteQuan()
    {
        $sql = "DELETE from tb_quan where id = '$this->id'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        return $this->id;
    }

    public function DeletePhuong()
    {
        $sql = "DELETE from tb_phuong where id = '$this->id'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        return $this->id;
    }

    public function Search(){

        $strWhere = '';
        if (isset($this->ten_xe))
            $strWhere.= " ten_xe = '$this->ten_xe'";
        if (isset($this->hinh_anh)){
            if ($strWhere!= '')
                $strWhere.=",hinh_anh = '$this->hinh_anh'";
            else
                $strWhere.="hinh_anh = '$this->hinh_anh'";


        }

        if (isset($this->gia_thue_moi)){
            if ($strWhere!= '')
                $strWhere.=",gia_thue_moi = '$this->gia_thue_moi'";
            else
                $strWhere.="gia_thue_moi = '$this->gia_thue_moi'";


        }
        if (isset($this->gia_thue_cu)){
            if ($strWhere!= '')
                $strWhere.=",gia_thue_cu = '$this->gia_thue_cu'";
            else
                $strWhere.="gia_thue_cu = '$this->gia_thue_cu'";


        }
        if (isset($this->doi_xe)){
            if ($strWhere!= '')
                $strWhere.=",doi_xe = '$this->doi_xe'";
            else
                $strWhere.="doi_xe = '$this->doi_xe'";


        }
        if (isset($this->loai_xe)){
            if ($strWhere!= '')
                $strWhere.=",loai_xe = '$this->loai_xe'";
            else
                $strWhere.="loai_xe = '$this->loai_xe'";


        }
        if (isset($this->mau_xe)){
            if ($strWhere!= '')
                $strWhere.=",mau_xe = '$this->mau_xe'";
            else
                $strWhere.="mau_xe = '$this->mau_xe'";


        }
        if (isset($this->id_nsx)){
            if ($strWhere!= '')
                $strWhere.=",id_nsx = '$this->id_nsx'";
            else
                $strWhere.="id_nsx = '$this->id_nsx'";


        }
        if (isset($this->so_ghe)){
            if ($strWhere!= '')
                $strWhere.=",so_ghe = '$this->so_ghe'";
            else
                $strWhere.="so_ghe = '$this->so_ghe'";


        }
        if (isset($this->bien_so)){
            if ($strWhere!= '')
                $strWhere.=",bien_so = '$this->bien_so'";
            else
                $strWhere.="bien_so = '$this->bien_so'";


        }
        if (isset($this->van_toc)){
            if ($strWhere!= '')
                $strWhere.=",van_toc = '$this->van_toc'";
            else
                $strWhere.="van_toc = '$this->van_toc'";


        }
        if (isset($this->gioi_thieu_xe)){
            if ($strWhere!= '')
                $strWhere.=",gioi_thieu_xe = '$this->gioi_thieu_xe'";
            else
                $strWhere.="gioi_thieu_xe = '$this->gioi_thieu_xe'";


        }




        $sql = "UPDATE $this->tb_name SET {$strWhere} WHERE $this->tb_name.id = $this->id";
        //echo $sql;

        $res = mysqli_query($this->getConn(),$sql);

        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        return $this->id;






    }
}