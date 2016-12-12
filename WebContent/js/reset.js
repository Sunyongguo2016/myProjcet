function checkPwd(){
	var p = document.getElementById("password");
	var pwd = document.getElementById("password").value;

	if(pwd == ""){
		alert("新密码不可为空！");
		p.focus();
	} else if(pwd.length<6 || pwd.lengtth>100){
		alert("新密码长度不对！")
		p.focus();
	}
}
function checkONPwd(){
	var rp = document.getElementById("password");
	var pwd = document.getElementById("password").value;
	var repwd = document.getElementById("repassword").value;
	if(pwd != repwd){
		document.getElementById("password").focus();
		alert("密码和确认密码不一致！")
	}
}


