<?php

class NhaSanXuatModel extends Model{


    public $id_nsx;
    public $ten_nsx;


    protected $tb_name = 'tb_nha_san_xuat';


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








}