package com.idol.model;

import java.util.List;

public interface FollowDAO {

	 List<FollowDTO> getFollowList(String id);

	List<FollowDTO> getFollowerList(String id);

	int deleteFollow(String login, String id);

	int insertFollow(MemberDTO login, MemberDTO id);


}
