package com.facedops.note.service;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

import com.facedops.note.web.utils.Page;

public class UtilService {
	/**
	 * 创建分页请求.
	 */
	public static PageRequest buildPageRequest(Page page) {
		Sort sort=null;
		if(page.getOrderBy()!=null &&!"".equals(page.getOrderBy())){
			if("asc".equals(page.getOrderType())){
				sort = new Sort(Direction.ASC, page.getOrderBy());
			}else if("desc".equals(page.getOrderType())){
				sort = new Sort(Direction.DESC, page.getOrderBy());
			}
		}
		return new PageRequest(page.getPageNum() - 1, page.getPageSize(), sort);
	}
}
