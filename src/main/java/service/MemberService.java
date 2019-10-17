package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.UserVO;

@Service
public class MemberService {
	@Autowired
	UserDAO dao;

	// 회원가입
	public boolean insert(UserVO vo) {
		if (dao.insert(vo) != 1)
			return false;
		return true;
	}

	// 이메일 중복체크
	public boolean checkEmail(String email) {
		System.out.println(dao.checkEmail(email));
		if (dao.checkEmail(email) != null)
			return true;
		return false;
	}

	// 로그인
	public UserVO login(UserVO vo) {
		return dao.login(vo);
	}

	// 네이버 로그인
	public UserVO naverLogin(UserVO vo) {
		return dao.naverLogin(vo);
	}

	// 회원 정보 수정
	public boolean update(UserVO vo) {
		return dao.update(vo);
	}

	// 회원 탈퇴
	public boolean delete(String email) {
		return dao.delete(email);
	}

	// 탈퇴 비밀번호 체크
	public boolean checkpw(UserVO vo) {
		if (dao.checkpw(vo) != null)
			return true;
		return false;
	}

}
