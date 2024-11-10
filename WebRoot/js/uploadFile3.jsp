<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/xiaoyuandingcan/admin/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/xiaoyuandingcan/admin/images/syscome.files/Admin.js"></SCRIPT>
<script type="text/javascript" src="/xiaoyuandingcan/js/popup.js"></script>
<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<%
String filename = request.getParameter("filename4");
if(filename!=null)
{
 %>
 <script type="text/javascript">
 var txt = parentcument.getElementById("txt4");
 var filename = parentcument.getElementById("filename4");
 filename.value="<%=filename%>";
 txt.value="/xiaoyuandingcan/upload/<%=filename%>";
 popclose();
 </script>
 <%} %>
<form action="../admin/SubjectServlet?method=uploadFile3" enctype="multipart/form-data" name="f1" method="post">
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center 
border=0>
 
   <TR>
    <TD align="center" class=forumrow><label>
    
    <input name="txt" type="file"  size="27">
      </label></TD>
    </TR>
  
  <TR>
    <TD height=31 align="center" class=forumrow>
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TABLE>
</form>
</BODY></HTML>

