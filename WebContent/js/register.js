window.onload = function() {
	//获得焦点
  var myInputNodes = document.getElementsByTagName("input");
	for (var i=0; i<myInputNodes.length; ++i)
	{
	  if (myInputNodes[i].type == "text")
	  {
			myInputNodes[i].focus();
			break;
	  }
	} 
}

