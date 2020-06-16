<?php
class AdminUserController extends Controller{
    public function indexAction(){

    }
 	
 	public function DanhSachTaiKhoanAction(){ 		
 		$objModelUser = new UserModel();
 		$so_trang = $objModelUser->PhanTrang();
 		$this->view->so_trang = $so_trang;
 		if(isset($_GET['page']))
 		{
 			if($_GET['page']>$this->view->so_trang)
 				$objModelUser->page = $this->view->so_trang;
 				else if($_GET['page']<1)
 					$objModelUser->page = 1;
 					else 
 						$objModelUser->page = $_GET['page'];
 		}
 			else
 			{
 				$objModelUser->page = 1;
 			}
 		$listUser = $objModelUser->LoadListAdmin();
 		$this->view->listUser = $listUser;
 	}

	public function SuaTaiKhoanAction(){			
		$objModelUser = new UserModel();
		$objModelUser->id_user = $_GET['id_user'];
		$userDetail = $objModelUser->LoadOne();
		$this->view->userDetail = $userDetail;
		if(isset($_POST['sua_tai_khoan'])){
            $objModelUser->passwd = $_POST['passwd'];
            $objModelUser->dia_chi = $_POST['dia_chi'];
            $objModelUser->so_dien_thoai = $_POST['so_dien_thoai'];
            $objModelUser->gioi_tinh = $_POST['gioi_tinh'];
            $objModelUser->cong_viec = $_POST['cong_viec'];
            $objModelUser->nhom_tai_khoan_id = $_POST['nhom_tai_khoan_id'];
            $res = $objModelUser->EditUser();
            $this->view->res = $res;
        }
 	}

 	public function ThemTaiKhoanAction(){
 		if(isset($_POST['ten_dang_nhap'])&&$_POST['ten_dang_nhap']!="")
    	{
            $objModelTK = new UserModel();
            $objModelTK->ten_dang_nhap = $_POST['ten_dang_nhap'];
            $objModelTK->passwd = $_POST['passwd'];
            $objModelTK->ho_ten = $_POST['ho_ten'];
            $objModelTK->dia_chi = $_POST['dia_chi'];
            $objModelTK->so_dien_thoai = $_POST['so_dien_thoai'];
            $objModelTK->email = $_POST['email'];
            $objModelTK->gioi_tinh = $_POST['gioi_tinh'];
            $objModelTK->cong_viec = $_POST['cong_viec'];
            $objModelTK->avatar = $_POST['avatar'];
            $objModelTK->nhom_tai_khoan_id = $_POST['nhom_tai_khoan_id'];
            $res = $objModelTK->SaveNewUser();
            $this->view->res = $res;
    	}
 	}

	 	public function XoaTaiKhoanAction(){
	 		if(isset($_GET['id_user']))
	 		{
	 			$objModelTK = new UserModel();
	 			$objModelTK->id_user = $_GET['id_user'];
	 			$res = $objModelTK->DeleteUser();
	 			$this->view->res = $res;
	 		}
	 	}

 	public function DanhSachNhomTaiKhoanAction(){
 		$objModelNTK = new NhomTaiKhoanModel();
 		$listNTK = $objModelNTK->LoadList();
 		$this->view->listNTK = $listNTK;
 	}

	 	public function ThemNhomTaiKhoanAction(){
	 		if(isset($_POST['ten_nhom']))
	 		{
	 			$objModelNTK = new NhomTaiKhoanModel();
	 			$objModelNTK->ten_nhom = $_POST['ten_nhom'];
	 			$res = $objModelNTK->SaveNewNTK();
	 			$this->view->res = $res;
	 		}
	 	}

	 	public function SuaNhomTaiKhoanAction(){
	 		$objModelNTK = new NhomTaiKhoanModel();
			$objModelNTK->id = $_GET['id'];
			$ntkDetail = $objModelNTK->LoadOne();
			$this->view->ntkDetail = $ntkDetail;
			if(isset($_POST['ten_nhom'])){
	            $objModelNTK->ten_nhom = $_POST['ten_nhom'];
	            $res = $objModelNTK->EditNTK();
	            $this->view->res = $res;
	        }
	 	}

	 	public function XoaNhomTaiKhoanAction(){
	 		if(isset($_GET['id']))
	 		{
	 			$objModelNTK = new NhomTaiKhoanModel();
	 			$objModelNTK->id = $_GET['id'];
	 			$res = $objModelNTK->DeleteNTK();
	 			$this->view->res = $res;
	 		}
	 	}

