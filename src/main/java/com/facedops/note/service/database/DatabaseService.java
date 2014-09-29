package com.facedops.note.service.database;

import java.io.IOException;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.facedops.note.repository.CommonDao;

@Component
@Transactional
public class DatabaseService {
	@Autowired
	private CommonDao commonDao;
	public void backFile(){
        Runtime rt = Runtime.getRuntime();  
        String cmd ="mysqldump -h localhost -uroot -proot note > e:/mysql.sql"; //一定要加 -h localhost(或是服务器IP地址)  
        try {
			rt.exec("cmd /c " + cmd);
			System.out.println("备份成功!");  
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("备份失败!");  
			e.printStackTrace();
		}  

		
	}

}
