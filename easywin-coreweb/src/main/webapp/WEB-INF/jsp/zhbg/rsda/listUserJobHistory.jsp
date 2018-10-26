<%@page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" errorPage="/WEB-INF/jsp/error/pageException.jsp"%>
<%@page import="com.westar.base.cons.SystemStrConstant"%><%@page import="com.westar.core.web.InitServlet"%>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@taglib prefix="fn" uri="/WEB-INF/tld/fn.tld"%>
<%@taglib prefix="fmt" uri="/WEB-INF/tld/fmt.tld"%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="renderer" content="webkit">
<title><%=SystemStrConstant.TITLE_NAME %></title>
<jsp:include page="/WEB-INF/jsp/include/static_assets.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/include/static.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/include/showNotification.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$("body").on("click",".viewJobHis",function(){
		var jobHisId = $(this).attr("busId");
		var url = "/jobHistory/viewJobHistoryPage?sid=${param.sid}&jobHisId="+jobHisId;
		var height = $(window.parent).height();
		window.top.layer.open({
			  type: 2,
			  title: false,
			  closeBtn: 0,
			  shadeClose: true,
			  shade: 0.1,
			  shift:0,
			  fix: true, //固定
			  maxmin: false,
			  move: false,
			  area: ['800px', height+'px'],
			  content: [url,"no"] //iframe的url
			});
	})
	$("body").on("click",".updateJobHis",function(){
		var jobHisId = $(this).attr("busId");
		var url = "/jobHistory/updateJobHistoryPage?sid=${param.sid}&iframeTag=yes&jobHisId="+jobHisId;
		var height = $(window.parent).height();
		window.top.layer.open({
			  type: 2,
			  title: false,
			  closeBtn: 0,
			  shadeClose: true,
			  shade: 0.1,
			  shift:0,
			  fix: true, //固定
			  maxmin: false,
			  move: false,
			  area: ['800px', height+'px'],
			  content: [url,"no"], //iframe的url
			  success: function(layero,index){
				var iframeWin = window.top.window[layero.find('iframe')[0]['name']];
				iframeWin.setWindow(window,index);
			  }
			});
	})
})

//操作函数
function doCloseFun(type){
	window.self.location.reload();
}
</script>
</head>
<body onload="resizeVoteH('${param.ifreamName}');" style="background-color:#FFFFFF;">
<div class="widget-body">
    	<table class="table table-striped table-hover general-table">
         	<thead>
            	<tr>
                    <th width="8%" valign="middle">序号</th>
                    <th valign="middle">工作单位</th>
					<th valign="middle" class="hidden-phone">担任职务</th>
					<th valign="middle">证明人</th>
					<th valign="middle">开始时间</th>
					<th valign="middle">截止时间</th>
					<th valign="middle">操作</th>
                </tr>
           </thead>
           <tbody>
           	<c:choose>
			 	<c:when test="${not empty listJobHistory}">
			 		<c:forEach items="${listJobHistory}" var="jobHisVo" varStatus="vs">
			           	<tr class="optTr">
								<td class="optTd" style="height: 47px">
									<label class="optRowNum"
										style="display: block;width: 20px">${vs.count}</label>
									</td>
								<td>
									${jobHisVo.componName}
								</td>
								<td>
									${jobHisVo.dutyed}
								</td>
								<td>
									${jobHisVo.retereName}
								</td>
								<td>
									${jobHisVo.startDate}
								</td>
								<td>
									${empty jobHisVo.endDate?'至今':jobHisVo.endDate}
								</td>
								<td>
									<c:if test="${not empty param.editState}">
										<a href="javascript:void(0)" busId="${jobHisVo.id}" class="updateJobHis">编辑</a>
										|
									</c:if>
									<a href="javascript:void(0)" busId="${jobHisVo.id}" class="viewJobHis">查看</a>
								</td>
								
							</tr>
			 		</c:forEach>
			 	</c:when>
			 	<c:otherwise>
			 		<tr>
			 			<td height="30" colspan="7" align="center"><h3>没有工作经历数据！</h3></td>
			 		</tr>
			 	</c:otherwise>
			 </c:choose>
        	</tbody>
    	</table>
	</div>
<tags:pageBar url="/jobHistory/listPagedUserJobHistory"></tags:pageBar>
<%--用与测量当前页面的高度 --%>
<jsp:include page="/bottomdiv.jsp"></jsp:include>
</body>
</html>