 	public function PhanQuyenAction(){
 		$objModelPQ = new PhanQuyenModel();
 		$listPQ = $objModelPQ->LoadList();
 		$this->view->listPQ = $listPQ;
 	}

	 	public function ThemPhanQuyenAction(){
	 		$objModelPQ = new PhanQuyenModel();
	 		$selectNTK = $objModelPQ->LoadNTK();
	 		$this->view->selectNTK = $selectNTK;
	 		$selectCN = $objModelPQ->LoadCN();
	 		$this->view->selectCN = $selectCN;
	 		if(isset($_POST['id_ntk']))
	 		{
	 			$objModelPQ->id_ntk = $_POST['id_ntk'];
	 			$objModelPQ->id_chuc_nang = $_POST['id_chuc_nang'];
	 			$objModelPQ->trang_thai = $_POST['trang_thai'];
	 			$res = $objModelPQ->SaveNewPQ();
	 			$this->view->res = $res;
	 		}
	 	}
	 	public function SuaPhanQuyenAction(){
	 		$objModelPQ = new PhanQuyenModel();
			$objModelPQ->id_ntk = $_GET['id_ntk'];
			$objModelPQ->id_chuc_nang = $_GET['id_chuc_nang'];
			$selectedNTK = $objModelPQ->LoadOneNTK();
	 		$this->view->selectedNTK = $selectedNTK;
	 		$selectedCN = $objModelPQ->LoadOneCN();
	 		$this->view->selectedCN = $selectedCN;
	 		$selectedPQ = $objModelPQ->LoadOne();
	 		$this->view->selectedPQ = $selectedPQ;
	 		$selectNTK = $objModelPQ->LoadNTK();
	 		$this->view->selectNTK = $selectNTK;
	 		$selectCN = $objModelPQ->LoadCN();
	 		$this->view->selectCN = $selectCN;
			if(isset($_POST['id_chuc_nang'])){
	            $objModelPQ->id_ntk = $_POST['id_ntk'];
	            $objModelPQ->id_chuc_nang = $_POST['id_chuc_nang'];
	            $objModelPQ->trang_thai = $_POST['trang_thai'];
	            $res = $objModelPQ->EditPQ();
	            $this->view->res = $res;
	        }
	 	}
	 	public function XoaPhanQuyenAction(){
	 		if(isset($_GET['id_ntk']))
	 		{
	 			$objModelPQ = new PhanQuyenModel();
	 			$objModelPQ->id_ntk = $_GET['id_ntk'];
	 			$objModelPQ->id_chuc_nang = $_GET['id_chuc_nang'];
	 			$res = $objModelPQ->DeletePQ();
	 			$this->view->res = $res;
	 		}
	 	}


 	public function QuanLyCongTyAction(){
 		$objModelCompany = new CompanyModel();
 		$so_trang = $objModelCompany->PhanTrang();
 		$this->view->so_trang = $so_trang;
 		if(isset($_GET['page']))
 		{
 			if($_GET['page']>$this->view->so_trang)
 				$objModelCompany->page = $this->view->so_trang;
 				else if($_GET['page']<1)
 					$objModelCompany->page = 1;
 					else 
 						$objModelCompany->page = $_GET['page'];
 		}
 			else
 			{
 				$objModelCompany->page = 1;
 			}		
 		$listCompany = $objModelCompany->LoadListAdmin();
 		$this->view->listCompany = $listCompany;
	}

		public function ThemCongTyAction(){
	 		$objModelCompany = new CompanyModel();
 			$listTinh = $objModelCompany->LoadAllTinh();
 			$this->view->listTinh = $listTinh;
 			$listQuan = $objModelCompany->LoadAllQuan();
 			$this->view->listQuan = $listQuan;
 			$listPhuong = $objModelCompany->LoadAllPhuong();
 			$this->view->listPhuong = $listPhuong;
 			if(isset($_POST['ten_cong_ty'])&&$_POST['ten_cong_ty']!="")
        	{
	            $objModelCompany->ten_cong_ty = $_POST['ten_cong_ty'];
	            $objModelCompany->ten_dai_dien = $_POST['ten_dai_dien'];
	            $objModelCompany->sdt_nguoi_dai_dien = $_POST['sdt_nguoi_dai_dien'];
	            $objModelCompany->sdt_cong_ty = $_POST['sdt_cong_ty'];
	            $objModelCompany->email = $_POST['email'];
	            $objModelCompany->id_tai_khoan = $_POST['id_tai_khoan'];
	            $objModelCompany->id_phuong = $_POST['id_phuong'];
	            $objModelCompany->id_quan = $_POST['id_quan'];
	            $objModelCompany->id_tinh = $_POST['id_tinh'];	            
	            $res = $objModelCompany->SaveNewCty();
	            $this->view->res = $res;
        	}
	 	}

