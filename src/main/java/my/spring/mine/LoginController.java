package my.spring.mine;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.UserVO;

@Controller
@SessionAttributes("status")
public class LoginController {
	private NaverLoginBO naverLoginBO;

	@Autowired
	MemberService service;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 회원가입 페이지 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String get(Model model, HttpSession session, UserVO vo) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		System.out.println("회원가입");
		return "register";
	}

	// 회원가입
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(Model model, HttpSession session, UserVO vo) {
		ModelAndView mav = new ModelAndView();
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		if (vo != null) {
			// email, nickname 중복확인
			boolean checkEmail = service.checkEmail(vo.getEmail());

			if (checkEmail) {
				System.out.println("이메일이 중복입니다.");
				mav.addObject("msg", "이메일이 중복입니다");
				// 회원가입 완료(이메일 중복 없음)
			} else {
				if (service.insert(vo)) {
					mav.addObject("msg", "회원가입을 축하드립니다");
					mav.setViewName("login");
					return mav;
				} else {
					mav.addObject("msg", "회원가입을 실패하였습니다");
				}
			}
			mav.setViewName("register");
		}
		return mav;
	}

	// 회원가입(Email중복체크)
	@RequestMapping(value = "/checkEmail")
	@ResponseBody
	public int checkEmail(String email) {
		System.out.println("체크이메일 들어옴");
		if (service.checkEmail(email)) {
			return 1;
		} else
			return 0;
	}

	// 로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String logIn(Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		mav.setViewName("login");
		return "login";
	}

	// (일반, 네이버)로그인 정보,확인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView logIn(@ModelAttribute UserVO vo, Model model, HttpServletResponse response,
			HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		UserVO vo1 = service.login(vo);
		//System.out.println("con : 1r  " + vo1.getAdmin());
		if (vo1 != null) {
			session.setAttribute("status", vo);
			session.setAttribute("admin", vo1.getAdmin());
			//System.out.println(vo.getEmail()); // 수정하기
			System.out.println("login완료");
			mav.setViewName("mainView");
		} else {
			mav.addObject("msg", "로그인에 실패했습니다.");
			mav.setViewName("login");
		}
		
		return mav;
	}
	
	// 회원 수정  페이지 이동
		@RequestMapping(value="/userupdate", method=RequestMethod.GET)
		public String  userUpdate( HttpSession session) throws Exception {
			if(session.getAttribute("status")==null)
				return "mainView";
			else
			return "userUpdate";
		}
		
		// 회원 수정
		@RequestMapping(value="/userupdate", method=RequestMethod.POST)
		public ModelAndView userUpdate(@ModelAttribute UserVO vo, @SessionAttribute("status")UserVO user) throws Exception {
			ModelAndView mav = new ModelAndView();
			String email = user.getEmail();
			vo.setEmail(email);
			boolean result = service.update(vo);
			//log테이블 userName 수정
			if(result) {
				user = vo;
				mav.addObject("status", user);
			}
			mav.setViewName("mypage");
			return mav;
		}
		
		//회원탈퇴
		@RequestMapping(value="/userdelete", method=RequestMethod.GET)
		public String userDelete() {
			return "userdelete";
		}
		
		@RequestMapping(value="/userdelete", method=RequestMethod.POST)
		public ModelAndView userDelete(@ModelAttribute UserVO vo, @SessionAttribute("status")UserVO user) throws Exception {
			ModelAndView mav = new ModelAndView();
			String email = user.getEmail();
			vo.setEmail(email);
			boolean result = service.delete(vo);
			if(result) {
				user = vo;
				mav.addObject("status", user);
			}
			mav.setViewName("mainView");
			return mav;
		}

	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(SessionStatus session) {
		session.setComplete();
		System.out.println("로그아웃");
		return "redirect:/main";
	}

}
