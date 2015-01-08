package com.facedops.note.service.url;

import java.util.List;
import java.util.Map;

import org.activiti.engine.RepositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.facedops.note.entity.rbac.SysUrl;
import com.facedops.note.page.service.UtilService;
import com.facedops.note.repository.SysUrlDao;
import com.facedops.note.web.utils.BaseService;
import com.facedops.note.web.utils.Page;
import com.facedops.note.web.utils.SearchFilter;
import com.facedops.note.web.utils.SearchFilter.Operator;
import com.google.common.collect.Maps;

@Component
@Transactional
public class SysUrlService {
	@Autowired
	private SysUrlDao sysUrlDao;
	@Autowired
	private RepositoryService repositoryService;
	public org.springframework.data.domain.Page<SysUrl> getUrlList(Page page,SysUrl sysUrl){
		Map<String, SearchFilter> filters =Maps.newHashMap();
		
		if(sysUrl.getUrlName()!=null&&!"".equals(sysUrl.getUrlName())){
			filters.put("urlName", new SearchFilter("urlName", Operator.LIKE, sysUrl.getUrlName()));
		}
		if(sysUrl.getUrl()!=null&&!"".equals(sysUrl.getUrl())){
			filters.put("url", new SearchFilter("url", Operator.LIKE, sysUrl.getUrl()));
		}
		if(sysUrl.getParentId()!=null){
			filters.put("parentId", new SearchFilter("parentId", Operator.EQ, sysUrl.getParentId()));
		}
		
		PageRequest pageRequest=UtilService.buildPageRequest(page);
		Specification<SysUrl> specification=BaseService.bySearchFilter(filters.values(), SysUrl.class);
		return sysUrlDao.findAll(specification, pageRequest);
	}
	
	public List<SysUrl> getByParentId(Long parentId){
		return sysUrlDao.getByParentId(parentId);
	}
	
	public void save(SysUrl sysUrl){
		sysUrlDao.save(sysUrl);
	}
}
