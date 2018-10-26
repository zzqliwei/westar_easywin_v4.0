<%@page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" errorPage="/WEB-INF/jsp/error/pageException.jsp"%>
<%@page import="com.westar.base.cons.SystemStrConstant"%><%@page import="com.westar.core.web.InitServlet"%>
<%@page import="com.westar.base.util.ConstantInterface"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@taglib prefix="fn" uri="/WEB-INF/tld/fn.tld"%>
<%@taglib prefix="fmt" uri="/WEB-INF/tld/fmt.tld"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
	<!-- Page Content -->
	<div class="page-content">
		<!-- Page Body -->
		<div class="page-body">

			<div class="row">
				<div class="col-md-12 col-xs-12 ">
					<div class="widget">
						<div class="widget-header ps-titleHeader bordered-bottom bordered-themeprimary">
							<div>
								<form action="/attence/listLeave" id="searchForm" class="subform">
								<input type="hidden" name="sid" value="${param.sid}">
									<input type="hidden" name="pager.pageSize" value="10">
									<input type="hidden" name="activityMenu" value="${param.activityMenu}">
									<input type="hidden" name="searchTab" value="${param.searchTab}">
									<input type="hidden" name="flowState" value="${leave.flowState}">
									<input type="hidden" name="flowName" value="${leave.flowName}">
									<input type="hidden" name="executor" value="${leave.executor}">
									<input type="hidden" name="executorName" value="${leave.executorName}">
									<input type="hidden" name="orderBy" value="${leave.orderBy}">
									<input type="hidden" name="creator" value="${leave.creator}">
									<input type="hidden" name="creatorName" value="${leave.creatorName}">
									<input type="hidden" name="spState" value="${leave.spState}">
									<div class="btn-group pull-left searchCond">
										<div class="table-toolbar ps-margin">
											<div class="btn-group">
												<a class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown" title="排序">
													<c:choose>
														<c:when test="${not empty leave.orderBy}">
															<font style="font-weight:bold;"> <c:if test="${leave.orderBy=='executor'}">按审批人</c:if> <c:if test="${leave.orderBy=='crTimeNewest'}">按创建时间(降序)</c:if> <c:if
																	test="${leave.orderBy=='crTimeOldest'}">按创建时间(升序)</c:if>
															</font>
														</c:when>
														<c:otherwise>排序</c:otherwise>
													</c:choose>
													<i class="fa fa-angle-down"></i>
												</a>
												<ul class="dropdown-menu dropdown-default">
													<li>
														<a href="javascript:void(0)" onclick="orderByClean()">不限条件</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="orderBy('executor');">按审批人</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="orderBy('crTimeNewest');">按创建时间(降序)</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="orderBy('crTimeOldest');">按创建时间(升序)</a>
													</li>
												</ul>
											</div>
										</div>
										<div class="table-toolbar ps-margin">
											<div class="btn-group">
												<a class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown" title="流程状态筛选">
													<c:choose>
														<c:when test="${not empty leave.flowState}">
															<font style="font-weight:bold;"> <c:if test="${leave.flowState==1}">审批中的</c:if> <c:if test="${leave.flowState==4}">审批完的</c:if> <c:if test="${leave.flowState==2}">待发起的</c:if>
															</font>
														</c:when>
														<c:otherwise>流程状态筛选</c:otherwise>
													</c:choose>
													<i class="fa fa-angle-down"></i>
												</a>
												<ul class="dropdown-menu dropdown-default">
													<li>
														<a href="javascript:void(0)" onclick="flowStateClean()">不限条件</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="selectByFlowState(1);">审批中的</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="selectByFlowState(4);">已完成的</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="selectByFlowState(2);">待发起的</a>
													</li>
												</ul>
											</div>
										</div>
										<div class="table-toolbar ps-margin">
											<div class="btn-group">
												<a class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown" title="审批结果筛选">
													<c:choose>
														<c:when test="${not empty leave.spState}">
															<font style="font-weight:bold;"> <c:if test="${leave.spState==0}">驳回</c:if> <c:if test="${leave.spState==1}">通过</c:if>
															</font>
														</c:when>
														<c:otherwise>审批结果筛选</c:otherwise>
													</c:choose>
													<i class="fa fa-angle-down"></i>
												</a>
												<ul class="dropdown-menu dropdown-default">
													<li>
														<a href="javascript:void(0)" onclick="spStateClean()">不限条件</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="selectBySpState(0);">驳回</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="selectBySpState(1);">通过</a>
													</li>
												</ul>
											</div>
										</div>
										<div class="table-toolbar ps-margin">
											<div class="btn-group">
												<a class="btn btn-default dropdown-toggle btn-xs" data-toggle="dropdown" title="当前审批人筛选">
													<c:choose>
														<c:when test="${not empty leave.executor}">
															<font style="font-weight:bold;">${leave.executorName}</font>
														</c:when>
														<c:otherwise>当前审批人筛选</c:otherwise>
													</c:choose>
													<i class="fa fa-angle-down"></i>
												</a>
												<ul class="dropdown-menu dropdown-default">
													<li>
														<a href="javascript:void(0)" onclick="userOneForUserIdCallBack('','executor','','')">不限条件</a>
													</li>
													<li>
														<a href="javascript:void(0)" onclick="userMoreForUserId('${param.sid}','executor');">人员选择</a>
													</li>
												</ul>
											</div>
										</div>
										<div style="float: left;width: 250px;display: none">
											<select list="listExecutor" listkey="id" listvalue="userName" id="executor_select" name="listExecutor.id" multiple="multiple" moreselect="true" style="width: 100%; height: 100px;">
												<c:forEach items="${leave.listExecutor }" var="obj" varStatus="vs">
													<option selected="selected" value="${obj.id }">${obj.userName }</option>
												</c:forEach>
											</select>
										</div>
										<div class="table-toolbar ps-margin">
											<div class="btn-group cond" id="moreCondition_Div">
												<a class="btn btn-default dropdown-toggle btn-xs" onclick="displayMoreCond('moreCondition_Div')">
													<c:choose>
														<c:when test="${not empty leave.startDate || not empty leave.endDate}">
															<font style="font-weight:bold;">筛选中</font>
														</c:when>
														<c:otherwise>
				                                            	更多
	                                            			</c:otherwise>
													</c:choose>
													<i class="fa fa-angle-down"></i>
												</a>
												<div class="dropdown-menu dropdown-default padding-bottom-10" style="min-width: 330px;">
													<div class="ps-margin ps-search padding-left-10">
														<span class="btn-xs">起止时间：</span>
														<input class="form-control dpd2 no-padding condDate" type="text" readonly="readonly" value="${leave.startDate}" id="startDate" name="startDate" placeholder="开始时间"
															onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate: '#F{$dp.$D(\'endDate\',{d:-0});}'})" />
														<span>~</span>
														<input class="form-control dpd2 no-padding condDate" type="text" readonly="readonly" value="${leave.endDate}" id="endDate" name="endDate" placeholder="结束时间"
															onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate: '#F{$dp.$D(\'startDate\',{d:+0});}'})" />
													</div>
													<div class="ps-clear padding-top-10" style="text-align: center;">
														<button type="submit" class="btn btn-primary btn-xs">查询</button>
														<button type="button" class="btn btn-default btn-xs margin-left-10" onclick="resetMoreCon('moreCondition_Div')">重置</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="batchOpt" style="display: none">
										<div class="btn-group pull-left">
											<c:if test="${empty delete}">
												<div class="table-toolbar ps-margin">
													<div class="btn-group">
														<a class="btn btn-default dropdown-toggle btn-xs" onclick="delSpFlow()"> 批量删除 </a>
													</div>
												</div>
											</c:if>
										</div>
									</div>
								</form>
								<div class="ps-margin ps-search searchCond">
									<span class="input-icon">
										<input id="searchFlowName" value="${leave.flowName}" class="form-control ps-input" type="text" placeholder="请输入关键字">
										<a href="#" class="ps-searchBtn"> <i class="glyphicon glyphicon-search circular danger"></i>
										</a>
									</span>
								</div>
								<c:if test="${empty add}">
									<div class="widget-buttons ps-widget-buttons">
										<button class="btn btn-info btn-primary btn-xs margin-left-5" type="button" name="addleave" onclick="javascript:void(0);">
											<i class="fa fa-plus"></i>请假申请
										</button>
									</div>
								</c:if>
							</div>
						</div>

						<c:choose>
							<c:when test="${not empty listLeave}">
								<div class="widget-body">
									<table class="table table-striped table-hover" id="editabledatatable">
										<thead>
											<tr role="row">
												<th class="text-center">序号</th>
												<th>事项名称</th>
												<th>流程状态</th>
												<th class="text-center">请假类型</th>
												<th class="text-center">请假时间</th>
												<th class="text-center">请假时长（小时）</th>
												<th class="text-center">当前审批人</th>
												<th class="center">审批结果</th>
												<th class="text-center">申请时间</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listLeave}" var="leaveVo" varStatus="vs">
												<tr class="optTr">
													<td class="text-center">
														<label class="optRowNum" style="display: block;width: 20px">${vs.count}</label>
													</td>
													<td>
														<a href="javascript:void(0);" onclick="viewSpFlow('${leaveVo.instanceId}');"> 
														<tags:cutString num="31">${leaveVo.flowName}</tags:cutString>
														</a>
													</td>
													<td class="text-center">
													<c:if test="${leaveVo.flowState==1}">
														<span class="green" style="font-weight:bold;">审批中</span>
													</c:if> 
													<c:if test="${leaveVo.flowState==2}">
														<span style="color:fuchsia;font-weight:bold;">草稿</span>
													</c:if> 
													<c:if test="${leaveVo.flowState==4}">
														<span class="red" style="font-weight:bold;">完结</span>
													</c:if>
												</td>
													<td class="text-center">
													${leaveVo.busType}
													</td>
													<td class="text-center no-padding-top no-padding-bottom">
														<span class="black">${leaveVo.startTime}</span>
														<br>
														<span class="gray">${leaveVo.endTime}</span>
													</td>
													<td class="text-center">
													${leaveVo.leaveTime}
													</td>
													<td class="text-center">
													<div class="ticket-user pull-left other-user-box">
														<c:choose>
															<c:when test="${leaveVo.flowState==2 || leaveVo.flowState==4}">
									 							--
									 						</c:when>
															<c:otherwise>
																<div class="ticket-user pull-left other-user-box" data-container="body" data-placement="left" data-toggle="popover">
																	<img class="user-avatar" src="/downLoad/userImg/${userInfo.comId}/${leaveVo.executor}?sid=${param.sid}" title="${leaveVo.executorName}" />
																	<i class="user-name">${leaveVo.executorName}</i>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</td>
													<td class="text-center">
													<c:choose>
														<c:when test="${leaveVo.flowState==4 }">
															<c:if test="${leaveVo.spState==0}">
																<span class="red" style="font-weight:bold;">驳回</span>
															</c:if>
															<c:if test="${leaveVo.spState==1}">
																<span class="green" style="font-weight:bold;">通过</span>
															</c:if>
														</c:when>
														<c:otherwise>
															--
														</c:otherwise>
													</c:choose>
												</td>
													<td>${leaveVo.recordCreateTime}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<tags:pageBar url="/attence/listLeave"></tags:pageBar>
								</div>
							</c:when>
							<c:otherwise>
								<div class="widget-body" style="height:550px; text-align:center;padding-top:160px">
									<section class="error-container text-center">
										<h1>
											<i class="fa fa-exclamation-triangle"></i>
										</h1>
										<div class="error-divider">
											<h2>没有相关数据！</h2>
											<p class="description">协同提高效率，分享拉近距离。</p>
										</div>
									</section>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<!-- /Page Body -->
		</div>
		<!-- /Page Content -->

	</div>
	<!-- /Page Container -->
	<script type="text/javascript">
		$(function(){
			$(".subform").Validform({
				tiptype : function(msg, o, cssctl) {
					validMsg(msg, o, cssctl);
				},
				showAllError : true
			});
			$("[name='addleave']").click(function(){//发起请假
				listBusMapFlows('036',function(busMapFlow){
					var url = "/busRelateSpFlow/attence/addLeaveApply?sid=${param.sid}";
					url = url+"&busMapFlowId="+busMapFlow.id;
					url = url+"&busType=036";
					openWinByRight(url);
					
				})
			});
			
		})
	</script>
</body>
</html>
