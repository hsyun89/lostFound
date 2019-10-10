package my.spring.mine;

import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.UserVO;

@Controller
@SessionAttributes("status")
public class MyPageController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String getMypage() {
		return "mypage";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public ModelAndView postMypage(UserVO vo, HttpSession session) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		UserVO vo1 = service.login(vo);
		
		if (vo1 != null) {
			session.setAttribute("status", vo1);	
			//System.out.println(vo.getEmail()); // 수정하기
			//mav.setViewName("mypage");
		} else {
			mav.addObject("msg", "fail.");
			mav.setViewName("login");
		}
		
		mav.setViewName("mypage");
		return mav;
	}

}
