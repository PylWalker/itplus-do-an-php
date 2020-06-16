<?php

class GalleryModel extends Model{


    public $id;
    public $link_anh;
    public $id_car;

    protected $tb_name = 'tb_gallery';





    public function LoadList(){

        $sql = "SELECT * FROM $this->tb_name WHERE id_xe = $this->id_car";
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