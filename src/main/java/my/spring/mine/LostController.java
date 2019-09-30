package my.spring.mine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.LostDAO;

@Controller
public class LostController {
	@Autowired
	LostDAO dao;
	@RequestMapping(value = "/lost", method = RequestMethod.GET)
//	protected ModelAndView get(String lostName) {
//		ModelAndView mav = new ModelAndView();
//		String viewName = "lostView";
//		if(lostName != null) {
//			mav.addObject(lostName);
//		}
//		mav.setViewName(viewName);
//		return mav;
//	}
	protected ModelAndView select(String atcid, String action, String keyword) {
		ModelAndView mav = new ModelAndView();
		if(atcid==null && action==null) {
			mav.addObject("list", dao.listAll());
		}else if(action.equals("read")) {
			mav.addObject("listOne", dao.listOne(atcid));
		}else if(action.equals("search")) {
			mav.addObject("list", dao.search(keyword));
		}
		mav.setViewName("lostView");
		return mav;
	}
}
