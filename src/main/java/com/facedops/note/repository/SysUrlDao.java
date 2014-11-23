package com.facedops.note.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.facedops.note.entity.rbac.SysUrl;

public interface SysUrlDao extends PagingAndSortingRepository<SysUrl, Long>, JpaSpecificationExecutor<SysUrl>  {

}
