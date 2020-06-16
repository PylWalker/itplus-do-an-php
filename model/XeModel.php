<?php


class XeModel extends Model{

    public $id;
    public $id_xe;
    public $ten_xe;
    public $mau_xe;
    public $so_ghe;
    public $van_toc;
    public $doi_xe;
    public $bien_so;
    public $hinh_anh;
    public $loai_xe;
    public $trang_thai_hien_thi;
    public $so_lan_thue;

    public $id_nsx;
    public $id_cong_ty;
    public $gioi_thieu_xe;
    public $gia_thue_cu;
    public $gia_thue_moi;
    public $file_name;
    public $file_type;
    public $file_tmp_name;
    public $file_size;
    public $file_error;
    public $page;

    protected $tb_name = 'tb_xe';


    public function LoadListCarIndex(){

        $sql = "SELECT * FROM $this->tb_name ORDER BY tb_xe.so_lan_thue DESC LIMIT 6 ";
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
    public function LoadTheLoaiXe(){
        $sql = "SELECT tb_xe.*,tb_cong_ty.ten_cong_ty,tb_the_loai_xe.ten FROM tb_xe
                INNER JOIN tb_cong_ty ON tb_cong_ty.id = tb_xe.id_cong_ty
                INNER JOIN tb_the_loai_xe ON tb_the_loai_xe.id = tb_xe.loai_xe
                WHERE tb_xe.id_cong_ty = $this->id_cong_ty AND tb_xe.loai_xe = $this->loai_xe";
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
        $sql = "SELECT * FROM tb_nha_san_xuat  ";
                
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
        public function LoadTLX(){
        $sql = "SELECT * FROM tb_the_loai_xe  ";
                
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

        $sql = "SELECT tb_xe.*,tb_cong_ty.ten_cong_ty,tb_the_loai_xe.ten FROM tb_xe
                INNER JOIN tb_cong_ty ON tb_cong_ty.id = tb_xe.id_cong_ty
                INNER JOIN tb_the_loai_xe ON tb_the_loai_xe.id = tb_xe.loai_xe
                WHERE tb_xe.id_cong_ty = $this->id_cong_ty";
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
        $sql = "SELECT $this->tb_name.*,tb_nha_san_xuat.ten_nsx,tb_the_loai_xe.ten FROM $this->tb_name
                INNER JOIN tb_nha_san_xuat on tb_nha_san_xuat.id = $this->tb_name.id_nsx
                INNER JOIN tb_the_loai_xe on tb_the_loai_xe.id = $this->tb_name.loai_xe
                ORDER BY $this->tb_name.id
                LIMIT $start,5";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objXe = new stdClass();
            foreach($row as $field_name =>$value)
                $objXe->$field_name = $value;
            $dataRes[] = $objXe;
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

        $sql = "SELECT tb_xe.*,tb_nha_san_xuat.ten_nsx,tb_the_loai_xe.ten FROM $this->tb_name 
                INNER JOIN tb_nha_san_xuat ON tb_nha_san_xuat.id = tb_xe.id_nsx
                INNER JOIN tb_the_loai_xe ON tb_the_loai_xe.id = tb_xe.loai_xe
                WHERE tb_xe.id = $this->id_xe";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);


        mysqli_free_result($res);
        return $row;










    }
    public function LoadListComment(){


        $sql = "SELECT tb_binh_luan_xe.*,tb_user.ho_ten,tb_user.avatar FROM tb_binh_luan_xe
                INNER JOIN tb_user ON tb_user.id_user = tb_binh_luan_xe.id_user   
                WHERE tb_binh_luan_xe.id_xe = $this->id_xe
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
    public function XuLyUpload(){
        $res = array();

        $array_extension = array('image/gif','image/jpeg','image/png','image/svg+xml'); // mảng các loại file được chấp nhận upload
        $folder_upload = __DIR__.'/../public/assets/img';
        $file_url = '/../project-xe/public/assets/img';

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

        if($file_size >  1090526 ){
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
    public function Delete(){


        $sqlDelete = "DELETE FROM tb_binh_luan_xe WHERE id = $this->id";
        $res = mysqli_query($this->getConn(),$sqlDelete);
        //var_dump($res);

        $sql = "DELETE FROM tb_lien_he_thue_xe WHERE id = $this->id";
        $res = mysqli_query($this->getConn(),$sql);
        //var_dump($res);

        $sql = "DELETE FROM tb_gallery WHERE id = $this->id";
        $res = mysqli_query($this->getConn(),$sql);
        //var_dump($res);



        $sql = "DELETE FROM $this->tb_name WHERE $this->tb_name.id = $this->id";
        //echo $sql;


        $res = mysqli_query($this->getConn(),$sql);
        //var_dump($res);

        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        return $this->id;







    }
    public function AddNew(){

        $dt = new Datetime();

        $newdt = date_format($dt,"Y:m:d");



        $sql = "INSERT INTO tb_xe(ten_xe,mau_xe,so_ghe,van_toc,doi_xe,bien_so,hinh_anh,loai_xe,id_nsx,id_cong_ty,gioi_thieu_xe,gia_thue_moi,ngay_them)
                VALUES ('$this->ten_xe','$this->mau_xe','$this->so_ghe','$this->van_toc','$this->doi_xe','$this->bien_so','$this->hinh_anh','$this->loai_xe','$this->id_nsx',$this->id_cong_ty,'$this->gioi_thieu_xe','$this->gia_thue_moi','$newdt')";

        $res = mysqli_query($this->getConn(),$sql);
        var_dump($res);
        echo $sql;

        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $last_id = mysqli_insert_id($this->getConn());



        return $last_id;







    }
    public function LoadXeDuLich(){

        $sql = "SELECT tb_xe.*,tb_the_loai_xe.ten FROM tb_xe
                INNER JOIN tb_the_loai_xe ON tb_the_loai_xe.id = tb_xe.loai_xe WHERE tb_xe.loai_xe = 1 ORDER BY so_lan_thue DESC LIMIT 8";
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
    public function LoadXeCuoiHoi(){

        $sql = "SELECT tb_xe.*,tb_the_loai_xe.ten FROM tb_xe
                INNER JOIN tb_the_loai_xe ON tb_the_loai_xe.id = tb_xe.loai_xe WHERE tb_xe.loai_xe = 2 ORDER BY so_lan_thue DESC LIMIT 8";
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
    public function LoadXeLeHoi(){

        $sql = "SELECT tb_xe.*,tb_the_loai_xe.ten FROM tb_xe
                INNER JOIN tb_the_loai_xe ON tb_the_loai_xe.id = tb_xe.loai_xe WHERE tb_xe.loai_xe = 4 ORDER BY so_lan_thue DESC LIMIT 8";
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
    public function LoadXeBanTai(){

        $sql = "SELECT tb_xe.*,tb_the_loai_xe.ten FROM tb_xe
                INNER JOIN tb_the_loai_xe ON tb_the_loai_xe.id = tb_xe.loai_xe WHERE tb_xe.loai_xe = 5 ORDER BY so_lan_thue DESC LIMIT 8";
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
    public function CountCar(){
        $strWhere='';


        if (isset($this->id_nsx))
            $strWhere.= "id_nsx = '$this->id_nsx'";

        if (isset($this->loai_xe))
        {
            if ($strWhere!='')
                $strWhere.= " AND loai_xe = $this->loai_xe";
            else
                $strWhere.= " loai_xe = $this->loai_xe";



        }

        if (isset($this->so_ghe))
        {
            if ($strWhere!='')
                $strWhere.= " AND so_ghe = $this->so_ghe";
            else
                $strWhere.= " so_ghe = $this->so_ghe";



        }

        if ($strWhere!='')
            $strWhere = 'WHERE' . $strWhere;
        $sql = "SELECT count(*) FROM $this->tb_name {$strWhere}";
        $res = mysqli_query($this->getConn(),$sql);
        if(mysqli_errno($this->getConn()))
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $row = mysqli_fetch_row ($res); // kết quả res trả về 1 dòng =--> lấy 1 dòng

        return $row[0]; // số lượng bản ghi đếm được
    }
    public function LoadListCar(){
        $strWhere='';


        if (isset($this->id_nsx))
            $strWhere.= "id_nsx = '$this->id_nsx'";

        if (isset($this->loai_xe))
        {
            if ($strWhere!='')
                $strWhere.= " AND loai_xe = $this->loai_xe";
            else
                $strWhere.= " loai_xe = $this->loai_xe";



        }

        if (isset($this->so_ghe))
        {
            if ($strWhere!='')
                $strWhere.= " AND so_ghe = $this->so_ghe";
            else
                $strWhere.= " so_ghe = $this->so_ghe";



        }

        if ($strWhere!='')
            $strWhere = 'WHERE' . $strWhere;
        $limit = '';
        if (isset($this->offset)){
            $limit = ' LIMIT ' . $this->offset . ', '. rows_per_page;


        }



        $sql = "SELECT tb_xe.*,tb_nha_san_xuat.ten_nsx FROM tb_xe
                INNER JOIN tb_nha_san_xuat ON tb_nha_san_xuat.id = tb_xe.id_nsx 
                {$strWhere} {$limit}";
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

    public function SaveNewXe()
    {
        $sql = "INSERT INTO $this->tb_name(id_cong_ty,id_nsx,ten_xe,mau_xe,so_ghe,gia_thue_moi,van_toc,doi_xe,bien_so,loai_xe)
                VALUES ('$this->id_cong_ty','$this->id_nsx','$this->ten_xe','$this->mau_xe','$this->so_ghe','$this->gia_thue_moi','$this->van_toc','$this->doi_xe','$this->bien_so','$this->loai_xe')";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $new_id  = mysqli_insert_id($this->getConn());

        return $new_id;
    }

    public function LoadOneAdmin(){
        $sql = "SELECT *,tb_the_loai_xe.ten,tb_nha_san_xuat.ten_nsx FROM $this->tb_name
INNER JOIN tb_nha_san_xuat on tb_nha_san_xuat.id = $this->tb_name.id_nsx
INNER JOIN tb_the_loai_xe on tb_the_loai_xe.id = $this->tb_name.loai_xe
WHERE $this->tb_name.id = '$this->id'";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        return $row;
    }





}