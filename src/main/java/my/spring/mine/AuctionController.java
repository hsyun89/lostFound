package my.spring.mine;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.AuctionDAO;
import vo.AuctionVO;
import vo.ListVO;

@Controller
public class AuctionController {
	@Autowired
	AuctionDAO dao;
	
	@RequestMapping(value = "/auction", method = RequestMethod.GET)
	public ModelAndView auctionmain(ListVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//String id = (String)session.getAttribute("�α���������� �����Ǵ� ���� ��ü �̸� ����");
		/*
		 * if(id != null) {
		 * 
		 * } else {
		 * 
		 * }
		 */
		mav.addObject("list", dao.auctionlist());
		mav.setViewName("auction");
		return mav;
	}
	
	@RequestMapping(value = "/lostkey", method = RequestMethod.GET)
	public ModelAndView categori(ListVO vo, HttpSession session,String key) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("�α���������� �����Ǵ� ���� ��ü �̸� ����");
		mav.addObject("list", dao.category(key));
		mav.setViewName("auction");
		return mav;	
	}
	
	//��� �߰�
	@RequestMapping(value = "/insertAuction", method = RequestMethod.GET)
	public String get(AuctionVO vo) {
		return "insertAuction";
	}
	
	@RequestMapping(value = "/insertAuction", method = RequestMethod.POST)
	public ModelAndView auction_insert(Model model, HttpSession session, AuctionVO vo) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.insert(vo);
		System.out.println("CON : "+ result);
		if(result) {
			mav.addObject("msg", "���������� ����Ǿ����.");
		} else {
			mav.addObject("msg", "�ۼ��� �����߾��.");
		}
		System.out.println("����߰�");
		return mav;
	}
}
