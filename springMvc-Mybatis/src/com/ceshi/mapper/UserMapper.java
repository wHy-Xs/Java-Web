package com.ceshi.mapper;

import java.util.List;
import java.util.Map;

import com.ceshi.model.User;

public interface UserMapper {
	
	//����һ����¼������User����
	public User login(String userName,String passWord);
	
	//public User select(User user);
	//��ѯһ����¼����Map����
	public Map<String,String> selectAll(int id);
	
	//��ѯ���ж��󣬷���List
	public List<Object> select1(String userName,String passWord);
	
	//��ѯ���ж��󣬷���List
	public List<User> select2(Map<String,String> map);
	
	//��ѯ���ж���
	public List<User> select3();
	
	//��ѯ����
	public Long selectUser();
	
	
	public int insert(User user);
	
	public int delete(String userName);
	
	public int update(User user);
	
	
public List<User> findUsers(Map<String, Object> map);
	
	public Long getTotalUser(Map<String, Object> map);
	
	
	public int updateUser(User user);

    /**
     * ����û�
     *
     * @param user
     * @return
     */
    public int addUser(User user);

    /**
     * ɾ���û�
     *
     * @param id
     * @return
     */
public int deleteUser(Integer id);
	
}
