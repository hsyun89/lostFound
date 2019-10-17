package my.spring.mine;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;

import service.MemberService;
import vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("status")
public class NaverLoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private MemberService service;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

//3. 데이터 파싱
//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// response의 nickname값 파싱
		String user_id = (String) response_obj.get("id");
		String email = (String) response_obj.get("email");
		String user_name = (String) response_obj.get("name");
		String gender = (String) response_obj.get("gender");

		UserVO vo = new UserVO();
		UserVO userVO = new UserVO();

		vo.setUser_id(user_id);
		vo.setEmail(email);
		vo.setuser_name(user_name);
		vo.setGender(gender);
		System.out.println(vo.getEmail());

		userVO = service.naverLogin(vo);

		if (userVO == null) {
			service.insert(vo);
		}
		session.setAttribute("sessionId", user_name);
		model.addAttribute("status", vo);

		return "redirect:/main";
	}
}