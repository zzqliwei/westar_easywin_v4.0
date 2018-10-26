package com.westar.base.model;

import com.westar.base.annotation.DefaultFiled;
import com.westar.base.annotation.Filed;
import com.westar.base.annotation.Identity;
import com.westar.base.annotation.Table;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/** 
 * 任务模块日志表
 */
@Table
@JsonInclude(Include.NON_NULL)
public class MsgShareLog {
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
	* 分享信息主键
	*/
	@Filed
	private Integer msgId;
	/** 
	* 操作者id
	*/
	@Filed
	private Integer userId;
	/** 
	* 操作内容
	*/
	@Filed
	private String content;
	/** 
	* 操作者姓名
	*/
	@Filed
	private String userName;

	/****************以上主要为系统表字段********************/
	public MsgShareLog() {
	}

	/** 
	* * * * @param comId 企业编号 * @param msgId 信息主键 * @param userId 发言人主键 * @param userName 发言人姓名 * @param content 日志内容 		
	*/
	public MsgShareLog(Integer comId, Integer msgId, Integer userId, String content, String userName) {
		super();
		this.comId = comId;
		this.msgId = msgId;
		this.userId = userId;
		this.content = content;
		this.userName = userName;
	}

	private String speakerName;
	/** 
	* 附件名称
	*/
	private String filename;
	/** 
	* 附件UUID
	*/
	private String uuid;
	/** 
	* 0女1男
	*/
	private String gender;

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
	* 分享信息主键
	* @param msgId
	*/
	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}

	/** 
	* 分享信息主键
	* @return
	*/
	public Integer getMsgId() {
		return msgId;
	}

	/** 
	* 操作者id
	* @param userId
	*/
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	/** 
	* 操作者id
	* @return
	*/
	public Integer getUserId() {
		return userId;
	}

	/** 
	* 操作内容
	* @param content
	*/
	public void setContent(String content) {
		this.content = content;
	}

	/** 
	* 操作内容
	* @return
	*/
	public String getContent() {
		return content;
	}

	/** 
	* 操作者姓名
	* @param userName
	*/
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/** 
	* 操作者姓名
	* @return
	*/
	public String getUserName() {
		return userName;
	}

	public String getSpeakerName() {
		return speakerName;
	}

	public void setSpeakerName(String speakerName) {
		this.speakerName = speakerName;
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
}
