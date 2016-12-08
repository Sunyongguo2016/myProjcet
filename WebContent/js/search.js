function tabChange(obj,id)
{
        var arrayli = obj.parentNode.getElementsByTagName("li"); //获取li数组
        var arrayul = document.getElementById(id).getElementsByTagName("ul"); //获取ul数组
        for(i=0;i<arrayli.length;i++)
        {
                if(obj==arrayli[i])
                {
                        arrayli[i].className = "cli";
                        arrayul[i].className = "";
                }
                else
                {
                        arrayli[i].className = "";
                        arrayul[i].className = "hidden";
                }
        }
}