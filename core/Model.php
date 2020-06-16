<?php
class Model{
    private  $conn = null;


    public function getConn()
    {
        global  $config_app;

        if ($this->conn == null){
            //lam cong viec ket noi CSDL
            $this->conn = mysqli_connect($config_app['database']['host'],$config_app['database']['user'],$config_app['database']['passwd'])
                or die('Loi ket noi CSDL');

            mysqli_select_db($this->conn,$config_app['database']['dbname']) or die('Loi chon DB');

            mysqli_set_charset($this->conn,'utf8');


        }
        return $this->conn;
    }

    public function __destruct()
    {
        if ($this->conn!= null)
            mysqli_close($this->conn);
    }
}