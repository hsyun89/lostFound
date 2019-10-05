package my.spring.mine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.LostDAO;
import vo.PageMaker;

@Controller
public class LostController {
	@Autowired
	LostDAO dao;
	@RequestMapping(value = "/lost", method = RequestMethod.GET)
//	protected ModelAndView listLostPage(PageMaker pageMaker) {
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("list", dao.readListLost(pageMaker));
//		mav.addObject("pageMaker", pageMaker);
//		mav.setViewName("lostView");
//		return mav;
//	}
	public String listLostPage(PageMaker pageMaker, Model model) throws Exception{
		pageMaker.setTotalCount(dao.listPageCount(pageMaker));
		model.addAttribute("list", dao.readListLost(pageMaker));
		model.addAttribute("pageMaker", pageMaker);
		return "lostView";
	}
}
//	@Autowired
//	LostDAO dao;
//	@RequestMapping(value = "/lost", method = RequestMethod.GET)
//	protected ModelAndView select(String atcid, String action, String keyword) {
//		ModelAndView mav = new ModelAndView();
//		if(atcid==null && action==null) {
//			mav.addObject("listAll", dao.listAll());
//		}else if(action.equals("read")) {
//			mav.addObject("listOne", dao.listOne(atcid));
//		}else if(action.equals("search")) {
//			mav.addObject("searchList", dao.search(keyword));
//		}
//		mav.setViewName("lostView");
//		return mav;
//	}
//	public String listPageSearch(@ModelAttribute("pageMaker") PageMaker pageMaker, Model model) throws Exception{
//		//전체 페이지 개수 구한후 하단 페이징 처리 하기
//		pageMaker.setTotalCount(dao.listPageCount(pageMaker));
//		System.out.println(pageMaker.getTotalCount());
//		//페이지 메이커 attribute 로 저장  
//		model.addAttribute("pageMaker", pageMaker);	
//		model.addAttribute("list", dao.listPageSearch(pageMaker));
//		return "lostView";
//	}
//}