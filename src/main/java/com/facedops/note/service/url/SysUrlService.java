package com.facedops.note.service.url;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.facedops.note.entity.rbac.SysUrl;
import com.facedops.note.repository.SysUrlDao;
import com.facedops.note.service.UtilService;
import com.facedops.note.web.utils.BaseService;
import com.facedops.note.web.utils.Page;
import com.facedops.note.web.utils.SearchFilter;
import com.google.common.collect.Maps;

@Component
@Transactional
public class SysUrlService {
	@Autowired
	private SysUrlDao sysUrlDao;
	
	public org.springframework.data.domain.Page<SysUrl> getUrlList(Page page,SysUrl sysUrl){
		Map<String, SearchFilter> filters =Maps.newHashMap();
		PageRequest pageRequest=UtilService.buildPageRequest(page);
		Specification<SysUrl> specification=BaseService.bySearchFilter(filters.values(), SysUrl.class);
		return sysUrlDao.findAll(specification, pageRequest);
	}
}
