function validateUpdate() {
	var passed = true;
	// alert(1);
	document.getElementById("price_msg").innerHTML = "";
	document.getElementById("quant_msg").innerHTML = "";
	document.getElementById("cat_msg").innerHTML = "";
	// alert(2);
	var giaBan = document.frmUpdate.giaBan.value;
	var soLuongTon = document.frmUpdate.soLuongTon.value;
	var maDanhMuc = document.frmUpdate.maDanhMuc.value;
	// alert(3);
	if (giaBan == "" || isNaN(giaBan)) {
		// alert(4);
		document.getElementById("price_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập số.</font>";
		passed = false;
	}

	if (soLuongTon == "" || isNaN(soLuongTon)) {
		// alert(5);
		document.getElementById("quant_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập số nguyên.</font>";
		passed = false;
	}

	if (maDanhMuc == "") {
		// alert(6);
		document.getElementById("cat_msg").innerHTML = "<font color='FF0000'>Vui lòng chọn một danh mục.</font>";
		passed = false;

	}

	return passed;
}

function validateAdvSearch() {
	var passed = true;

	document.getElementById("minprice_msg").innerHTML = "";
	document.getElementById("maxprice_msg").innerHTML = "";

	var giaMin = document.frmTimKiemNangCao.giaMin.value;
	var giaMax = document.frmTimKiemNangCao.giaMax.value;

	if (giaMin != null && isNaN(giaMin)) {
		document.getElementById("minprice_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập số.</font>";
		passed = false;
	}

	if (giaMax != null && isNaN(giaMax)) {
		document.getElementById("maxprice_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập số.</font>";
		passed = false;
	}

	return passed;
}

/**
 * Validate registration data when submit form. Required fields: user name,
 * password, password confirmation.
 * 
 * @returns {Boolean} true if all data is OK.
 */
function validateRegistration() {
	var passed = true;

	// reset message cells first.
	document.getElementById("regname_msg").innerHTML = "";
	document.getElementById("regpwd_msg").innerHTML = "";
	document.getElementById("regpwd2_msg").innerHTML = "";
	document.getElementById("regmsg").innerHTML = "";

	// validate then set messages into cells.
	if (document.frmDangKy.tenDangNhap.value == "") {
		document.getElementById("regname_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập tên đăng nhập.</font>";
		passed = false;
	}

	if (document.frmDangKy.matKhau.value == "") {
		document.getElementById("regpwd_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập mật khẩu.</font>";
		passed = false;
	}

	// var emailRegex =
	// '[a-z0-9\\._]*[a-z0-9_]@[a-z0-9][a-z0-9\\-\\.]*[a-z0-9]\\.[a-z]{2,6}$';
	// if (email.search(emailRegex) == -1) {
	// alert('Email không hợp lệ!');
	// }
	//	
	// if (diaChi == '') {
	// alert('Xin vui lòng nhập địa chỉ!');
	// }

	if (document.frmDangKy.matKhau2.value == ""
			|| document.frmDangKy.matKhau2.value != document.frmDangKy.matKhau.value) {
		document.getElementById("regpwd2_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập lại chính xác mật khẩu.</font>";
		passed = false;
	}

	return passed;
}

/**
 * Validate logging in data when submit form.
 * 
 * @returns {Boolean} true if all data is OK.
 */
function validateLoggingIn() {
	var passed = true;

	// reset message cells first.
	document.getElementById("logname_msg").innerHTML = "";
	document.getElementById("logpwd_msg").innerHTML = "";
	document.getElementById("logmsg").innerHTML = "";

	if (document.frmDangNhap.tenDangNhap.value == "") {
		document.getElementById("logname_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập tên đăng nhập.</font>";
		passed = false;
	}

	if (document.frmDangNhap.matKhau.value == "") {
		document.getElementById("logpwd_msg").innerHTML = "<font color='FF0000'>Vui lòng nhập mật khẩu.</font>";
		passed = false;
	}

	return passed;
}