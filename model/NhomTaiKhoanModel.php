<?php

class NhomTaiKhoanModel extends Model
{
	public $id;
	public $ten_nhom;

	public $tb_name = 'tb_nhom_tai_khoan';

	public function LoadList(){
        $sql = "SELECT * FROM $this->tb_name  ";
        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());
        $dataRes = array();
        while($row = mysqli_fetch_assoc($res)){
            $objNTK = new stdClass();
            foreach($row as $field_name =>$value)
                $objNTK->$field_name = $value;
            $dataRes[] = $objNTK;
        }
        mysqli_free_result($res);
        return $dataRes;
    }

    public function SaveNewNTK()
    {
        $sql = "INSERT INTO $this->tb_name(ten_nhom)
                VALUES ('$this->ten_nhom')";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        $new_id  = mysqli_insert_id($this->getConn());

        return $new_id;
    }

    public function LoadOne(){
        $sql = "SELECT * FROM $this->tb_name WHERE id = $this->id";
        $res = mysqli_query($this->getConn(),$sql);
        if (mysqli_errno($this->getConn()))
            return('Loi ket noi CSDL'.mysqli_error($this->getConn()));

        $row = mysqli_fetch_assoc($res);

        return $row;
    }

    public function EditNTK()
    {
        $sql = "UPDATE $this->tb_name
                SET ten_nhom = '$this->ten_nhom'
                WHERE id = '$this->id'";

        $res  =  mysqli_query($this->getConn(), $sql);
        if(mysqli_errno($this->getConn())!=0)
            return "Loi truy van CSDL: ". mysqli_error($this->getConn());

        return $this->id;
    }

    public function DeleteNTK()
    {
//         $sql1 = "DELETE from tb_reply_cong_ty
// where tb_reply_cong_ty.id_comment in(select tb_binh_luan_cong_ty.id from tb_binh_luan_cong_ty
// where tb_binh_luan_cong_ty.id_user in (select uid.id_user from tb_user as uid
// inner join tb_nhom_tai_khoan on tb_nhom_tai_khoan.id = uid.nhom_tai_khoan_id
// where tb_nhom_tai_khoan.id = 1))";
//         $res = mysqli_query($this->getConn(),$sql1);

//         $sql2 = "DELETE from tb_binh_luan_cong_ty
// where tb_binh_luan_cong_ty.id_user in (select uid.id_user from tb_user as uid
// inner join tb_nhom_tai_khoan on tb_nhom_tai_khoan.id = uid.nhom_tai_khoan_id
// where tb_nhom_tai_khoan.id = 1)";
//         $res = mysqli_query($this->getConn(),$sql2);
        
//         $sql3 = "DELETE from tb_reply_xe
// where tb_reply_xe.id_user_reply in (select uid.id_user from tb_user as uid
// inner join tb_nhom_tai_khoan on tb_nhom_tai_khoan.id = uid.nhom_tai_khoan_id
// where tb_nhom_tai_khoan.id = 1)";
//         $res  =  mysqli_query($this->getConn(), $sql3);

//         $sql4 = "DELETE from tb_binh_luan_xe
// where tb_binh_luan_xe.id_user in (select uid.id_user from tb_user as uid
// inner join tb_nhom_tai_khoan on tb_nhom_tai_khoan.id = uid.nhom_tai_khoan_id
// where tb_nhom_tai_khoan.id = 1)";
//         $res  =  mysqli_query($this->getConn(), $sql4);

//         $sql5 = "DELETE from tb_bai_viet
// where tb_bai_viet.id_user in (select uid.id_user from tb_user as uid
// inner join tb_nhom_tai_khoan on tb_nhom_tai_khoan.id = uid.nhom_tai_khoan_id
// where tb_nhom_tai_khoan.id = 1)";
//         $res  =  mysqli_query($this->getConn(), $sql5);
        
//         if(mysqli_errno($this->getConn())!=0)
//             return "Loi truy van CSDL: ". mysqli_error($this->getConn());
//         return $this->id;
    }
}