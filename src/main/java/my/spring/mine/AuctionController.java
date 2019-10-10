package my.spring.mine;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuctionController {
	@RequestMapping(value = "/auctionWebsocket", method = RequestMethod.GET)
	protected ModelAndView get() {
		ModelAndView mav = new ModelAndView();
		String viewName = "auctionView";
		mav.setViewName(viewName);
		return mav;
	}
}