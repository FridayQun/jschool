package com.chengan.business.repo.model;

import javax.persistence.*;

@Table(name = "jk_file")
public class JkFile {
	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	/**
	 * 用户ID
	 */
	private Integer uid;

	/**
	 * 其他用到文件的表相关联的ID，与类型构成联合索引
	 */
	private Integer fid;

	/**
	 * 文件类型,0表示文章缩略图，1表示文章原图，2表示其他缩略图，3表示其他原图
	 */
	private Integer type;

	/**
	 * 文件名称
	 */
	@Column(name = "file_name")
	private String fileName;

	/**
	 * 文件路径
	 */
	@Column(name = "file_path")
	private String filePath;

	/**
	 * 文件描述
	 */
	@Column(name = "file_desc")
	private String fileDesc;

	/**
	 * 获取主键
	 *
	 * @return id - 主键
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * 设置主键
	 *
	 * @param id
	 *            主键
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * 获取用户ID
	 *
	 * @return uid - 用户ID
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * 设置用户ID
	 *
	 * @param uid
	 *            用户ID
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * 获取其他用到文件的表相关联的ID，与类型构成联合索引
	 *
	 * @return fid - 其他用到文件的表相关联的ID，与类型构成联合索引
	 */
	public Integer getFid() {
		return fid;
	}

	/**
	 * 设置其他用到文件的表相关联的ID，与类型构成联合索引
	 *
	 * @param fid
	 *            其他用到文件的表相关联的ID，与类型构成联合索引
	 */
	public void setFid(Integer fid) {
		this.fid = fid;
	}

	/**
	 * 获取文件类型,0表示文章缩略图，1表示文章原图，2表示其他缩略图，3表示其他原图
	 *
	 * @return type - 文件类型,0表示文章缩略图，1表示文章原图，2表示其他缩略图，3表示其他原图
	 */
	public Integer getType() {
		return type;
	}

	/**
	 * 设置文件类型,0表示文章缩略图，1表示文章原图，2表示其他缩略图，3表示其他原图
	 *
	 * @param type
	 *            文件类型,0表示文章缩略图，1表示文章原图，2表示其他缩略图，3表示其他原图
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 获取文件名称
	 *
	 * @return file_name - 文件名称
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * 设置文件名称
	 *
	 * @param fileName
	 *            文件名称
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * 获取文件路径
	 *
	 * @return file_path - 文件路径
	 */
	public String getFilePath() {
		return filePath;
	}

	/**
	 * 设置文件路径
	 *
	 * @param filePath
	 *            文件路径
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	/**
	 * 获取文件描述
	 *
	 * @return file_desc - 文件描述
	 */
	public String getFileDesc() {
		return fileDesc;
	}

	/**
	 * 设置文件描述
	 *
	 * @param fileDesc
	 *            文件描述
	 */
	public void setFileDesc(String fileDesc) {
		this.fileDesc = fileDesc;
	}
}