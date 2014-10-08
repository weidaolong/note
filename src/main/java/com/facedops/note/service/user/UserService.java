package com.facedops.note.service.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.facedops.note.entity.rbac.Users;
import com.facedops.note.repository.UserDao;
import com.facedops.note.web.utils.BaseService;
import com.facedops.note.web.utils.Page;
import com.facedops.note.web.utils.SearchFilter;
import com.facedops.note.web.utils.SearchFilter.Operator;
import com.google.common.collect.Maps;

@Component
@Transactional
public class UserService {
	@Autowired
	private UserDao userDao;
	
	public org.springframework.data.domain.Page<Users> getUserList(Page page,Users users){
		Map<String, SearchFilter> filters =Maps.newHashMap();
		if(users.getUserName()!=null&&!"".equals(users.getUserName())){
			filters.put("userName", new SearchFilter("userName", Operator.LIKE, users.getUserName()));
		}
		
		PageRequest pageRequest=buildPageRequest(page);
		Specification<Users> specification=BaseService.bySearchFilter(filters.values(), Users.class);
		
		return userDao.findAll(specification, pageRequest);
	}
	
	/**
	 * 创建分页请求.
	 */
	protected PageRequest buildPageRequest(Page page) {
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
	

	public void save(Users users){
		userDao.save(users);
	}
	
	public Users getUsers(Long id){
		return userDao.findOne(id);
	}
	public void delete(Long id){
		userDao.delete(id);
	}
	
}
