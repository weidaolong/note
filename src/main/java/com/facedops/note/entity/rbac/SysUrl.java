package com.facedops.note.entity.rbac;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.search.annotations.Indexed;

@Entity
@Indexed
@Table(name = "SYS_URL", catalog = "note")
public class SysUrl {
	private Long id;
	private String url;
	private String urlName;
	private String comment;
	private Date createDate;
	private Date updateDate;
	private Integer isEnable;
	private Long parentId;
	private Long sort;
	
	
	public SysUrl() {
	}
	
	public SysUrl(Long id, String url, String urlName, String comment,
			Date createDate, Date updateDate, Integer isEnable, Long parentId) {
		this.id = id;
		this.url = url;
		this.urlName = urlName;
		this.comment = comment;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.isEnable = isEnable;
		this.parentId = parentId;
	}
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrlName() {
		return urlName;
	}
	public void setUrlName(String urlName) {
		this.urlName = urlName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(columnDefinition="TIMESTAMP DEFAULT '0000-00-00 00:00:00'",updatable=false)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(columnDefinition="TIMESTAMP DEFAULT NOW() ON UPDATE NOW()",updatable=true)
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	@Column(columnDefinition="SMALLINT default 0",insertable=false)
	public Integer getIsEnable() {
		return isEnable;
	}
	public void setIsEnable(Integer isEnable) {
		this.isEnable = isEnable;
	}
	@Column(columnDefinition="SMALLINT")
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	@Column(columnDefinition="SMALLINT")
	public Long getSort() {
		return sort;
	}

	public void setSort(Long sort) {
		this.sort = sort;
	}
	
}
