<?php

class BaiVietModel extends Model{

    public $id;
    public $id_bv;
    public $ten_bv;
    public $noi_dung;
    public $hinh_anh;
    public $ngay_dang;
    public $trang_thai;
    public $tom_tat;
    public $luot_xem;
    public $id_nguoi_kiem_duyet;
    public $id_user;
    public $id_cong_ty;
    public $offset;
    public $page;

    protected $tb_name = 'tb_bai_viet';

    public function LoadBaiVietIndex(){
        $sql = "SELECT * FROM $this->tb_name ORDER BY tb_bai_viet.luot_xem DESC LIMIT 4 ";
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
    public function LoadOne(){
        $sql = "SELECT tb_bai_viet.*,tb_user.ho_ten FROM $this->tb_name 
        INNER JOIN tb_user ON tb_user.id_user = $this->tb_name.id_user
        WHERE id = $this->id_bv AND id_cong_ty = $this->id_cong_ty";

        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);
        return $row;




    }
    public function LoadBaiVietMoi(){
        $sql = "SELECT tb_bai_viet.*,tb_user.ho_ten FROM tb_bai_viet
                INNER JOIN tb_user ON tb_user.id_user = tb_bai_viet.id_user
                ORDER BY tb_bai_viet.ngay_dang DESC LIMIT 9";
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

        $sql  = "SELECT tb_bai_viet.*,tb_user.ho_ten FROM tb_bai_viet 
                 INNER JOIN tb_user ON tb_user.id_user = tb_bai_viet.id_user 
                 WHERE id_cong_ty = $this->id_cong_ty";

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
        $sql = "SELECT * FROM $this->tb_name limit $start,5 ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objBV = new stdClass();
            foreach($row as $field_name =>$value)
                $objBV->$field_name = $value;
            $dataRes[] = $objBV;
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

    public function Update(){

        $strWhere = '';
        if (isset($this->ten_bv))
            $strWhere.="ten_bv = '$this->ten_bv'";


        if (isset($this->tom_tat)){
            if ($strWhere!= '')
                $strWhere.=",tom_tat = '$this->tom_tat'";
            else
                $strWhere.="tom_tat = '$this->tom_tat'";


        }
        if (isset($this->hinh_anh)){
            if ($strWhere!= '')
                $strWhere.=",hinh_anh = '$this->hinh_anh'";
            else
                $strWhere.="hinh_anh = '$this->hinh_anh'";


        }
        if (isset($this->noi_dung)){
            if ($strWhere!= '')
                $strWhere.=",noi_dung = '$this->noi_dung'";
            else
                $strWhere.="noi_dung = '$this->noi_dung'";


        }




        $sql = "UPDATE $this->tb_name SET {$strWhere} WHERE $this->tb_name.id = $this->id";


        $res = mysqli_query($this->getConn(),$sql);

        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));


        return $this->id;



    }
    public function LoadOneBaiViet(){

        $sql = "SELECT * FROM $this->tb_name WHERE $this->tb_name.id = $this->id_bv";

        $res = mysqli_query($this->getConn(),$sql);

        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));


        $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);

        return $row;


    }

    public function LoadBV(){
        $sql = "SELECT * FROM $this->tb_name WHERE id = $this->id ";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        return $row;
    }

    public function DeleteBV()
    {
        $sql = "DELETE from $this->tb_name where id = '$this->id'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        return $this->id;
    }


}