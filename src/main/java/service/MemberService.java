package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.UserVO;

@Service
public class MemberService {
	@Autowired
	UserDAO dao;
	
	//회원가입
	public boolean insert(UserVO vo) {
		if(dao.insert(vo) != 1)
			return false;
		return true;
	}
	
	//이메일 중복체크
	public boolean checkEmail(String email) {
		System.out.println(dao.checkEmail(email));
		if (dao.checkEmail(email) != null)
			return true;
		return false;
	}
	

	//로그인
	public UserVO login(UserVO vo) {
		return dao.login(vo);
	}
	
	// 회원 탈퇴
	public boolean delete(String email) {
		return dao.delete(email);
	}
	
}