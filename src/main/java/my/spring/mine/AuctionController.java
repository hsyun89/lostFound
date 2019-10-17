package my.spring.mine;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.AuctionDAO;
import vo.AuctionVO;
import vo.ListVO;
import vo.UserVO;

@Controller
public class AuctionController {
	@Autowired
	AuctionDAO dao;
	
	@RequestMapping(value = "/auction", method = RequestMethod.GET)
	public ModelAndView auctionmain(ListVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.auctionlist());
		mav.setViewName("auction");
		return mav;
	}
	
	@RequestMapping(value = "/lostkey", method = RequestMethod.GET)
	public ModelAndView category(ListVO vo, HttpSession session,String key) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.category(key));
		mav.setViewName("auction");
		return mav;	
	}
	
	//경매추가
	@RequestMapping(value = "/insertAuction", method = RequestMethod.GET)
	public String get(AuctionVO vo) {
		return "insertAuction";
	}
	
	@RequestMapping(value = "/insertAuction", method = RequestMethod.POST)
	public ModelAndView auction_insert(Model model, HttpSession session, AuctionVO vo) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.insert(vo);
		if(result) {
			mav.addObject("msg", "성공적으로 저장되었어요.");
		} else {
			mav.addObject("msg", "작성을 실패했어요.");
		}
		System.out.println("입력완료");
		return mav;
	}
	
	@RequestMapping(value = "/deleteAuction", method = RequestMethod.POST)
	@ResponseBody
	public int checkpw(String unique_id) {
			if (dao.delete(unique_id)) {
				return 1;
			} else
				return 0;
		}
	
}
