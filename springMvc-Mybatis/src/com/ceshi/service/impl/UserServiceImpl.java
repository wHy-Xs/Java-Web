package com.ceshi.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ceshi.mapper.UserMapper;
import com.ceshi.model.User;
import com.ceshi.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;
	
	public User login(String userName,String passWord) {
			return userMapper.login(userName,passWord);
	}
	
//	public User select(User user) {
//		return userMapper.select(user);
//	}
	
	public List<Object> select1(String userName,String passWord){
		return userMapper.select1(userName,passWord);
		
	}
	
	public List<User> select2(Map<String,String> map){
		return userMapper.select2(map);
	}
	
	public Map<String,String> selectAll(int id) {
		return userMapper.selectAll(id);
	}
	
	public List<User> select3(){
		
		return userMapper.select3();
	};
	
	public Long selectUser() {
		return userMapper.selectUser();
	}
	
	public void insert(User user){
		userMapper.insert(user);
	}
	
	public void delete(String userName){
		userMapper.delete(userName);
	}
	
	public int update(User user){
		return userMapper.update(user);
	}
	
	
public List<User> findUsers(Map<String, Object> map){
	
	return userMapper.findUsers(map);
	
}
	
	public Long getTotalUser(Map<String, Object> map){
		
		return userMapper.getTotalUser(map);
	}
	
	
	
	public int updateUser(User user){
		return userMapper.updateUser(user);
	}

   
    public int addUser(User user){
    	return userMapper.addUser(user);
    }

    
    public int deleteUser(Integer id){
    	return userMapper.deleteUser(id);
    }
	
	
	
	
	
	
	
	
	
}
