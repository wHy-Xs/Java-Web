package com.ceshi.mapper;

import java.util.List;
import java.util.Map;

import com.ceshi.model.User;

public interface UserMapper {
	
	//查找一条记录，返回User对象
	public User login(String userName,String passWord);
	
	//public User select(User user);
	//查询一条记录返回Map对象
	public Map<String,String> selectAll(int id);
	
	//查询所有对象，返回List
	public List<Object> select1(String userName,String passWord);
	
	//查询所有对象，返回List
	public List<User> select2(Map<String,String> map);
	
	//查询所有对象
	public List<User> select3();
	
	//查询总数
	public Long selectUser();
	
	
	public int insert(User user);
	
	public int delete(String userName);
	
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
