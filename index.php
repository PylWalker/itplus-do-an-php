<?php
date_default_timezone_set('Asia/Ho_Chi_Minh');
ini_set('error_reporting', E_ALL);
error_reporting(E_ALL);
define('app_path', __DIR__);
define('controller_path', app_path.'/controller');
define('model_path', app_path.'/model');
define('layout_path', app_path.'/view/layout');
define('base_path', '/chien_dich_mail/chien_dich_mail');
define('rows_per_page',20);

session_start();

require_once 'config/database.php';

require 'core/autoload.php';
$objMVC = new AppMVC();
$objMVC->run();