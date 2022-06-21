package com.idol.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDAOImpl implements FollowDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<FollowDTO> getFollowList(String id) {
		return this.sqlSession.selectList("followList", id);
	}

	@Override
	public List<FollowDTO> getFollowerList(String id) {
		return this.sqlSession.selectList("followerList", id);
	}

	//언팔 메서드
	@Override
	public int deleteFollow(String login, String id) {
		HashMap<String, String> maps = new HashMap<String, String>();
		maps.put("login", login);
		maps.put("id", id);
		return this.sqlSession.delete("deleteFollow", maps);
	}

	@Override
	public int insertFollow(MemberDTO login, MemberDTO id) {
		
		HashMap<String, Object> maps = new HashMap<String, Object>();
		maps.put("login_no", (int)login.getMember_no());
		maps.put("login_id", (String)login.getMember_id());
		maps.put("id_no", (int)id.getMember_no());
		maps.put("id_id", (String)id.getMember_id());
		
		return this.sqlSession.insert("insertFollow", maps);
	}


}