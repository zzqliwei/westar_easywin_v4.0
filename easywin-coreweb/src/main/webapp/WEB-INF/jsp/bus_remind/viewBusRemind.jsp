<%@page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" errorPage="/WEB-INF/jsp/error/pageException.jsp"%>
<%@page import="com.westar.base.cons.SystemStrConstant"%><%@page import="com.westar.core.web.InitServlet"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@taglib prefix="fn" uri="/WEB-INF/tld/fn.tld"%>
<%@taglib prefix="fmt" uri="/WEB-INF/tld/fmt.tld"%> 
<%@taglib prefix="t" uri="/WEB-INF/tld/t.tld"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="renderer" content="webkit">
<title><%=SystemStrConstant.TITLE_NAME %></title>
<jsp:include page="/WEB-INF/jsp/include/static_assets.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/include/static.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/include/showNotification.jsp"></jsp:include>
<script type="text/javascript" src="/static/js/jquery.form.js"></script>
<script>
//关闭窗口
function closeWin(){
	var winIndex = window.top.layer.getFrameIndex(window.name);
	closeWindow(winIndex);
}
$(function() {
	//设置滚动条高度
	var height = $(window).height()-40;
	$("#contentBody").css("height",height+"px");
});
//查看详情
function busRemindDetailView(id,type){
	if('012'==type){//客户
		window.location.href="/crm/viewCustomer?sid=${param.sid}&id="+id+"&redirectPage="+encodeURIComponent('${param.redirectPage}');
	}else if('005'==type){//项目
		window.location.href="/item/viewItemPage?sid=${param.sid}&id="+id+"&redirectPage="+encodeURIComponent('${param.redirectPage}');
	}else if('003'==type){//任务
		window.location.href="/task/viewTask?sid=${param.sid}&id="+id+"&redirectPage="+encodeURIComponent('${param.redirectPage}');
	}else if('006'==type){//周报
		window.location.href="/weekReport/viewWeekReport?sid=${param.sid}&id="+id+"&redirectPage="+encodeURIComponent('${param.redirectPage}');
	}else if('050'==type){//分享
        window.location.href="/daily/viewDaily?sid=${param.sid}&id="+id+"&redirectPage="+encodeURIComponent('${param.redirectPage}');
    }else if('015'==type){//申请
		window.top.location.href="/userInfo/listPagedForCheck?sid=${param.sid}&id="+id+"&pager.pageSize=10&tab=14";
	}else if('022'==type){//审批
		window.location.href="/workFlow/viewSpFlow?sid="+'${param.sid}'+"&instanceId="+id+"&redirectPage="+encodeURIComponent('${param.redirectPage}');
	}else if('070'==type){//需求管理
		window.location.href="/demand/viewDemandPage?sid="+'${param.sid}'+"&demandId="+id+"&redirectPage="+encodeURIComponent('${param.redirectPage}');
	}
}
</script>
</head>
<body>
<div class="container" style="padding: 0px 0px;width: 100%">	
		<div class="row" style="margin: 0 0">
			<div class="col-lg-12 col-sm-12 col-xs-12" style="padding: 0px 0px">
            	<div class="widget no-margin-bottom" style="margin-top: 0px;" >
                	<div class="widget-header bordered-bottom bordered-themeprimary detailHead">
                        <span class="widget-caption themeprimary" style="font-size: 20px">催办详情</span>
                        <div class="widget-buttons">
							<a href="javascript:void(0)" onclick="closeWin()" title="关闭">
								<i class="fa fa-times themeprimary"></i>
							</a>
						</div>
                     </div>
                     <!--Widget Header-->
                     <!-- id="contentBody" 是必须的，用于调整滚动条高度 -->       
                     <div class="widget-body margin-top-40" id="contentBody" style="overflow: hidden;overflow-y:scroll;">
                     	<div class="widget radius-bordered">
                        	<div class="widget-header bg-bluegray no-shadow">
                            	<span class="widget-caption blue">基础信息</span>
                                <div class="widget-buttons btn-div-full">
                                	<a class="ps-point btn-a-full" data-toggle="collapse">
                                    	<i class="fa fa-minus blue"></i>
                                   </a>
                                 </div>
                             </div>
                            <div class="widget-body no-shadow">
                             	<div class="tickets-container bg-white">
									<ul class="tickets-list">
                                         <li class="ticket-item no-shadow ps-listline" style="clear:both">
										    <div class="pull-left gray ps-left-text">
										    	推送人员
										    </div>
											<div class="ticket-user pull-left ps-right-box">
												<span>${busRemind.userName}</span>
											</div>               
                                        </li>
                                         <li class="ticket-item no-shadow ps-listline" style="clear:both">
										    <div class="pull-left gray ps-left-text">
										    	催办时间
										    </div>
											<div class="ticket-user pull-left ps-right-box">
												${busRemind.recordCreateTime}
											</div>               
                                        </li>
                                        <li class="ticket-item no-shadow autoHeight no-padding" style="clear:both;border-bottom: 0px;">
										    <div class="pull-left gray ps-left-text padding-top-10">
										    	催办对象
										    </div>
											<div class="ticket-user pull-left ps-right-box" style="height: auto;width: 450px">
												<div class="pull-left gray ps-left-text padding-top-10">
													<c:choose>
														<c:when test="${not empty busRemind.listBusRemindUser }">
															<c:forEach items="${busRemind.listBusRemindUser }" var="remindUser" varStatus="vs">
																<span class="padding-left-5 pull-left">${remindUser.userName}</span>
															</c:forEach>
														</c:when>
													</c:choose>
												</div>
											</div>               
                                        </li>
                                        <li class="ticket-item no-shadow autoHeight no-padding" style="clear:both;border-top: 1px solid #ccc;" >
									    	<div class="pull-left gray ps-left-text padding-top-10">
									    		&nbsp;催办说明
									    	</div>
											<div class="ticket-user pull-left ps-right-box" style="width: 400px;height: auto;">
												<div class="margin-top-10 margin-bottom-10 margin-left-10"> 
													${busRemind.content}
												</div>
											</div> 
											<div class="ps-clear"></div>              
                                         </li>
                                   	</ul>
                                </div>
                            </div>
                          </div>
                           
                           <div class="widget radius-bordered">
                        	<div class="widget-header bg-bluegray no-shadow">
                            	<span class="widget-caption blue">关联模块</span>
                                <div class="widget-buttons btn-div-full">
                                	<a class="ps-point btn-a-full" data-toggle="collapse">
                                    	<i class="fa fa-minus blue"></i>
                                   </a>
                                 </div>
                             </div>
                            <div class="widget-body no-shadow">
                             	<div class="tickets-container bg-white">
									<ul class="tickets-list">
                                         
                                         <li class="ticket-item no-shadow ps-listline" style="clear:both">
										    <div class="pull-left gray ps-left-text">
										    	功能模块
										    </div>
											<div class="ticket-user pull-left ps-right-box">
												<c:choose>
													<c:when test="${busRemind.busType=='003'}">
														任务
													</c:when>
													<c:when test="${busRemind.busType=='005'}">
														项目
													</c:when>
													<c:when test="${busRemind.busType=='012'}">
														客户
													</c:when>
													<c:when test="${busRemind.busType=='022'}">
														审批
													</c:when>
													<c:when test="${busRemind.busType=='070'}">
														需求管理
													</c:when>
												</c:choose>
											</div>               
                                        </li>
                                         <li class="ticket-item no-shadow ps-listline" style="clear:both">
										    <div class="pull-left gray ps-left-text">
										    	名称
										    </div>
											<div class="ticket-user pull-left ps-right-box">
												<c:choose>
													<c:when test="${busRemind.busType!='0'}">
															${busRemind.busModName}
														<a style="cursor: pointer;font-size: 15px;color: #1c98dc"
															onclick="busRemindDetailView(${busRemind.busId},'${busRemind.busType}')">
														[查看]
														</a>
													</c:when>
													<c:otherwise>
															${busRemind.busTypeName}
													</c:otherwise>
												</c:choose>
											</div>               
                                        </li>
                                   	</ul>
                                </div>
                            </div>
                          </div>
                        </div>
					
					</div>
				</div>
			</div>
		</div>
		
		<script src="/static/assets/js/bootstrap.min.js"></script>
    <!--Beyond Scripts-->
    <script src="/static/assets/js/beyond.min.js"></script>
</body>
</html>
