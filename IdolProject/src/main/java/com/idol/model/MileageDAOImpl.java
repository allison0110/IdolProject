package com.idol.model;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> 00b8ab7eb6df08154ca6a7505ea0f255452312d8
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
<<<<<<< HEAD
public class MileageDAOImpl implements MileageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 멤버번호를 파라메터 값으로 받아 현제 마일리지 정보를 조회하는 메서드
	@Override
	public MileageDTO getMileageDetail(int mno) {
		return sqlSession.selectOne("getDetail", mno);
	}
	
	
	//멤버번호를 파라메터 값으로 받아 남아있는 마일리지를 조회하는 메서드
	@Override
	public int getreamining(int mno) {
		
		return sqlSession.selectOne("reamining", mno);
	}

	// 마일리지 dto에 정보를 담아 마일리지 정보를 추가하는 메서드
	@Override
	public int insertMileageInfo(MileageDTO mdto) {
		return sqlSession.insert("inserMInfo", mdto);
=======
public class MileageDAOImpl implements MileageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MileageDTO> mostMessages() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MileageDTO> mostMileage() {
		// TODO Auto-generated method stub
		return null;
>>>>>>> 00b8ab7eb6df08154ca6a7505ea0f255452312d8
	}

	
	
<<<<<<< HEAD

	

=======
	
>>>>>>> 00b8ab7eb6df08154ca6a7505ea0f255452312d8
}
