package com.idol.model;

import java.util.List;

public interface MemberDAO {
	List<MemberDTO> getMemberList();
	MemberDTO getMemberCont(int mno);
}
