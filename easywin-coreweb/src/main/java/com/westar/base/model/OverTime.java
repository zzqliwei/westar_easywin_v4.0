package com.westar.base.model;

import java.util.List;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.westar.base.annotation.DefaultFiled;
import com.westar.base.annotation.Filed;
import com.westar.base.annotation.Identity;
import com.westar.base.annotation.Table;

/** 
 * 加班记录表
 */
@Table
@JsonInclude(Include.NON_NULL)
public class OverTime {
	/** 
	* id主键
	*/
	@Identity
	private Integer id;
	/** 
	* 记录创建时间
	*/
	@DefaultFiled
	private String recordCreateTime;
	/** 
	* 企业编号
	*/
	@Filed
	private Integer comId;
	/** 
	* 流程实例化主键
	*/
	@Filed
	private Integer instanceId;
	/** 
	* 加班开始时间
	*/
	@Filed
	private String startTime;
	/** 
	* 加班结束时间
	*/
	@Filed
	private String endTime;
	/** 
	* 行政核实开始时间
	*/
	@Filed
	private String xzhsStartTime;
	/** 
	* 行政核实结束时间
	*/
	@Filed
	private String xzhsEndTime;
	/** 
	* 加班人
	*/
	@Filed
	private Integer creator;
	/** 
	* 业务状态标识符；0-默认状态；1审核通过；-1驳回数据
	*/
	@Filed
	private Integer status;
	/** 
	* 加班时长
	*/
	@Filed
	private String overTime;
	/** 
	* 行政核实加班时长
	*/
	@Filed
	private String xzhsOverTime;

	/****************以上主要为系统表字段********************/
	/** 
	* 出差审批流程名称
	*/
	private String flowName;
	/** 
	* 创建人名称
	*/
	private String creatorName;
	/** 
	* 流程状态
	*/
	private Integer flowState;
	/** 
	* 当前审批人主键
	*/
	private Integer executor;
	/** 
	* 审批人姓名
	*/
	private String executorName;
	/** 
	* 当前审批
	*/
	private List<UserInfo> listExecutor;
	/** 
	* 查询的时间起
	*/
	private String startDate;
	/** 
	* 查询的时间止
	*/
	private String endDate;
	/** 
	* 列表排序规则
	*/
	private String orderBy;
	/** 
	* 审批状态
	*/
	private Integer spState;
	/** 
	* 加班次数
	*/
	private Integer overTimeT;
	/** 
	* 加班总时长
	*/
	private String overTimeTotal;

	/****************以上为自己添加字段********************/
	/** 
	* id主键
	* @param id
	*/
	public void setId(Integer id) {
		this.id = id;
	}

	/** 
	* id主键
	* @return
	*/
	public Integer getId() {
		return id;
	}

	/** 
	* 记录创建时间
	* @param recordCreateTime
	*/
	public void setRecordCreateTime(String recordCreateTime) {
		this.recordCreateTime = recordCreateTime;
	}

	/** 
	* 记录创建时间
	* @return
	*/
	public String getRecordCreateTime() {
		return recordCreateTime;
	}

	/** 
	* 企业编号
	* @param comId
	*/
	public void setComId(Integer comId) {
		this.comId = comId;
	}

	/** 
	* 企业编号
	* @return
	*/
	public Integer getComId() {
		return comId;
	}

	/** 
	* 流程实例化主键
	* @param instanceId
	*/
	public void setInstanceId(Integer instanceId) {
		this.instanceId = instanceId;
	}

	/** 
	* 流程实例化主键
	* @return
	*/
	public Integer getInstanceId() {
		return instanceId;
	}

	/** 
	* 加班开始时间
	* @param startTime
	*/
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	/** 
	* 加班开始时间
	* @return
	*/
	public String getStartTime() {
		return startTime;
	}

	/** 
	* 加班结束时间
	* @param endTime
	*/
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	/** 
	* 加班结束时间
	* @return
	*/
	public String getEndTime() {
		return endTime;
	}

	/** 
	* 行政核实开始时间
	* @param xzhsStartTime
	*/
	public void setXzhsStartTime(String xzhsStartTime) {
		this.xzhsStartTime = xzhsStartTime;
	}

	/** 
	* 行政核实开始时间
	* @return
	*/
	public String getXzhsStartTime() {
		return xzhsStartTime;
	}

