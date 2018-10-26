<%@page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"
	errorPage="/WEB-INF/jsp/error/pageException.jsp"%>
<%@page import="com.westar.base.cons.SystemStrConstant"%><%@page import="com.westar.core.web.InitServlet"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@taglib prefix="fn" uri="/WEB-INF/tld/fn.tld"%>
<%@taglib prefix="fmt" uri="/WEB-INF/tld/fmt.tld"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="renderer" content="webkit">
<title><%=SystemStrConstant.TITLE_NAME%></title>
<!-- 框架样式 -->
<jsp:include page="/WEB-INF/jsp/include/static_assets.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/include/static.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/include/showNotification.jsp"></jsp:include>
<link href="/static/assets/css/task.css" rel="stylesheet" type="text/css">
<script src="/static/js/taskJs/taskCenter.js?version=<%=InitServlet.SYSTEM_STARUP_TIME%>" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var sid="${param.sid}"
//打开页面body
var openWindowDoc;
//打开页面,可调用父页面script
var openWindow;
//打开页面的标签
var openPageTag;
//打开页面的标签
var openTabIndex;
//注入父页面信息
function setWindow(winDoc,win){
	openWindowDoc = winDoc;
	openWindow = win;
	openPageTag = openWindow.pageTag;
	openTabIndex = openWindow.tabIndex;
}
//关闭窗口
function closeWin(){
	var winIndex = window.top.layer.getFrameIndex(window.name);
	closeWindow(winIndex);
}
//autoCompleteCallBack回调对象标识
var autoCompleteCallBackVar =null;
$(function(){
	//设置滚动条高度
	var height = $(window).height()-40;
	$("#contentBody").css("height",height+"px");
	//任务描述的图片查看
	var imgArray = $("#comment").find("img");
	$.each(imgArray,function(index,item){
		var src = $(this).attr("src");
		$(this).click(function(){
			window.top.viewOrgByPath(src);
		})
	})
	
	$("body").on("click",".jfzbViewBtn",function(){
		var jfzbId = $(this).attr("jfzbId");
		var _this = $(this);
		//查看积分标准
		jfzbDetailView(jfzbId);
	})
	
});

