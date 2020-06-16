<?php

class ThueXeModel extends Model{

    public $id_order;
    public $ngay_guil;
    public $noi_dung;
    public $trang_thai;
    public $id_cong_ty;
    public $id_xe;
    public $id_user;

    protected $tb_name = 'tb_lien_he_thue_xe';


    public function LoadList(){

        $sql = "SELECT $this->tb_name.*,tb_user.ho_ten,tb_xe.ten_xe FROM $this->tb_name
                INNER JOIN tb_user ON tb_user.id_user = $this->tb_name.id_user
                INNER JOIN tb_xe ON tb_xe.id = $this->tb_name.id_xe
                WHERE $this->tb_name.id_cong_ty = $this->id_cong_ty";
        $res = mysqli_query($this->getConn(), $sql);
        if (mysqli_errno($this->getConn()))
            return ("Loi ket noi CSDL" . mysqli_error($this->getConn()));

        $dataRes = array();

        while ($row = mysqli_fetch_assoc($res)) {

            $dataRes[] = $row;

        }

        mysqli_free_result($res);
        return $dataRes;








    }
    public function LoadOne(){

        $sql = "SELECT $this->tb_name.*,tb_xe.hinh_anh,tb_xe.ten_xe,tb_xe.gia_thue_moi,tb_user.ho_ten,tb_user.so_dien_thoai,tb_user.dia_chi,tb_user.email,tb_user.cong_viec
                FROM $this->tb_name
                INNER JOIN tb_xe ON tb_xe.id = $this->tb_name.id_xe
                INNER JOIN tb_user ON tb_user.id_user = $this->tb_name.id_user
                WHERE $this->tb_name.id = $this->id_order";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        mysqli_free_result($res);
        return $row;







    }
    public function Delete(){
        $sql = "DELETE FROM $this->tb_name WHERE $this->tb_name.id = $this->id_order";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));




    }
    public function AddNew(){
        $dt = new DateTime();
        $time = $dt->format('Y-m-d');
        $sql = "INSERT INTO $this->tb_name(ngay_gui,noi_dung,id_cong_ty,id_xe,id_user)
                VALUES ('$time','$this->noi_dung',$this->id_cong_ty,$this->id_xe,$this->id_user)";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return("Loi ket noi CSDL".mysqli_error($this->getConn()));

        $last_id = mysqli_insert_id($this->getConn());



        return $last_id;








    }







}