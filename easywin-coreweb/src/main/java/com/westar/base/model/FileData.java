package com.westar.base.model;

import com.westar.base.annotation.DefaultFiled;
import com.westar.base.annotation.Filed;
import com.westar.base.annotation.Identity;
import com.westar.base.annotation.Table;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

/** 
 * 附件文件信息
 */
@Table
@JsonInclude(Include.NON_NULL)
public class FileData {
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
	* 关联upfiles主键
	*/
	@Filed
	private Integer upfilesId;
	/** 
	* 附件后缀
	*/
	@Filed
	private String fileExt;
	/** 
	* 文件名
	*/
	@Filed
	private String filename;
	/** 
	* 保存路径
	*/
	@Filed
	private String filepath;
	/** 
	* 文件大小(字节)
	*/
	@Filed
	private Integer sizeb;
	/** 
	* 文件大小(G、M、K)
	*/
	@Filed
	private String sizem;
	/** 
	* uuid
	*/
	@Filed
	private String uuid;
	/** 
	* md5
	*/
	@Filed
	private String md5;

	/****************以上主要为系统表字段********************/

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
	* 关联upfiles主键
	* @param upfilesId
	*/
	public void setUpfilesId(Integer upfilesId) {
		this.upfilesId = upfilesId;
	}

	/** 
	* 关联upfiles主键
	* @return
	*/
	public Integer getUpfilesId() {
		return upfilesId;
	}

	/** 
	* 附件后缀
	* @param fileExt
	*/
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}

	/** 
	* 附件后缀
	* @return
	*/
	public String getFileExt() {
		return fileExt;
	}

	/** 
	* 文件名
	* @param filename
	*/
	public void setFilename(String filename) {
		this.filename = filename;
	}

	/** 
	* 文件名
	* @return
	*/
	public String getFilename() {
		return filename;
	}

	/** 
	* 保存路径
	* @param filepath
	*/
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	/** 
	* 保存路径
	* @return
	*/
	public String getFilepath() {
		return filepath;
	}

	/** 
	* 文件大小(字节)
	* @param sizeb
	*/
	public void setSizeb(Integer sizeb) {
		this.sizeb = sizeb;
	}

	/** 
	* 文件大小(字节)
	* @return
	*/
	public Integer getSizeb() {
		return sizeb;
	}

	/** 
	* 文件大小(G、M、K)
	* @param sizem
	*/
	public void setSizem(String sizem) {
		this.sizem = sizem;
	}

	/** 
	* 文件大小(G、M、K)
	* @return
	*/
	public String getSizem() {
		return sizem;
	}

	/** 
	* uuid
	* @param uuid
	*/
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	/** 
	* uuid
	* @return
	*/
	public String getUuid() {
		return uuid;
	}

	/** 
	* md5
	* @param md5
	*/
	public void setMd5(String md5) {
		this.md5 = md5;
	}

	/** 
	* md5
	* @return
	*/
	public String getMd5() {
		return md5;
	}
}
