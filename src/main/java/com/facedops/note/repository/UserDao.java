package com.facedops.note.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.facedops.note.entity.rbac.SysUser;

public interface UserDao extends PagingAndSortingRepository<SysUser, Long>, JpaSpecificationExecutor<SysUser>  {
	SysUser findByLoginName(String loginName);
}
