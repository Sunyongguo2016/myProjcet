var str = '${logined}';
window.onload = function changStyle(){
	if("on" == str){
		var log = document.getElementById("login");
		log.style.display="none";
		var v = document.getElementById("after_login");
		v.style.display="block";
	}
}			