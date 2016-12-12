function checkPwd(){
	var p = document.getElementById("pass");
	var pwd = document.getElementById("pass").value;

	if(pwd == ""){
		alert("密码不可为空！");
		p.focus();
	} else if(pwd.length<6 || pwd.lengtth>100){
		alert("密码长度不对！")
		p.focus();
	}
}
function checkONPwd(){
	var rp = document.getElementById("pass");
	var pwd = document.getElementById("pass").value;
	var repwd = document.getElementById("repassword").value;
	if(pwd != repwd){
		alert("密码和确认密码不一致！")
		rp.focus();
	}
}

