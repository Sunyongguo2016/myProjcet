	function check(form){
			if (form.password.value=="") {
				alert("请输入新密码！");
				form.password.focus();
				return false;
			}
			if(form.oldPwd.value=="") {
				alert("请输入旧密码！");
				form.oldPwd.focus();
				return false;
			}
			if(form.surepassword.value==""){
				alert("请输入确认密码！");
				form.surepassword.focus();
				return false;
			}
			
			if (form.password.value.length<6||form.password.value.length>100) {
				alert("输入密码长度不对！");
				form.password.focus();
				return false;
			};
			if(form.password.value == form.surepassword.value){
				return true;
			}else{
				alert("密码和确认密码不一致！");
				form.surepassword.focus();
				return false;
			}
			return true;
		}
	
