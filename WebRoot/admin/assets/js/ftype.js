
/*添加*/

function checkTypeName() {
    var name = $("#name").val();
    if(name==""||(name.length<1||name.length>12)){
        $("#checku").html("名称不能为空且长度在1～12位之间！");
        $("input[id=name]").focus();
    } else {
        $("#checku").html("");
        $.ajax({
            url : "addType.do",
            type : "post",
            data : "name=" + name,
            dataType : "json",
            success:function(result){
                if(result.info=="ok"){
                    $("#checku").html("名称存在，请更换！");
                    return false;
                }else{
                    $("#checku").html("添加成功！");
                    return true;
                }
            },
            error:function(){
                alert("系统处理中！");
                return false;
            }

        });
    }

}


/*更新*/

function updateTypeName() {
    var name = $("#name").val();
    var fid=$("#id").val();
    if(name==""||(name.length<1||name.length>12)){
        $("#checkTypeName").html("名称不能为空且长度在1～12位之间！");
        $("input[id=ftype]").focus();
    } else {
        $("#checkTypeName").html("");
        $.ajax({
            url : "updateTypeName.do",
            type : "post",
            data : {"name" : name,"id" : fid},
            dataType : "json",
            success:function(result){
                if(result.info=="ng"){
                    $("#checkTypeName").html("名称存在，请更换！");
                    return false;
                }else{
                    $("#checkTypeName").html("更新成功！");
                    return true;
                }
            },
            error:function(){
                alert("系统处理中！");
                return false;
            }

        });
    }

}