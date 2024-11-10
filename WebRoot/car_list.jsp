<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zxx">

<jsp:include page="head.jsp"></jsp:include>
<%--<script type="text/javascript" src="assets/js/shop.js"></script>--%>
<script type="text/javascript" src="assets/js/jquery-1.11.0.min.js"></script>
<script>
    $(function(){
        $(".add").click(function(){
            var t=$(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val())+1)
            setTotal();
        })
        $(".min").click(function(){
            var t=$(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val())-1)
            if(parseInt(t.val())<=0){
                t.val(1);
            }
            setTotal();
        })
        function setTotal(){
            var s=0 ;
            var s1=0 ;
            $("#shop-xx #num22").each(function(){
                s+=parseInt($(this).find('input[class*=text_box]').val())*parseFloat($(this).find('span[class*=price]').text());
                console.log("价格是"+s);
                if (s>30) {
                    s1 = s- 10;
                    console.log("价格是"+s1);
                }else if (s>20&&s<30) {
                    s1= s-5;
                    console.log("价格是"+s1);
                }else{
                    s1=s;
                }
            });
            document.getElementById("total").value=s.toFixed(2);
            document.getElementById("total1").value=s1.toFixed(2);
//("input[id=total]").html(s.toFixed(2));
        }
        setTotal();


    })


    //算总价
    function calTotal(){
        var sum=0; //保存总价
//遍历表格中有title='price'属性的的单元格
        $("#shop-xx li.rs").each(function() {
            //sum=sum+parseFloat($(this).text().substr(1));//价格的累加
            sum=sum+parseFloat($(this).text());//价格的累加
        });
//显示总价
        $("#jine span").html(sum);

    }

</script>

<body>


<jsp:include page="header.jsp"></jsp:include>
<!--====== HEADER PART END ======-->
<!--====== OFF CANVAS START ======-->
<jsp:include page="left.jsp"></jsp:include>
<!--====== OFF CANVAS END ======-->
<!--====== BREADCRUMB PART START ======-->
<section class="breadcrumb-area" style="background-image: url(assets/img/bg/04.jpg);">
    <div class="container">
        <div class="breadcrumb-text">
            <span>购物车信息</span>
            <h2 class="page-title">购物车</h2>

            <ul class="breadcrumb-nav">
                <li><a href="index">首页</a></li>
                <li class="active">购物车</li>
            </ul>
        </div>
    </div>
