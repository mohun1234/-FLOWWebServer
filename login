<!------------- HTML------------>
<ul>
<li>
<span id="imp_id"><input type="text" id='id' onclick="inputid()"  onkeypress="hitEnterKey('id');" value="아이디"/></span>
</li>
<li>
<span id="imp_pwd"><input type="text" id='pwd' onclick="inputpwd()"  onfocus="inputpwd()" value="비밀번호"/></span> 
</li>
</ul>   

<!------------- JavaScript------------>
function inputid(){
 var id = document.getElementById('id');
 id.value = "";
 id.style.color = "black";
}
function hitEnterKey(str){
 var pwd = document.getElementById('pwd');
 
 if(str == 'id'){
  if(event.keyCode == 13){
   pwd.focus();
  }
 }
 if(str == 'pwd'){
  if(event.keyCode == 13){
   //login
   alert('login');
  }
 }
}
function inputpwd(){
 var imp = document.getElementById('imp_pwd');
 imp.outerHTML = "<input type='password' id='pwd' value='' onclick=\"this.value = ''\" onkeypress=\"hitEnterKey('pwd');\">";

 var pwd = document.getElementById('pwd');
 pwd.value = "";
 pwd.style.color = "black";
 pwd.focus();
}


<!------------------- CSS ------------->

@charset "utf-8";
ul{
 list-style-type : none;
}
li{
 margin-bottom : 2px;
}

input{
 color : #8c8c8c;
 font-size : 13pt;
 border : 3px solid #21b021;
}
[출처] [HTML] 로그인 페이지 구현 |작성자 무무
