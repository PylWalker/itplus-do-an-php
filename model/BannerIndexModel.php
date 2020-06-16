<?php

class BannerIndexModel extends Model{

    public $id_banner;
    public $link_banner;
    public $link_banner_small;
    public $trang_thai;
    public $title;

    protected $tb_name = 'tb_banner_index';

    public function LoadBannerIndex(){

        $sql = "SELECT * FROM $this->tb_name WHERE trang_thai = 1";
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