	 	public function SuaCongTyAction(){
	 		$objModelCompany = new CompanyModel();
			$objModelCompany->id = $_GET['id'];
			$companyDetail = $objModelCompany->LoadOne();
			$this->view->companyDetail = $companyDetail;
			$listTinh = $objModelCompany->LoadTinh();
 			$this->view->listTinh = $listTinh;
 			$listQuan = $objModelCompany->LoadQuan();
 			$this->view->listQuan = $listQuan;
 			$listPhuong = $objModelCompany->LoadPhuong();
 			$this->view->listPhuong = $listPhuong;
			if(isset($_POST['ten_cong_ty'])){
	            $objModelCompany->ten_cong_ty = $_POST['ten_cong_ty'];
	            $objModelCompany->ten_dai_dien = $_POST['ten_dai_dien'];
	            $objModelCompany->sdt_nguoi_dai_dien = $_POST['sdt_nguoi_dai_dien'];
	            $objModelCompany->sdt_cong_ty = $_POST['sdt_cong_ty'];
	            //$objModelCompany->email = $_POST['email'];
	            $objModelCompany->id_tai_khoan = $_POST['id_tai_khoan'];
	            $objModelCompany->id_phuong = $_POST['id_phuong'];
	            $objModelCompany->id_quan = $_POST['id_quan'];
	            $objModelCompany->id_tinh = $_POST['id_tinh'];
	            $res = $objModelCompany->Update();
	            $this->view->res = $res;
	        }
	 	}

	 	public function XoaCongTyAction(){
	 		if(isset($_GET['id']))
	 		{
	 			$objModelCompany = new CompanyModel();
	 			$objModelCompany->id = $_GET['id'];
	 			$res = $objModelCompany->DeleteCty();
	 			$this->view->res = $res;
	 		}
	 	}

	public function QuanLyXeAction(){
		$objModelXe = new XeModel();
 		$so_trang = $objModelXe->PhanTrang();
 		$this->view->so_trang = $so_trang;
 		if(isset($_GET['page']))
 		{
 			if($_GET['page']>$this->view->so_trang)
 				$objModelXe->page = $this->view->so_trang;
 				else if($_GET['page']<1)
 					$objModelXe->page = 1;
 					else
 						$objModelXe->page = $_GET['page'];
 		}
 			else
 			{
 				$objModelXe->page = 1;
 			}		
 		$listXe = $objModelXe->LoadListAdmin();
 		$this->view->listXe = $listXe;
	}
 		public function ThemXeAction(){
 			$objModelXe = new XeModel();
 			$listTheLoaiXe = $objModelXe->LoadTLX();
 			$this->view->listTheLoaiXe = $listTheLoaiXe;
 			$listNSX = $objModelXe->LoadNSX();
 			$this->view->listNSX = $listNSX;
 			if(isset($_POST['ten_xe'])&&$_POST['ten_xe']!="")
        	{	            
	            $objModelXe->ten_xe = $_POST['ten_xe'];
	            $objModelXe->mau_xe = $_POST['mau_xe'];
	            $objModelXe->so_ghe = $_POST['so_ghe'];
	            $objModelXe->loai_xe = $_POST['loai_xe'];
	            $objModelXe->id_nsx = $_POST['id_nsx'];
	            $objModelXe->gia_thue_moi = $_POST['gia_thue_moi'];
	            $objModelXe->van_toc = $_POST['van_toc'];
	            $objModelXe->doi_xe = $_POST['doi_xe'];
	            $objModelXe->bien_so = $_POST['bien_so'];
	            $objModelXe->id_cong_ty = $_POST['id_cong_ty'];	            
	            $res = $objModelXe->SaveNewXe();
	            $this->view->res = $res;
        	}
 		}