//任务属性菜单切换
$(function(){
	//任务详情
	$("body").on("click","#taskScoreMenuLi",function(){
		$("#otherTaskAttrIframe").css("display","none");
		$("#taskScore").css("display","block");
		$("#taskBase").css("display","none");
		$("#taskTalkMenuLi").parent().find("li").removeAttr("class");
		$("#taskScoreMenuLi").attr("class","active");
	})
	//任务详情
	$("body").on("click","#taskbaseMenuLi",function(){
		$("#otherTaskAttrIframe").css("display","none");
		$("#taskScore").css("display","none");
		$("#taskBase").css("display","block");
		$("#taskTalkMenuLi").parent().find("li").removeAttr("class");
		$("#taskbaseMenuLi").attr("class","active");
	})
	//任务讨论
	$("body").on("click","#taskTalkMenuLi,#headTaskTalk",function(){
		$("#otherTaskAttrIframe").css("display","block");
		$("#taskScore").css("display","none");
		$("#taskBase").css("display","none");
		$("#taskTalkMenuLi").parent().find("li").removeAttr("class");
		$("#taskTalkMenuLi").attr("class","active");
		$("#otherTaskAttrIframe").attr("src","/task/taskTalkPage?sid=${param.sid}&pager.pageSize=10&taskId=${task.id}&taskState=${task.state}");
	})
	
	//移交记录
	$("body").on("click","#taskFlowRecordLi",function(){
		$("#otherTaskAttrIframe").css("display","block");
		$("#taskScore").css("display","none");
		$("#taskBase").css("display","none");
		$(this).parent().find("li").removeAttr("class");
		$("#taskFlowRecordLi").attr("class","active");
		$("#otherTaskAttrIframe").attr("src","/task/taskFlowRecord?sid=${param.sid}&taskId=${task.id}");
		
	})
	//任务日志
	$("body").on("click","#taskLogMenuLi",function(){
		$("#otherTaskAttrIframe").css("display","block");
		$("#taskScore").css("display","none");
		$("#taskBase").css("display","none");
		$(this).parent().find("li").removeAttr("class");
		$("#taskLogMenuLi").attr("class","active");
		$("#otherTaskAttrIframe").attr("src","/common/listLog?sid=${param.sid}&pager.pageSize=10&busId=${task.id}&busType=003&ifreamName=otherTaskAttrIframe");
	})
	//任务附件
	$("body").on("click","#taskUpfileMenuLi",function(){
		$("#otherTaskAttrIframe").css("display","block");
		$("#taskScore").css("display","none");
		$("#taskBase").css("display","none");
		$(this).parent().find("li").removeAttr("class");
		$("#taskUpfileMenuLi").attr("class","active");
		$("#otherTaskAttrIframe").attr("src","/task/taskUpfilePage?sid=${param.sid}&pager.pageSize=10&taskId=${task.id}");
		
	})
	//任务浏览记录
	$("body").on("click","#taskViewRecord",function(){
		$("#otherTaskAttrIframe").css("display","block");
		$("#taskScore").css("display","none");
		$("#taskBase").css("display","none");
		$(this).parent().find("li").removeAttr("class");
		$("#taskViewRecord").attr("class","active");
		$("#otherTaskAttrIframe").attr("src","/common/listViewRecord?sid=${param.sid}&busId=${task.id}&busType=003&ifreamName=otherTaskAttrIframe");
		
	})
	//查看关联
	$("body").on("click",".relateClz",function(){
		var actObj = $(this);
		var busId = $(actObj).attr("busId");
		var busType = $(actObj).attr("busType");
		authCheck(busId,busType,-1,function(authState){
			var url = "";
			if(busType=='005'){
				url = "/item/viewItemPage?sid="+sid+"&id="+busId;
			}else if(busType=='012'){
				url = "/crm/viewCustomer?sid="+sid+"&id="+busId;
			}else if(busType=='003'){
				url = "/task/viewTask?sid="+sid+"&id="+busId;
			}
			openWinWithPams(url,"800px",($(window).height()-90)+"px");
		})
	});
	
	
});
</script>
</head>
<body>
	<div class="container" style="padding: 0px 0px;width: 100%">	
		<div class="row" style="margin: 0 0">
			<div class="col-lg-12 col-sm-12 col-xs-12" style="padding: 0px 0px">
            	<div class="widget" style="margin-top: 0px;" >
                	<div class="widget-header bordered-bottom bordered-themeprimary detailHead">
                        <span class="widget-caption themeprimary" style="font-size: 20px">任务</span>
                        <span class="widget-caption themeprimary" style="font-size: 15px;margin-top: 2px">
                        	<c:choose>
                        		<c:when test="${fn:length(task.taskName)>20 }">
		                        	--${fn:substring(task.taskName,0,20)}..
                        		</c:when>
                        		<c:otherwise>
                        			--${task.taskName}
                        		</c:otherwise>
                        	</c:choose>
                        </span>
                        <div class="widget-buttons">
							<a href="javascript:void(0)" onclick="closeWin()" title="关闭">
								<i class="fa fa-times themeprimary"></i>
							</a>
						</div>
                     </div><!--Widget Header-->
                      <!-- id="contentBody" 是必须的，用于调整滚动条高度 -->           
                     <div class="widget-body margin-top-40" id="contentBody" style="overflow: hidden;overflow-y:scroll;">
                           <div class="widget-body no-shadow">
                           		<div class="widget-main ">
                                	 <div class="tabbable">
                                      	<ul class="nav nav-tabs tabs-flat" id="myTab11" style="padding-top:0;">
                                             <li class="active" id="taskScoreMenuLi">
                                                 <a data-toggle="tab" href="javascript:void(0)">任务评分</a>
                                             </li>
                                             <li id="taskbaseMenuLi">
                                                 <a data-toggle="tab" href="javascript:void(0)">任务详情</a>
                                             </li>
                                             <li id="taskTalkMenuLi">
                                                 <a data-toggle="tab" href="javascript:void(0)">任务留言<c:if test="${task.msgNum > 0}"><span style="color:red;font-weight:bold;">（${task.msgNum}）</span></c:if></a>
                                             </li>
                                             <li id="taskUpfileMenuLi">
                                                 <a data-toggle="tab" href="javascript:void(0)">任务文档<c:if test="${task.docNum > 0}"><span style="color:red;font-weight:bold;">（${task.docNum}）</span></c:if></a>
                                             </li>
                                             <li id="taskLogMenuLi">
                                                 <a data-toggle="tab" href="javascript:void(0)">操作日志</a>
                                             </li>
                                             <%--<li id="taskFlowRecordLi">--%>
                                                 <%--<a data-toggle="tab" href="javascript:void(0)">协办记录</a>--%>
                                             <%--</li>--%>
                                             <%--<li id="taskViewRecord">--%>
                                                 <%--<a data-toggle="tab" href="javascript:void(0)">最近查看</a>--%>
                                             <%--</li>--%>
                                    	</ul>
                                    	 <div class="tab-content tabs-flat">
                                    	 	<div id="taskScore" style="display:block;">
                                    	 		<!-- 任务推送人员 -->
													<div class="widget no-header">
										                <div class="widget-body bordered-radius">
										                    <div class="task-describe clearfix">
										                        <div class="tickets-container tickets-bg tickets-pd clearfix">
										                            <ul class="tickets-list clearfix">
											                                <li>
											                                <table width="100%" cellspacing="0" cellpadding="0" border="0" id="jfScoreList">
											                                	<thead>
																					<tr class="padding-top-10">
																						<th width="10%" class="text-center">序号</th>
																						<th width="15%">办理人</th>
																						<th width="10%">得分上限</th>
																						<th width="10%">得分下限</th>
																						<th width="10%">得分</th>
																						<th width="15%">评分意见</th>
																						<th >评分描述 </th>
																					</tr>
																				</thead>
																				<tbody>
																					<c:choose>
																						<c:when test="${not empty listJfScores }">
																							<c:forEach items="${listJfScores }" var="jfScoreObj" varStatus="vs">
																								<tr style="height: 45px;clear:both;${vs.first?'':'border-top:1px dashed #ccc;'} " 
																									dfUserId="${jfScoreObj.dfUserId}">
															                                        <td class="text-center">${vs.count}</td>
															                                        <td class="text-center">
															                                            <div class="ticket-item no-shadow clearfix ticket-normal">
															                                                <div class="ticket-user pull-left no-padding">
															                                                	<img src="/downLoad/userImg/${userInfo.comId }/${jfScoreObj.dfUserId}"
																													class="user-avatar userImg" title="${jfScoreObj.dfUserName}" />
																												<span class="user-name">${jfScoreObj.dfUserName}</span>
															                                                </div>
															                                            </div>
															                                        </td>
															                                        <td>
															                                        	<c:choose>
															                                        		<c:when test="${empty jfScoreObj.jfzbId }">
															                                        			--
															                                        		</c:when>
															                                        		<c:when test="${jfScoreObj.jfzbId eq 0}">
															                                        			--
															                                        		</c:when>
															                                        		<c:otherwise>
															                                        			${jfScoreObj.jfTop}分
															                                        		</c:otherwise>
															                                        	</c:choose>
																									</td>
															                                        <td>
															                                        	<c:choose>
															                                        		<c:when test="${empty jfScoreObj.jfzbId }">
															                                        			--
															                                        		</c:when>
															                                        		<c:when test="${jfScoreObj.jfzbId eq 0}">
															                                        			--
															                                        		</c:when>
															                                        		<c:otherwise>
															                                        			${jfScoreObj.jfBottom}分
															                                        		</c:otherwise>
															                                        	</c:choose>
															                                        	
															                                        </td>
															                                        <td>
															                                        	<c:choose>
															                                        		<c:when test="${empty jfScoreObj.jfzbId }">
															                                        			--
															                                        		</c:when>
															                                        		<c:when test="${jfScoreObj.jfzbId eq 0}">
															                                        			0分
															                                        		</c:when>
															                                        		<c:otherwise>
															                                        			${jfScoreObj.score}分
															                                        		</c:otherwise>
															                                        	</c:choose>
															                                        	
															                                      	</td>
															                                      	<td>
															                                      		<c:choose>
															                                      			<c:when test="${jfScoreObj.jfzbId gt 0}">
																	                                        	<button class="btn btn-info btn-primary btn-xs jfzbViewBtn" type="button" jfzbId="${jfScoreObj.jfzbId}">
																													<c:choose>
																		                                        		<c:when test="${empty jfScoreObj.jfzbId }">
																		                                        			评分标准
																		                                        		</c:when>
																		                                        		<c:when test="${jfScoreObj.jfzbId eq 0}">
																		                                        			评分标准
																		                                        		</c:when>
																		                                        		<c:otherwise>
																		                                        			${jfScoreObj.jfzbTypeName}
																		                                        		</c:otherwise>
																		                                        	</c:choose>
																												</button>
															                                      			</c:when>
															                                      			<c:when test="${jfScoreObj.jfzbId eq 0 }">
															                                      				不评分
															                                      			</c:when>
															                                      			<c:otherwise>
															                                      				未评分
															                                      			</c:otherwise>
															                                      			
															                                      		</c:choose>
															                                        </td>
															                                        <td>
															                                        	<c:choose>
															                                        		<c:when test="${not empty jfScoreObj.remark }">
																	                                        	${jfScoreObj.remark}
															                                        		</c:when>
															                                        		<c:otherwise>
															                                        			--
															                                        		</c:otherwise>
															                                        	</c:choose>
															                                        </td>
															                                      </tr>
																							</c:forEach>
																						</c:when>
																					
																					</c:choose>
																				</tbody>
																			</table>
											                                </li>
										                               </ul>
									                              </div>
								                             </div>
							                            </div>
						                            </div>
											</div>
                                    	 	<div id="taskBase" style="display:none;">
												<jsp:include page="/WEB-INF/jsp/task/taskBase_view.jsp"></jsp:include>
											</div>
                                    	 	<iframe id="otherTaskAttrIframe" style="display:none;" class="layui-layer-load"
												src="/task/taskTalkPage?sid=${param.sid}&pager.pageSize=10&taskId=${task.id}&taskState=${task.state}"
												border="0" frameborder="0" allowTransparency="true"
												noResize  scrolling="no" width=100% height=100% vspale="0"></iframe>
                                    	 </div>
                                	</div>
                            	</div>
                            </div> 
                        </div>
					</div>
				</div>
			</div>
		</div>
	<script src="/static/assets/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript">var jq11 = $.noConflict(true);</script>
    <script src="/static/assets/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="/static/assets/js/beyond.min.js"></script>
</body>
</html>
