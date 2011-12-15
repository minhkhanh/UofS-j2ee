function checkValidationRegObj(objName) {
	var x=document.forms["frmDangKy"][objName].value;
	if (x==null || x.length<=4) {
		document.forms["frmDangKy"][objName].className = 'imgCheckError';
	} else {
		document.forms["frmDangKy"][objName].className = 'imgCheckOk';
	}
}

function checkValidationRegPassRetype(objName, objNameSrc) {
	var y=document.forms["frmDangKy"][objNameSrc].value;
	
	var x=document.forms["frmDangKy"][objName].value;
	if (x==null || x.length<=4 || x!=y) {
		document.forms["frmDangKy"][objName].className = 'imgCheckError';
	} else {
		document.forms["frmDangKy"][objName].className = 'imgCheckOk';
	}
}

function checkValidationReg() {
	var result = true;	
	
	var x=document.forms["frmDangKy"]["tenDangNhap"].value;
	if (x==null || x.length<=4) {
		document.forms["frmDangKy"]["tenDangNhap"].className = 'imgCheckError';
		result = false;
	} else {
		document.forms["frmDangKy"]["tenDangNhap"].className = 'imgCheckOk';
	}

	var y=document.forms["frmDangKy"]["matKhau"].value;
	if (y==null || y.length<=4) {
		document.forms["frmDangKy"]["matKhau"].className = 'imgCheckError';
		result = false;
	} else {
		document.forms["frmDangKy"]["matKhau"].className = 'imgCheckOk';
	}

	var x=document.forms["frmDangKy"]["matKhauXacNhan"].value;
	if (x==null || x.length<=4 || x!=y) {
		document.forms["frmDangKy"]["matKhauXacNhan"].className = 'imgCheckError';
		result = false;
	} else {
		document.forms["frmDangKy"]["matKhauXacNhan"].className = 'imgCheckOk';
	}

	var x=document.forms["frmDangKy"]["hoVaTen"].value;
	if (x==null || x.length<=4) {
		document.forms["frmDangKy"]["hoVaTen"].className = 'imgCheckError';
		result = false;
	} else {
		document.forms["frmDangKy"]["hoVaTen"].className = 'imgCheckOk';
	}

	var x=document.forms["frmDangKy"]["email"].value;
	if (x==null || x.length<=4) {
		document.forms["frmDangKy"]["email"].className = 'imgCheckError';
		result = false;
	} else {
		document.forms["frmDangKy"]["email"].className = 'imgCheckOk';
	}

	var x=document.forms["frmDangKy"]["diaChi"].value;
	if (x==null || x.length<=4) {
		document.forms["frmDangKy"]["diaChi"].className = 'imgCheckError';
		result = false;
	} else {
		document.forms["frmDangKy"]["diaChi"].className = 'imgCheckOk';
	}

	var x=document.forms["frmDangKy"]["dienThoai"].value;
	if (x==null || x.length<=4) {
		document.forms["frmDangKy"]["dienThoai"].className = 'imgCheckError';
		result = false;
	} else {
		document.forms["frmDangKy"]["dienThoai"].className = 'imgCheckOk';
	}
	if (result) {
		document.forms["frmDangKy"]["matKhau"].value = MD5(document.forms["frmDangKy"]["matKhau"].value);
		document.forms["frmDangKy"]["matKhauXacNhan"].value = document.forms["frmDangKy"]["matKhau"].value;
	}

	return result;
}
