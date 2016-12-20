	function check(form){
			if (form.uer.value=="") {
				alert("请输入用户名！");
				form.uer.focus();
				return false;
			}
			if (form.pwd.value=="") {
				alert("请输入密码！");
				form.pwd.focus();
				return false;
			}
			if (form.uer.value.length<5||form.uer.value.length>10) {
				alert("输入用户名长度不对！");
				form.uer.focus();
				return false;
			}
			if (form.pwd.value.length<6||form.pwd.value.length>10) {
				alert("输入密码长度不对！");
				form.pwd.focus();
				return false;
			};
			return true;
		}