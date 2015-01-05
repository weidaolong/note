package com.facedops.note.entity.rbac;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
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
@Table(catalog = "note")
public class UploadPhotoInfo implements Serializable{
	private Long UploadPhotoInfoId;
	private String photoName;
	private String photoPath;
	private String customPhotoName;
	private Date createDate;
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(unique = true, nullable = false)
	public Long getUploadPhotoInfoId() {
		return UploadPhotoInfoId;
	}
	public void setUploadPhotoInfoId(Long uploadPhotoInfoId) {
		UploadPhotoInfoId = uploadPhotoInfoId;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getCustomPhotoName() {
		return customPhotoName;
	}
	public void setCustomPhotoName(String customPhotoName) {
		this.customPhotoName = customPhotoName;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(columnDefinition="TIMESTAMP DEFAULT '0000-00-00 00:00:00'",updatable=false)
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
