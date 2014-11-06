package com.facedops.note.web.user;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.facedops.note.entity.rbac.Users;
import com.facedops.note.service.user.UserService;
import com.facedops.note.util.hibernate.ConfigProperties;
import com.facedops.note.web.utils.Page;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	private static Long MAX_PORTRAIT_SIZE=5242880L;

	private static Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@RequestMapping(method = RequestMethod.GET)
	public String list(Page page, HttpServletRequest request, Model model,
			Users users) {

		org.springframework.data.domain.Page<Users> userList = userService
				.getUserList(page, users);
		model.addAttribute("userList", userList);
		model.addAttribute("users", users);
		model.addAttribute("page", page);
		model.addAttribute("searchParams", request.getQueryString());
		return "user/userList";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm() {
		return "user/userForm";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, @ModelAttribute("users") Users users) {
		logger.info(file.getOriginalFilename());
		String path = request.getSession().getServletContext().getRealPath("");
		String fileName = file.getOriginalFilename();

		File targetFile = new File(path+ConfigProperties.getConfig("FILE_PATH"), fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		}  catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		userService.save(users);
		return "redirect:/user";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id,
			RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		userService.delete(id);
		return "redirect:/user";
	}
	
	@ResponseBody
	@RequestMapping(value = "load/{id}")
	public Users load(@PathVariable("id") Long id) {
		return userService.getUsers(id);
	}
	
	@ResponseBody
	@RequestMapping(value = "checkUserName")
	public String checkUserName(String username) {
		Users users=userService.checkUserName(username);
		if(users!=null){
			return "用户名已存在";
		}else{
			return "可以使用";
		}
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public String updateForm(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userService.getUsers(id));
		return "/user/userForm";
	}

	@RequestMapping(value = "editPhoto")
	public String editPhoto(){
		return "/user/editPhoto";
	}
	@RequestMapping(value = "save_photo", method = RequestMethod.POST)
	public String savePhoto(@RequestParam(value = "file", required = false) MultipartFile file, Model model) throws Exception{
		if(file.isEmpty()){
			throw new Exception("img is empty");
		}
		if(file.getSize()>MAX_PORTRAIT_SIZE){
			throw new Exception("文件过大，超出2M");
		}
		
		File targetFile = new File(ConfigProperties.getConfig("FILE_PATH"), file.getOriginalFilename());
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		file.transferTo(targetFile);
		
		model.addAttribute("src", targetFile.getName());
		
		return "/user/editPhoto";
	}
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public void view(String img,HttpServletRequest request,HttpServletResponse response) throws IOException{
		InputStream inputStream=new FileInputStream(ConfigProperties.getConfig("FILE_PATH")+"\\"+img);
        int i=inputStream.available(); //得到文件大小   
        byte data[]=new byte[i];   
        inputStream.read(data);  //读数据   
        //response.setContentType("image/*"); //设置返回的文件类型   
        OutputStream toClient=response.getOutputStream(); //得到向客户端输出二进制数据的对象   
        toClient.write(data);  //输出数据   
          
        toClient.flush();  
        toClient.close();   
        inputStream.close();
		
	}
	
	
	@ModelAttribute
	public void getUser(
			@RequestParam(value = "id", defaultValue = "-1") Long id,
			Model model) {
		if (id != -1) {
			model.addAttribute("task", userService.getUsers(id));
		}
	}
	
	
	
}
