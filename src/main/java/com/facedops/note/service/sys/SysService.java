package com.facedops.note.service.sys;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.facedops.note.entity.rbac.SysUser;
import com.facedops.note.modules.security.utils.Digests;
import com.facedops.note.modules.util.Clock;
import com.facedops.note.modules.util.Encodes;
import com.facedops.note.repository.UserDao;

@Component
@Transactional
public class SysService {
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;
	
	@Autowired
	private UserDao userDao;
	private Clock clock = Clock.DEFAULT;

	public List<SysUser> getAllUser() {
		return (List<SysUser>) userDao.findAll();
	}

	public SysUser getUser(Long id) {
		return userDao.findOne(id);
	}	
	public SysUser findUserByLoginName(String loginName){
		return userDao.findByLoginName(loginName);
	}
	
	public void registerUser(SysUser user) {
		entryptPassword(user);
		user.setRoles("user");
		userDao.save(user);
	}
	
	/**
	 * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
	 */
	private void entryptPassword(SysUser user) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		user.setSalt(Encodes.encodeHex(salt));

		byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
		user.setPassword(Encodes.encodeHex(hashPassword));
	}
	
	public void updateUser(SysUser user) {
		if (StringUtils.isNotBlank(user.getPlainPassword())) {
			entryptPassword(user);
		}
		userDao.save(user);
	}
	
}