 		public function XoaXeAction(){
 			if(isset($_GET['id']))
	 		{
	 			$objModelXe = new XeModel();
	 			$objModelXe->id = $_GET['id'];
	 			$res = $objModelXe->Delete();
	 			$this->view->res = $res;
	 		}
 		}

 		public function SuaXeAction(){
 			$objModelXe = new XeModel();
			$objModelXe->id = $_GET['id'];
			$listTheLoaiXe = $objModelXe->LoadTLX();
 			$this->view->listTheLoaiXe = $listTheLoaiXe;
 			$listNSX = $objModelXe->LoadNSX();
 			$this->view->listNSX = $listNSX;
			$xeDetail = $objModelXe->LoadOneAdmin();
			$this->view->xeDetail = $xeDetail;
			if(isset($_POST['ten_xe'])){
	            $objModelXe->ten_xe = $_POST['ten_xe'];
	            $objModelXe->mau_xe = $_POST['mau_xe'];
	            $objModelXe->so_ghe = $_POST['so_ghe'];
	            $objModelXe->loai_xe = $_POST['loai_xe'];
	            $objModelXe->id_nsx = $_POST['id_nsx'];
	            $objModelXe->gia_thue_moi = $_POST['gia_thue_moi'];
	            $objModelXe->van_toc = $_POST['van_toc'];
	            $objModelXe->doi_xe = $_POST['doi_xe'];
	            $objModelXe->bien_so = $_POST['bien_so'];
	            $objModelXe->id_cong_ty = $_POST['id_cong_ty'];
	            $res = $objModelXe->Update();
	            $this->view->res = $res;
	        }
 		}


 	public function QuanLyTinhAction(){
 		$objModelCompany = new CompanyModel();
 		if(isset($_POST['search_ten_tinh'])){
 			$objModelCompany->search_ten_tinh = $_POST['search_ten_tinh'];
 		}
 		$so_trang = $objModelCompany->PhanTrangTinh();
 		$this->view->so_trang = $so_trang;		
 		if(isset($_GET['page']))
 		{
 			if($_GET['page']>$this->view->so_trang)
 				$objModelCompany->page = $this->view->so_trang;
 				else if($_GET['page']<1)
 					$objModelCompany->page = 1;
 					else 
 						$objModelCompany->page = $_GET['page'];
 		}
 			else
 			{
 				$objModelCompany->page = 1;
 			}		
 		$listTinh = $objModelCompany->LoadTinh();
 		$this->view->listTinh = $listTinh;		
 	}

	public function ThemTinhAction(){
		$objModelCompany = new CompanyModel();
		if(isset($_POST['ten_tinh']))
		{
			$objModelCompany->ten_tinh = $_POST['ten_tinh'];
 			$res = $objModelCompany->SaveNewTinh();
			$this->view->res = $res;
		}
	}

	public function SuaTinhAction(){
		$objModelCompany = new CompanyModel();
		$objModelCompany->id = $_GET['id'];
		$tinh = $objModelCompany->Load1Tinh();
		$this->view->tinh = $tinh;
		if(isset($_POST['ten_tinh']))
		{
			$objModelCompany->ten_tinh = $_POST['ten_tinh'];
	        $res = $objModelCompany->EditTinh();
	        $this->view->res = $res;
		}

	}

	public function XoaTinhAction(){
 			if(isset($_GET['id']))
	 		{
	 			$objModelCompany = new CompanyModel();
	 			$objModelCompany->id = $_GET['id'];
	 			$res = $objModelCompany->DeleteTinh();
	 			$this->view->res = $res;
	 		}
 		}


 	public function QuanLyQuanAction(){
 		$objModelCompany = new CompanyModel();
 		$so_trang = $objModelCompany->PhanTrangQuan();
 		$this->view->so_trang = $so_trang;
 		if(isset($_GET['page']))
 		{
 			if($_GET['page']>$this->view->so_trang)
 				$objModelCompany->page = $this->view->so_trang;
 				else if($_GET['page']<1)
 					$objModelCompany->page = 1;
 					else 
 						$objModelCompany->page = $_GET['page'];
 		}
 			else
 			{
 				$objModelCompany->page = 1;
 			}		
 		$listQuan = $objModelCompany->LoadQuan();
 		$this->view->listQuan = $listQuan;		
 	}

