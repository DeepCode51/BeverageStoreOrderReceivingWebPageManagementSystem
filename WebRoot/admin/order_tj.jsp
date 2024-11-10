<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">

<jsp:include page="head.jsp"></jsp:include>
<script src="assets/dist/echarts.js"></script>

<body>
<div class="wrapper">

    <jsp:include page="header.jsp"></jsp:include>

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp"></jsp:include>




    <div class="main-panel">
        <div class=" page-content clearfix">
            <form method="post" action="userList_lsQuery.do" >
                <div class="search_style">
                    <ul class="search_content clearfix">
                        <li>
                        <li><label class="l_f"></label><input type="text" class="inline laydate-icon" id="start"  name="stime" placeholder="请选择开始的时间" /></li>
                        <li><label class="l_f"></label>
                            <input type="text" class="inline laydate-icon" id="end"  name="stime" placeholder="请选择结束的时间" />
                            <input type="hidden"  id="xid"  name="xid" value="${user.id}" /></li>
                        <li><label class="l_f"></label><select name="cid" id="cid">
                            <option value="">请选择商品。。。</option>
                            <c:forEach items="${glist }" var="c">
                                <option value="${c.id }">${c.name }</option>
                            </c:forEach></select></li>
                        <li style="width:90px;"><button type="button" class="btn_search" onclick="tj()"><i class="icon-search"></i>查询</button></li>
                    </ul>
                </div>
            </form>
            <div class="transaction_style">
                <!-- <ul class="state-overview clearfix">
                 <li class="Info">
                  <span class="symbol red"><i class="fa fa-jpy"></i></span>
                  <span class="value"><h4>交易金额</h4><p class="Quantity color_red">34565.68</p></span>
                 </li>
                  <li class="Info">
                  <span class="symbol  blue"><i class="fa fa-shopping-cart"></i></span>
                  <span class="value"><h4>订单数量</h4><p class="Quantity color_red">5656</p></span>
                 </li>
                  <li class="Info">
                  <span class="symbol yellow"><i class="fa fa-shopping-cart"></i></span>
                  <span class="value"><h4>交易失败</h4><p class="Quantity color_red">34</p></span>
                 </li>
                  <li class="Info">
                  <span class="symbol darkblue"><i class="fa fa-jpy"></i></span>
                  <span class="value"><h4>退款金额</h4><p class="Quantity color_red">3441.68</p></span>
                 </li>
                </ul> -->
            </div>
            <div class="t_Record" >
                <div id="main" style="height:400px; overflow:hidden; width:100%; overflow:auto"  ></div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

    </div>

    <!-- Custom template | don't include it in your project! -->
    <jsp:include page="set.jsp"></jsp:include>

    <!-- End Custom template -->
</div>
<!--   Core JS Files   -->
<jsp:include page="jscode.jsp"></jsp:include>




