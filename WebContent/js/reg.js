	function check(form){
			if (form.password.value=="") {
				alert("请输入密码！");
				form.password.focus();
				return false;
			}
			if (form.username.value.length<5||form.username.value.length>100) {
				alert("输入用户名长度不对！");
				form.username.focus();
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


