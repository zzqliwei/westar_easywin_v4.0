package com.westar.base.model;

import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.westar.base.annotation.DefaultFiled;
import com.westar.base.annotation.Filed;
import com.westar.base.annotation.Identity;
import com.westar.base.annotation.Table;

/** 
 * 审批附件
 */
@Table
@JsonInclude(Include.NON_NULL)
public class SpFlowUpfile implements Serializable {
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
	private Integer busId;
	/** 
	* 关联upfiles主键
	*/
	@Filed
	private Integer upfileId;
	/** 
	* 引擎任务关键字
	*/
	@Filed
	private String actUserTaskId;
	/** 
	* 附件上传人
	*/
	@Filed
	private Integer userId;
	/** 
	* 添加类型0流程附件，1表单附件,2审批留言附件 3记账附件
	*/
	@Filed
	private Integer addType;
	/** 
	* 业务类型
	*/
	@Filed
	private String busType;
	/** 
	* 表单控件主键
	*/
	@Filed
	private Integer formColKey;

	/****************以上主要为系统表字段********************/
	/** 
	* 附件UUID
	*/
	private String uuid;
	/** 
	* 附件名称
	*/
	private String filename;
	/** 
	* 附件后缀
	*/
	private String fileExt;
	/** 
	* 0女1男
	*/
	private String gender;
	private String creatorName;
	/** 
	* 上传人头像uuid
	*/
	private String userUuid;
	/** 
	* 上传人头像名称
	*/
	private String userFileName;
	/** 
	* 附件来源的任务名称
	*/
	private String actUserTaskName;

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
	* @param busId
	*/
	public void setBusId(Integer busId) {
		this.busId = busId;
	}

	/** 
	* 流程实例化主键
	* @return
	*/
	public Integer getBusId() {
		return busId;
	}

	/** 
	* 关联upfiles主键
	* @param upfileId
	*/
	public void setUpfileId(Integer upfileId) {
		this.upfileId = upfileId;
	}

	/** 
	* 关联upfiles主键
	* @return
	*/
	public Integer getUpfileId() {
		return upfileId;
	}

	/** 
	* 引擎任务关键字
	* @param actUserTaskId
	*/
	public void setActUserTaskId(String actUserTaskId) {
		this.actUserTaskId = actUserTaskId;
	}

	/** 
	* 引擎任务关键字
	* @return
	*/
	public String getActUserTaskId() {
		return actUserTaskId;
	}

	/** 
	* 附件上传人
	* @param userId
	*/
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/** 
	* 附件上传人
	* @return
	*/
	public Integer getUserId() {
		return userId;
	}

	/** 
	* 附件UUID
	* @return
	*/
	public String getUuid() {
		return uuid;
	}

	/** 
	* 附件UUID
	* @param uuid
	*/
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	/** 
	* 附件名称
	* @return
	*/
	public String getFilename() {
		return filename;
	}

	/** 
	* 附件名称
	* @param filename
	*/
	public void setFilename(String filename) {
		this.filename = filename;
	}

	/** 
	* 附件后缀
	* @return
	*/
	public String getFileExt() {
		return fileExt;
	}

	/** 
	* 附件后缀
	* @param fileExt
	*/
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	/** 
	* 0女1男
	* @return
	*/
	public String getGender() {
		return gender;
	}

	/** 
	* 0女1男
	* @param gender
	*/
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	/** 
	* 上传人头像uuid
	* @return
	*/
	public String getUserUuid() {
		return userUuid;
	}

	/** 
	* 上传人头像uuid
	* @param userUuid
	*/
	public void setUserUuid(String userUuid) {
		this.userUuid = userUuid;
	}

	/** 
	* 上传人头像名称
	* @return
	*/
	public String getUserFileName() {
		return userFileName;
	}

	/** 
	* 上传人头像名称
	* @param userFileName
	*/
	public void setUserFileName(String userFileName) {
		this.userFileName = userFileName;
	}

	/** 
	* 附件来源的任务名称
	* @return
	*/
	public String getActUserTaskName() {
		return actUserTaskName;
	}

	/** 
	* 附件来源的任务名称
	* @param actUserTaskName
	*/
	public void setActUserTaskName(String actUserTaskName) {
		this.actUserTaskName = actUserTaskName;
	}

	/** 
	* 添加类型0流程附件，1表单附件,2审批留言附件 3记账附件
	* @param addType
	*/
	public void setAddType(Integer addType) {
		this.addType = addType;
	}

	/** 
	* 添加类型0流程附件，1表单附件,2审批留言附件 3记账附件
	* @return
	*/
	public Integer getAddType() {
		return addType;
	}

	/** 
	* 业务类型
	* @param busType
	*/
	public void setBusType(String busType) {
		this.busType = busType;
	}

	/** 
	* 业务类型
	* @return
	*/
	public String getBusType() {
		return busType;
	}

	/** 
	* 表单控件主键
	* @return
	*/
	public Integer getFormColKey() {
		return formColKey;
	}

	/** 
	* 表单控件主键
	* @param formColKey
	*/
	public void setFormColKey(Integer formColKey) {
		this.formColKey = formColKey;
	}
}
