<?php

class UserModel extends Model{

    public $id_user;
    public $ten_dang_nhap;
    public $passwd;
    public $ho_ten;
    public $dia_chi;
    public $sdt;
    public $email;
    public $gioi_tinh;
    public $cong_viec;
    public $avatar;
    public $nhom_tai_khoan_id;
    public $page;

    protected $tb_name = 'tb_user';

    public function Login(){
        $sql = "SELECT * FROM $this->tb_name WHERE ten_dang_nhap = '$this->ten_dang_nhap'";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));
        if(mysqli_num_rows($res) != 1){
            return "Khong xac dinh tai khoan: $this->ten_dang_nhap.";
        }
        $row = mysqli_fetch_assoc($res);
        if($row['passwd'] != $this->passwd){
            return "Sai password!";
        }
        $obj = new stdClass();
        foreach($row as $field=>$value){
            $obj->$field = $value;
        }
        return $obj;
    }
    
    public function LoadOne(){
        $sql = "SELECT * FROM $this->tb_name WHERE id_user = $this->id_user";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        return $row;
    }

    public function LoadList(){        
        $sql = "SELECT * FROM $this->tb_name ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objUser = new stdClass();
            foreach($row as $field_name =>$value)
                $objUser->$field_name = $value;
            $dataRes[] = $objUser;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function LoadListAdmin(){        
        $start = ($this->page - 1)*5;
        $sql = "SELECT * FROM $this->tb_name LIMIT $start,5 ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objUser = new stdClass();
            foreach($row as $field_name =>$value)
                $objUser->$field_name = $value;
            $dataRes[] = $objUser;
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

    public function ChangePassword(){

        $sql = "UPDATE $this->tb_name SET passwd = $this->passwd WHERE id_user = $this->id_user";

        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));
    }

    public function SaveNewUser()
    {
        $sql = "INSERT INTO $this->tb_name(ten_dang_nhap,passwd,ho_ten,dia_chi,so_dien_thoai,email,gioi_tinh,cong_viec,nhom_tai_khoan_id)
                VALUES ('$this->ten_dang_nhap','$this->passwd','$this->ho_ten','$this->dia_chi','$this->so_dien_thoai','$this->email','$this->gioi_tinh','$this->cong_viec','$this->nhom_tai_khoan_id')";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $new_id  = mysqli_insert_id($this->getConn());

        return $new_id;
    }

    public function EditUser()
    {
        $sql = "UPDATE $this->tb_name
                SET passwd = '$this->passwd',dia_chi = '$this->dia_chi',so_dien_thoai = '$this->so_dien_thoai',gioi_tinh = '$this->gioi_tinh',cong_viec = '$this->cong_viec',nhom_tai_khoan_id = '$this->nhom_tai_khoan_id'
                WHERE id_user = '$this->id_user'";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        return $this->id_user;
    }

    public function DeleteUser()
    {
        $sql = "DELETE from $this->tb_name where id_user = '$this->id_user'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        return $this->id_user;
    }
}