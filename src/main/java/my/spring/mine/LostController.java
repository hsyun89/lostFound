package my.spring.mine;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LostController {
	@RequestMapping(value = "/lost", method = RequestMethod.GET)
	protected ModelAndView get(String lostName) {
		ModelAndView mav = new ModelAndView();
		String viewName = "lostView";
		if(lostName != null) {
			mav.addObject(lostName);
		}
		mav.setViewName(viewName);
		return mav;
	}
}
