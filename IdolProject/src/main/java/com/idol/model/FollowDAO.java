package com.idol.model;

import java.util.HashMap;
import java.util.List;

public interface FollowDAO {

	 List<FollowDTO> getFollowList(String id);

	List<FollowDTO> getFollowerList(String id);

	int deleteFollow(HashMap<String, String> param);

	int insertFollow(MemberDTO login, MemberDTO id);

	List<FollowDTO> getMusicLike(String id);

	int deleteLike(HashMap<String, Object> param);

	


}
