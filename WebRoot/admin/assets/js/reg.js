


function checkPwd(){
    var pwd=$("#txtPwd").val();
    if(pwd==""||pwd.length<6||pwd.length>12){
        $("#checkPwd").html("密码不能为空且长度在6～12位之间！");
        $("input[id=txtPwd]").html("");
        $("input[id=txtPwd]").focus();
        return false;
    }else {
        $("#checkPwd").html("密码格式正确！");
        return true;}

}

function checkPwdc(){
    var pwd=$("#txtPwd").val();
    var pwdc=$("#txtConfirmPwd").val();
    if(pwdc==""||pwdc!=pwd){
        $("#checkPwdc").html("两次密码要一致 ！");
        $("input[id=txtConfirmPwd]");
        // $("input[name=passwordc]").focus();
        return false;
    }else{
        $("#checkPwdc").html("密码一致 ！");
        return true;}

}

function checkTel(){
    var tel=$("#tel").val();
    var regtel=/^(13|14|15|16|17|18|19)\d{9}$/;
    if(tel==""||!regtel.test(tel)){
        $("#checkTel").html("电话号码不能为空，且以13，14，15，16，17，18，19开头的11位");
        $("input[id=tel]").html("");
        $("input[id=tel]").focus();
        return false;
    }else{
        $("#checkTel").html("电话号码格式正确！");
        return true;
    }

}
function checkname1(){
    var uname=$("#txtName1").val();
    if(uname==""||uname.length<2){
        $("#prompt_name1").html("不能为空且长度在2位以上！");
        $("input[id=txtName1]").html("");
        $("input[id=txtName1]").focus();
        return false;
    }else{

        $("#prompt_name1").html("ok");
        return true;
    }}

function checkname2(){
    var uname=$("#txtName2").val();
    if(uname==""||uname.length<2){
        $("#prompt_name1").html("不能为空且长度在2位以上！");
        $("input[id=txtName2]").html("");
        $("input[id=txtName2]").focus();
        return false;
    }else{

        $("#prompt_name2").html("ok");
        return true;
    }}

function checkAll(){
    //alert("kkkkk");
    var flag=false;
    var aa = $("#username").val();
    var pwd=$("#txtPwd").val();
    var pwdc=$("#txtConfirmPwd").val();
    var tel=$("#txtjiazheng").val();
    /* var name1=$("#txtName1").val();
    var name2=$("#txtName2").val(); */
    var regtel=/^(13|15|18|)\d{9}$/;
    if(aa!=""&&(tel!=""||regtel.test(tel))&&
        /* (name1!=""||name1.length>2)&&(name2!=""||name2.length>2)&& */
        (pwd!=""||pwd.length>6||pwd.length<12)&&(pwdc!=""||pwdc==pwd)){
        flag=true;
    }else{
        alert("注册信息不完整或不合规范！");
    }
    return flag;

}