<script type="text/javascript">

    var arry =null;
    var arry2 =null;
    function tj() {
        var cid=$("#cid").val();
        var start = $("#start").val();
        var end=$("#end").val();
        var mark=$("#xid").val();
        if (start ==""||end=="") {
            alert("查询时间不能为空！");
        } else {
            $.ajax({
                url : "tj.do",
                type : "post",
                data :{"stime":start,"etime":end,"fid":cid,"xid":mark},
                dataType : "json",
                success:function(result){
                    //alert(result.xmlstr);
                    //alert(result.stu);
                    //alert(result.account);
                    arry = result.stu;
                    arry2 = result.account;

                    require(
                        [
                            'echarts',
                            'echarts/theme/macarons',
                            'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                            'echarts/chart/bar'
                        ],
                        function (ec,theme) {
                            var myChart = ec.init(document.getElementById('main'),theme);

                            option = {
                                title : {
                                    text: '销售报表',
                                    subtext: ''
                                },
                                tooltip : {
                                    trigger: 'axis'
                                },
                                legend: {
                                    //  data:['订单总额','待付款','已付款','代发货']
                                    data:['订单总额']
                                },
                                toolbox: {
                                    show : true,
                                    feature : {
                                        mark : {show: true},
                                        dataView : {show: true, readOnly: false},
                                        magicType : {show: true, type: ['line', 'bar']},
                                        restore : {show: true},
                                        saveAsImage : {show: true}
                                    }
                                },
                                calculable : true,
                                xAxis : [
                                    {
                                        type : 'category',
                                        data : arry
                                    }
                                ],
                                yAxis : [
                                    {
                                        type : 'value'
                                    }
                                ],
                                series : [
                                    {
                                        name:'订单总额',
                                        type:'bar',
                                        data:arry2,
                                        markPoint : {
                                            data : [
                                                {type : 'max', name: '最大值'},
                                                {type : 'min', name: '最小值'}
                                            ]
                                        }
                                    }/* ,
  				        {
  				            name:'待付款',
  				            type:'bar',
  				            data:[26, 59, 30, 84, 27, 77, 176, 1182, 487, 188, 60, 23],
  				            markPoint : {
  				                data : [
  				                    {name : '年最高', value : 1182, xAxis: 7, yAxis: 1182, symbolSize:18},
  				                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
  				                ]
  				            },


  				        }
  						, {
  				            name:'已付款',
  				            type:'bar',
  				            data:[26, 59, 60, 264, 287, 77, 176, 122, 247, 148, 60, 23],
  				            markPoint : {
  				                data : [
  				                    {name : '年最高', value : 172, xAxis: 7, yAxis: 172, symbolSize:18},
  				                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
  				                ]
  				            },

  						}
  						, {
  				            name:'代发货',
  				            type:'bar',
  				            data:[26, 59, 80, 24, 87, 70, 175, 1072, 48, 18, 69, 63],
  				            markPoint : {
  				                data : [
  				                    {name : '年最高', value : 1072, xAxis: 7, yAxis: 1072, symbolSize:18},
  				                    {name : '年最低', value : 22, xAxis: 11, yAxis: 3}
  				                ]
  				            },

  						} */
                                ]
                            };

                            myChart.setOption(option);
                        }
                    );

                    /* $(".t_Record").show();
                    $("#main").show(); */
                },
                error:function(){
                    alert("error");
                }

            })
        }

    }


    $(document).ready(function(){

        $(".t_Record").width($(window).width()-60);
        //当文档窗口发生改变时 触发
        $(window).resize(function(){
            $(".t_Record").width($(window).width()-60);
        });
        /*  $(".btn_search").click(function(){
                $(".t_Record").width($(window).width()-60);
               });  */
    });

    require.config({
        paths: {
            echarts: './assets/dist'
        }
    });
    require(
        [
            'echarts',
            'echarts/theme/macarons',
            'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
            'echarts/chart/bar'
        ],
        function (ec,theme) {
            var myChart = ec.init(document.getElementById('main'),theme);

            option = {
                title : {
                    text: '销售报表',
                    subtext: ''
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    //  data:['订单总额','待付款','已付款','代发货']
                    data:['订单总额']
                },
                toolbox: {
                    show : true,
                    feature : {
                        mark : {show: true},
                        dataView : {show: true, readOnly: false},
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        data : arry
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                series : [
                    {
                        name:'订单总额',
                        type:'bar',
                        data:arry2,
                        markPoint : {
                            data : [
                                {type : 'max', name: '最大值'},
                                {type : 'min', name: '最小值'}
                            ]
                        }
                    }/* ,
        {
            name:'待付款',
            type:'bar',
            data:[26, 59, 30, 84, 27, 77, 176, 1182, 487, 188, 60, 23],
            markPoint : {
                data : [
                    {name : '年最高', value : 1182, xAxis: 7, yAxis: 1182, symbolSize:18},
                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
                ]
            },


        }
		, {
            name:'已付款',
            type:'bar',
            data:[26, 59, 60, 264, 287, 77, 176, 122, 247, 148, 60, 23],
            markPoint : {
                data : [
                    {name : '年最高', value : 172, xAxis: 7, yAxis: 172, symbolSize:18},
                    {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
                ]
            },

		}
		, {
            name:'代发货',
            type:'bar',
            data:[26, 59, 80, 24, 87, 70, 175, 1072, 48, 18, 69, 63],
            markPoint : {
                data : [
                    {name : '年最高', value : 1072, xAxis: 7, yAxis: 1072, symbolSize:18},
                    {name : '年最低', value : 22, xAxis: 11, yAxis: 3}
                ]
            },

		} */
                ]
            };

            myChart.setOption(option);
        }
    );




    /**日期选择**/
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        // min: laydate.now(), //设定最小日期为当前日期
        min:'1900-01-01',
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16 ',
        istime: true,
        istoday: false,
        choose: function(datas){
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);
</script>
</body>
</html>