package com.ceshi.service;

import java.util.List;
import java.util.Map;

import com.ceshi.model.User;

public interface UserService {
	
	public User login(String userName,String passWord);
	
//	public User select(User user);
	
	public Map<String,String> selectAll(int id);
	
	public List<Object> select1(String userName,String passWord);
	
	public List<User> select2(Map<String,String> map);
	
	public List<User> select3();
	
	public Long selectUser();
	
	public void insert(User user);
	
	public void delete(String userName);
	
	public int update(User user);
	
public List<User> findUsers(Map<String, Object> map);
	
	public Long getTotalUser(Map<String, Object> map);
	
	public int updateUser(User user);

    /**
     * 添加用户
     *
     * @param user
     * @return
     */
    public int addUser(User user);

    /**
     * 删除用户
     *
     * @param id
     * @return
     */
public int deleteUser(Integer id);
}
