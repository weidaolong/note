package com.facedops.note.service.database;

import java.io.IOException;

import org.activiti.engine.RepositoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.facedops.note.util.hibernate.ConfigProperties;

@Component
@Transactional
public class DatabaseService {
	@Autowired
	private RepositoryService repositoryService;
	private static Logger logger = LoggerFactory
			.getLogger(DatabaseService.class);
	String cmdPath = "D:\\Program Files\\MySQL\\MySQL Server 5.1\\bin\\mysqldump.exe"; // localhost(或是服务器IP地址)
	String backPath = ConfigProperties.getConfig("BACKFILE_PATH");
	
	public void backFile(String webPath) {
		Runtime rt = Runtime.getRuntime();
		try {
			rt.exec(new String[] { cmdPath, "-uroot", "-proot", "note",
					"-r"+webPath+backPath+"\\mysql.sql" });
			logger.info("-r"+webPath+backPath+"\\mysql.sql");
			logger.info("备份成功!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			logger.error("备份失败!");
			e.printStackTrace();
		}
	}
}
