<?php

class ReplyXeModel extends Model
{

    public $id;
    public $noi_dung_reply;
    public $id_user;
    public $id_comment;
    public $ngay_dang;


    protected $tb_name = 'tb_reply_xe';


    public function LoadList()
    {


        $sql = "SELECT tb_reply_xe.*,tb_user.avatar,tb_user.ho_ten FROM $this->tb_name
        INNER JOIN tb_user ON tb_user.id_user = $this->tb_name.id_user_reply";
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
}