 	public function ThemQuanAction(){
		$objModelCompany = new CompanyModel();
		if(isset($_POST['ten_quan']))
		{
			$objModelCompany->ten_quan = $_POST['ten_quan'];
 			$res = $objModelCompany->SaveNewQuan();
			$this->view->res = $res;
		}
	}

	public function SuaQuanAction(){
		$objModelCompany = new CompanyModel();
		$objModelCompany->id = $_GET['id'];
		$quan = $objModelCompany->Load1Quan();
		$this->view->quan = $quan;
		if(isset($_POST['ten_quan']))
		{
			$objModelCompany->ten_quan = $_POST['ten_quan'];
	        $res = $objModelCompany->EditQuan();
	        $this->view->res = $res;
		}
 	}
	public function XoaQuanAction(){
 			if(isset($_GET['id']))
	 		{
	 			$objModelCompany = new CompanyModel();
	 			$objModelCompany->id = $_GET['id'];
	 			$res = $objModelCompany->DeleteQuan();
	 			$this->view->res = $res;
	 		}
 		}




 	public function QuanLyPhuongAction(){
 		$objModelCompany = new CompanyModel();
 		$so_trang = $objModelCompany->PhanTrangPhuong();
 		$this->view->so_trang = $so_trang;
 		if(isset($_GET['page']))
 		{
 			if($_GET['page']>$this->view->so_trang)
 				$objModelCompany->page = $this->view->so_trang;
 				else if($_GET['page']<1)
 					$objModelCompany->page = 1;
 					else 
 						$objModelCompany->page = $_GET['page'];
 		}
 			else
 			{
 				$objModelCompany->page = 1;
 			}		
 		$listPhuong = $objModelCompany->LoadPhuong();
 		$this->view->listPhuong = $listPhuong;
 	}

 	public function ThemPhuongAction(){
		$objModelCompany = new CompanyModel();
		if(isset($_POST['ten_phuong']))
		{
			$objModelCompany->ten_phuong = $_POST['ten_phuong'];
 			$res = $objModelCompany->SaveNewPhuong();
			$this->view->res = $res;
		}
	}

	public function SuaPhuongAction(){
		$objModelCompany = new CompanyModel();
		$objModelCompany->id = $_GET['id'];
		$phuong = $objModelCompany->Load1phuong();
		$this->view->phuong = $phuong;
		if(isset($_POST['ten_phuong']))
		{
			$objModelCompany->ten_phuong = $_POST['ten_phuong'];
	        $res = $objModelCompany->EditPhuong();
	        $this->view->res = $res;
		}

	}
		public function XoaPhuongAction(){
 			if(isset($_GET['id']))
	 		{
	 			$objModelCompany = new CompanyModel();
	 			$objModelCompany->id = $_GET['id'];
	 			$res = $objModelCompany->DeletePhuong();
	 			$this->view->res = $res;
	 		}
 		}


 	public function QuanLyBaiVietAction(){
 		$objModelBV = new BaiVietModel();
 		$so_trang = $objModelBV->PhanTrang();
 		$this->view->so_trang = $so_trang;
 		if(isset($_GET['page']))
 		{
 			if($_GET['page']>$this->view->so_trang)
 				$objModelBV->page = $this->view->so_trang;
 				else if($_GET['page']<1)
 					$objModelBV->page = 1;
 					else
 						$objModelBV->page = $_GET['page'];
 		}
 			else
 			{
 				$objModelBV->page = 1;
 			}		
 		$listBV = $objModelBV->LoadListAdmin();
 		$this->view->listBV = $listBV;
 	}

	public function XoaBaiVietAction(){
		if(isset($_GET['id']))
	 		{
	 			$objModelBV = new BaiVietModel();
	 			$objModelBV->id = $_GET['id'];
	 			$res = $objModelBV->DeleteBV();
	 			$this->view->res = $res;
	 		}
 	}

 	public function SuaBaiVietAction(){
 		$objModelBV = new BaiVietModel();
 		$objModelBV->id = $_GET['id'];
 		$bvDetail = $objModelBV->LoadBV();
 		$this->view->bvDetail = $bvDetail;
 		if(isset($_POST['ten_bv']))
 		{
 			$objModelBV->ten_bv = $_POST['ten_bv'];
 			$objModelBV->tom_tat = $_POST['tom_tat'];
 			$res = $objModelBV->Update();
 			$this->view->res = $res;
 		}
 	}

}    