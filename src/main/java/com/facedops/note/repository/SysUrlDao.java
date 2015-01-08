package com.facedops.note.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import com.facedops.note.entity.rbac.SysUrl;

public interface SysUrlDao extends PagingAndSortingRepository<SysUrl, Long>, JpaSpecificationExecutor<SysUrl>  {
	@Query("select o from SysUrl o where o.parentId=?1 order by layerCode asc ")
	List<SysUrl> getByParentId(Long parentId);
}