</section>
<!--====== BREADCRUMB PART END ======-->
<!--====== ROOM-LIST START ======-->
<section class="room-section room-list-style pt-120 pb-120">
    <div class="container">
        <div class="wishlist-page-area section-padding-lg bg-white">
            <div class="container">

                <!-- Cart Products -->
                <div class="cart-table table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="cart-column-productname" scope="col">名称</th>
                            <th class="cart-column-image" scope="col">图片</th>
                            <th class="cart-column-price" scope="col">单价/数量</th>
                            <th class="cart-column-quantity" scope="col">修改</th>
                            <th class="cart-column-remove" scope="col">操作</th>
                        </tr>
                        </thead>
                        <tbody>


                        <c:forEach items="${list }" var="s">
                            <form action="updateShopNum.do" method="post">
                                <tr id="shop-xx">
                                    <td><c:forEach items="${glist }" var="g">
                                        <c:if test="${g.id==s.fid }">
                                            ${g.name }</c:if></c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach items="${glist }" var="g">
                                            <c:if test="${g.id==s.fid }">
                                                <img src="upload/${g.img }" width="87" height="58"  />
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td id="num22" >
                                        总价:￥<span class="price">
					       	<c:forEach items="${glist }" var="g">
                                <c:if test="${g.id==s.fid }">
                                    ${g.price }
                                </c:if>
                            </c:forEach>
					         </span>元/
                                        <input class="min btn  btn-info" type="button"   value="-" style="width:10px" />
                                        <input class="text_box" size="2" name="num" min="1" type="text" value="${s.num }" style="width:100px" readonly/> /<c:forEach items="${glist }" var="g">
                                    </c:forEach>
                                        <input class="add btn  btn-info"  type="button" value="+" style="width:10px"/>
                                        <input   type="hidden" name="id"  value="${s.id }" />
                                    </td>
                                    <td><input type="submit" class="btn btn-info" value="确认修改"/></td>
                                    <td> <a href="deleteShop.do?id=${s.id }"  class="btn btn-warning"><i class="ti ti-close"></i>删除</a></td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                        <tr>
                            <td colspan="3">
                                <img alt="" src="assets/img/zhifu.png" width="600px;" height="300px;">
                            </td>
                            <td colspan="2">
                                <form action="addOrders.do" method="post">
                                    <div id="js">
                                        <ul style="    list-style: none;">
                                            <li>您的余额为：${user.money }</li>
                                            <%--<c:if test="${user.utype=='顾客'}">
                                            <li style="    margin-top: 10px;">原价：<label ><input type="text" id="total" readonly="readonly" style="width:150px"/>元 </label></li>
                                            <li style="    margin-top: 10px;">折后金额：<label ><input type="text" name="zprice" id="total1" readonly="readonly" style="width:150px"/>元 </label></li>
                                            </c:if>--%>
                                           <%-- <c:if test="${user.utype=='用户'}">--%>
                                                <li style="    margin-top: 10px;">应付金额：<label ><input type="text" id="total"name="zprice" readonly="readonly" style="width:150px"/>元 </label></li>
                                            <%--</c:if>--%>
                                            <li style="    margin-top: 10px;">
                                                <input name="id" type="hidden"  value="${sessionScope.user.id }"  />
                                            </li>
                                            <li style="    margin-top: 10px;">选择分类：
                                                <select name="btype">
                                                    <option value="正常">正常</option>
                                                    <option value="定制">定制</option>
                                                </select>
                                                </li>
                                            <li style="    margin-top: 10px;">定制要求：<label ><input type="text" name="mark"  style="width:250px"/> </label></li>
                                            <li style="margin-top: 10px;">
                                                <input name="button" type="submit" id="button" class="btn btn-warning" value="确认支付"  /></li>
                                        </ul>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--// Cart Products -->



            </div>
        </div>

        <%--<div class="pagination-wrap">
            <ul>

                <c:if test="${sessionScope.p==1 }">
                    <c:if test="${page.page>1}">
                        <li><a href="<%=path%>/GoodsServlet?method=selectGoodsList&&page=1" >首页</a></li>
                        <li><a href="<%=path%>/GoodsServlet?method=selectGoodsList&&page=${page.page-1 }"> 上一页</a></li>
                        <li><a href="#">下一页</a></li>
                        <li><a href="#">末页</a></li>
                    </c:if>
                    <c:if test="${page.page<page.totalPage}">
                        <li><a href="#" >首页</a></li>
                        <li><a href="#"> 上一页</a></li>
                        <li><a href="<%=path%>/GoodsServlet?method=selectGoodsList&&page=${page.page+1 }">下一页</a></li>
                        <li><a href="<%=path%>/GoodsServlet?method=selectGoodsList&&page=${page.totalPage }">末页</a></li>
                    </c:if>
                </c:if>
               &lt;%&ndash; <li><a href="#"><i class="far fa-angle-double-left"></i></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">10</a></li>
                <li><a href="#"><i class="far fa-angle-double-right"></i></a></li>&ndash;%&gt;
            </ul>
        </div>--%>
    </div>
</section>
<!--====== ROOM-LIST END ======-->
<!--====== Back to Top ======-->
<a href="#" class="back-to-top" id="backToTop">
    <i class="fal fa-angle-double-up"></i>
</a>
<!--====== FOOTER PART START ======-->
<jsp:include page="footer.jsp"></jsp:include>


</body>

</html>
