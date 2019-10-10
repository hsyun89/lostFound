package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	SqlSession session = null;
	
	//회원가입
	public int insert(UserVO vo) {
		String statement = "resource.UserMapper.insert";
		return session.insert(statement,vo);
	}

	// 로그인
	public UserVO login(UserVO vo) {
		String statement = "resource.UserMapper.login";
		return session.selectOne(statement, vo);
	}

	// 이메일 확인
	public String checkEmail(String email) {
		String statement = "resource.UserMapper.checkEmail";
		System.out.println("dao : " + email);
		return session.selectOne(statement, email);
	}
	
	//회원 정보 수정
	public boolean update(UserVO vo) {
		boolean result = true;
		String statement = "resource.UserMapper.update";
				if(session.update(statement,vo) != 1) {
					result = false;
				}
		return result;
	}
	//회원 탈퇴
	public boolean delete(String email) {
		boolean result = true;
		String statement = "resource.UserMapper.delete";
		if(session.delete(statement, email)!=1) {
			result = false;
		}
		return result;
	}

}