	/** 
	* 行政核实结束时间
	* @param xzhsEndTime
	*/
	public void setXzhsEndTime(String xzhsEndTime) {
		this.xzhsEndTime = xzhsEndTime;
	}

	/** 
	* 行政核实结束时间
	* @return
	*/
	public String getXzhsEndTime() {
		return xzhsEndTime;
	}

	/** 
	* 加班人
	* @param creator
	*/
	public void setCreator(Integer creator) {
		this.creator = creator;
	}

	/** 
	* 加班人
	* @return
	*/
	public Integer getCreator() {
		return creator;
	}

	/** 
	* 业务状态标识符；0-默认状态；1审核通过；-1驳回数据
	* @param status
	*/
	public void setStatus(Integer status) {
		this.status = status;
	}

	/** 
	* 业务状态标识符；0-默认状态；1审核通过；-1驳回数据
	* @return
	*/
	public Integer getStatus() {
		return status;
	}

	/** 
	* 出差审批流程名称
	* @return
	*/
	public String getFlowName() {
		return flowName;
	}

	/** 
	* 出差审批流程名称
	* @param flowName
	*/
	public void setFlowName(String flowName) {
		this.flowName = flowName;
	}

	/** 
	* 创建人名称
	* @return
	*/
	public String getCreatorName() {
		return creatorName;
	}

	/** 
	* 创建人名称
	* @param creatorName
	*/
	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	/** 
	* 流程状态
	* @return
	*/
	public Integer getFlowState() {
		return flowState;
	}

	/** 
	* 流程状态
	* @param flowState
	*/
	public void setFlowState(Integer flowState) {
		this.flowState = flowState;
	}

	/** 
	* 当前审批人主键
	* @return
	*/
	public Integer getExecutor() {
		return executor;
	}

	/** 
	* 当前审批人主键
	* @param executor
	*/
	public void setExecutor(Integer executor) {
		this.executor = executor;
	}

	/** 
	* 审批人姓名
	* @return
	*/
	public String getExecutorName() {
		return executorName;
	}

	/** 
	* 审批人姓名
	* @param executorName
	*/
	public void setExecutorName(String executorName) {
		this.executorName = executorName;
	}

	/** 
	* 当前审批
	* @return
	*/
	public List<UserInfo> getListExecutor() {
		return listExecutor;
	}

	/** 
	* 当前审批
	* @param listExecutor
	*/
	public void setListExecutor(List<UserInfo> listExecutor) {
		this.listExecutor = listExecutor;
	}

	/** 
	* 查询的时间起
	* @return
	*/
	public String getStartDate() {
		return startDate;
	}

	/** 
	* 查询的时间起
	* @param startDate
	*/
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	/** 
	* 查询的时间止
	* @return
	*/
	public String getEndDate() {
		return endDate;
	}

	/** 
	* 查询的时间止
	* @param endDate
	*/
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	/** 
	* 列表排序规则
	* @return
	*/
	public String getOrderBy() {
		return orderBy;
	}

	/** 
	* 列表排序规则
	* @param orderBy
	*/
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	/** 
	* 审批状态
	* @return
	*/
	public Integer getSpState() {
		return spState;
	}

	/** 
	* 审批状态
	* @param spState
	*/
	public void setSpState(Integer spState) {
		this.spState = spState;
	}

	/** 
	* 加班时长
	* @param overTime
	*/
	public void setOverTime(String overTime) {
		this.overTime = overTime;
	}

	/** 
	* 加班时长
	* @return
	*/
	public String getOverTime() {
		return overTime;
	}

	/** 
	* 行政核实加班时长
	* @param xzhsOverTime
	*/
	public void setXzhsOverTime(String xzhsOverTime) {
		this.xzhsOverTime = xzhsOverTime;
	}

	/** 
	* 行政核实加班时长
	* @return
	*/
	public String getXzhsOverTime() {
		return xzhsOverTime;
	}

	/** 
	* 加班次数
	* @return
	*/
	public Integer getOverTimeT() {
		return overTimeT;
	}

	/** 
	* 加班次数
	* @param overTimeT
	*/
	public void setOverTimeT(Integer overTimeT) {
		this.overTimeT = overTimeT;
	}

	/** 
	* 加班总时长
	* @return
	*/
	public String getOverTimeTotal() {
		return overTimeTotal;
	}

	/** 
	* 加班总时长
	* @param overTimeTotal
	*/
	public void setOverTimeTotal(String overTimeTotal) {
		this.overTimeTotal = overTimeTotal;
	}
}
