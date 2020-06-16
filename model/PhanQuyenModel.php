<?php

class PhanQuyenModel extends Model
{
	public $id_ntk;
	public $id_chuc_nang;
	public $trang_thai;

	public $tb_name = 'tb_phan_quyen';

	public function LoadList(){
        $sql = "SELECT tb_phan_quyen.*,tb_nhom_tai_khoan.ten_nhom,tb_chuc_nang.ten_chuc_nang
                from tb_phan_quyen
                inner join tb_nhom_tai_khoan on tb_nhom_tai_khoan.id = tb_phan_quyen.id_ntk
                inner join tb_chuc_nang on tb_chuc_nang.id = tb_phan_quyen.id_chuc_nang";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objPQ = new stdClass();
            foreach($row as $field_name =>$value)
                $objPQ->$field_name = $value;
            $dataRes[] = $objPQ;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function LoadNTK(){
        $sql = "SELECT * from tb_nhom_tai_khoan ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objPQ = new stdClass();
            foreach($row as $field_name =>$value)
                $objPQ->$field_name = $value;
            $dataRes[] = $objPQ;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function LoadCN(){
        $sql = "SELECT * from tb_chuc_nang ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objPQ = new stdClass();
            foreach($row as $field_name =>$value)
                $objPQ->$field_name = $value;
            $dataRes[] = $objPQ;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function LoadOne(){
        $sql = "SELECT * FROM $this->tb_name WHERE id_ntk = $this->id_ntk";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        return $row;
    }

    public function LoadOneNTK(){
        $sql = "SELECT * FROM tb_nhom_tai_khoan WHERE id = $this->id_ntk";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        return $row;
    }

    public function LoadOneCN(){
        $sql = "SELECT * FROM tb_chuc_nang WHERE id = $this->id_chuc_nang";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        return $row;
    }

    public function EditPQ()
    {
        $sql = "UPDATE $this->tb_name
                SET id_ntk = '$this->id_ntk',id_chuc_nang = '$this->id_chuc_nang',trang_thai = '$this->trang_thai'
                WHERE id_ntk = '$this->id_ntk'";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        return $this->id_ntk;
    }

    public function DeletePQ()
    {
        $sql = "DELETE from $this->tb_name where id_ntk = '$this->id_ntk' and id_chuc_nang = '$this->id_chuc_nang'";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        return $this->id_ntk;
    }

    public function SaveNewPQ()
    {
        $sql = "INSERT INTO $this->tb_name(id_ntk,id_chuc_nang,trang_thai)
                VALUES ('$this->id_ntk','$this->id_chuc_nang','$this->trang_thai')";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $new_id  = mysqli_insert_id($this->getConn());

        return $new_id;
    }
}