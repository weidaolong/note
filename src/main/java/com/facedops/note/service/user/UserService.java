package com.facedops.note.service.user;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.facedops.note.entity.rbac.SysUser;
import com.facedops.note.repository.UserDao;
import com.facedops.note.service.UtilService;
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
	
	public org.springframework.data.domain.Page<SysUser> getUserList(Page page,SysUser users){
		Map<String, SearchFilter> filters =Maps.newHashMap();
		if(users.getName()!=null&&!"".equals(users.getName())){
			filters.put("userName", new SearchFilter("userName", Operator.LIKE, users.getName()));
		}
		PageRequest pageRequest=UtilService.buildPageRequest(page);
		Specification<SysUser> specification=BaseService.bySearchFilter(filters.values(), SysUser.class);
		return userDao.findAll(specification, pageRequest);
	}
	

	

	public void save(SysUser users){
		userDao.save(users);
	}
	
	public SysUser getUsers(Long id){
		return userDao.findOne(id);
	}
	
	
	public SysUser checkUserName(String username){
		return userDao.findByLoginName(username);
	}
	public void delete(Long id){
		userDao.delete(id);
	}
	
}
