<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--解决jsp页面中文乱码--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<div class="sidebar sidebar-style-2">
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
        <div class="sidebar-content">
            <div class="user">
                <div class="avatar-sm float-left mr-2">
                    <img src="../upload/${sessionScope.auser.img }" alt="..." class="avatar-img rounded-circle">
                </div>
                <div class="info">
                    <a data-toggle="collapse" href="#collapseExample" aria-expanded="true">
								<span>
									${sessionScope.auser.tname }
									<span class="user-level">${sessionScope.auser.utype }</span>
									<span class="caret"></span>
								</span>
                    </a>
                    <div class="clearfix"></div>

                    <div class="collapse in" id="collapseExample">
                        <ul class="nav">
                            <%--<li>
                                <a href="#profile">
                                    <span class="link-collapse">My Profile</span>
                                </a>
                            </li>
                            <li>
                                <a href="#edit">
                                    <span class="link-collapse">Edit Profile</span>
                                </a>
                            </li>
                            <li>
                                <a href="#settings">
                                    <span class="link-collapse">Settings</span>
                                </a>
                            </li>--%>
                        </ul>
                    </div>
                </div>
            </div>
            <ul class="nav nav-primary">
                <li class="nav-item active">
                    <a data-toggle="collapse" href="#dashboard" class="collapsed" aria-expanded="false">
                        <i class="fas fa-home"></i>
                        <p>主页</p>
                        <span class="caret"></span>
                    </a>
                    <div class="collapse" id="dashboard">
                        <ul class="nav nav-collapse">
                            <li>
                                <a href="<%=basePath%>" target="_blank">
                                    <span class="sub-item">首页</span>
                                </a>
                            </li>
                            <%--<li>
                                <a href="../demo2/index.do">
                                    <span class="sub-item">样式2</span>
                                </a>
                            </li>--%>
                        </ul>
                    </div>
                </li>
                <%--<li class="nav-section">
							<span class="sidebar-mini-icon">
								<i class="fa fa-ellipsis-h"></i>
							</span>
                    <h4 class="text-section">组成</h4>
                </li>--%>
                <c:if test="${sessionScope.auser.utype=='管理员'}">
                    <li class="nav-item">
                        <a data-toggle="collapse" href="#base">
                            <i class="fas fa-layer-group"></i>
                            <p>用户管理</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="base">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="usersList.do">
                                        <span class="sub-item">顾客列表</span>
                                    </a>
                                </li>
                              <li>
                                <a href="usersList_yg.do">
                                  <span class="sub-item">员工列表</span>
                                </a>
                              </li>
                                <li>
                                    <a href="showUserInfo.do">
                                        <span class="sub-item">个人信息管理</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-toggle="collapse" href="#sidebarLayouts">
                            <i class="fas fa-th-list"></i>
                            <p>新闻动态管理</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="sidebarLayouts">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="newsList.do">
                                        <span class="sub-item">新闻动态</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a data-toggle="collapse" href="#tables">
                            <i class="fas fa-table"></i>
                            <p>商品管理</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="tables">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="ftypeList.do">
                                        <span class="sub-item">商品类型管理</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="goodsList.do">
                                        <span class="sub-item">商品管理</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-toggle="collapse" href="#maps">
                            <i class="fas fa-map-marker-alt"></i>
                            <p>订单管理</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="maps">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="ordersList.do">
                                        <span class="sub-item">订单管理</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-toggle="collapse" href="#charts">
                            <i class="far fa-chart-bar"></i>
                            <p>投诉及建议反馈管理</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="charts">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="bbsList.do">
                                        <span class="sub-item">投诉及建议反馈管理</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </c:if>



                <c:if test="${sessionScope.auser.utype=='员工'}">
                    <li class="nav-item">
                        <a data-toggle="collapse" href="#base">
                            <i class="fas fa-layer-group"></i>
                            <p>用户管理</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="base">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="usersList.do">
                                        <span class="sub-item">顾客列表</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="showUserInfo.do">
                                        <span class="sub-item">个人信息管理</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a data-toggle="collapse" href="#sidebarLayouts">
                            <i class="fas fa-th-list"></i>
                            <p>新闻动态管理</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="sidebarLayouts">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="newsList.do">
                                        <span class="sub-item">新闻动态</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a data-toggle="collapse" href="#tables">
                            <i class="fas fa-table"></i>
                            <p>商品管理</p>
                            <span class="caret"></span>
                        </a>
                        <div class="collapse" id="tables">
                            <ul class="nav nav-collapse">
                                <li>
                                    <a href="goodsList.do">
                                        <span class="sub-item">商品管理</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </c:if>


                <%-- <li class="mx-4 mt-2">
                     <a href="#" class="btn btn-primary btn-block"><span class="btn-label mr-2"> <i class="fa fa-heart"></i> </span>Buy Pro</a>
                 </li>--%>
            </ul>
        </div>
    </div>
</div>
