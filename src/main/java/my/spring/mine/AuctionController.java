package my.spring.mine;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.AuctionDAO;
import vo.AuctionLogVO;
import vo.AuctionVO;
import vo.ListVO;
import vo.UserVO;

@Controller
@SessionAttributes("list") //멀티룸
public class AuctionController {
	@Autowired
	AuctionDAO dao;
	
	@RequestMapping(value = "/combid", method = RequestMethod.GET)
	public ModelAndView completeBid(HttpSession session, AuctionVO vo) {
		ModelAndView mav = new ModelAndView();
		String viewName="completeBidView";
		mav.setViewName(viewName);
		UserVO loginSession = (UserVO) session.getAttribute("status");
		String userId = loginSession.getUser_id();
		//System.out.println(userId);
		mav.addObject("BiddingCompleteList", dao.selectBiddingComplete(userId));
		mav.addObject("BuyCompleteList", dao.selectBuyComplete(userId));
		//카트 숫자
		mav.addObject("cartCount", dao.selectBiddingComplete(userId).size());
		return mav;
	}
	//결제완료시 받기
	@RequestMapping(value = "/payment/complete", method = RequestMethod.POST)
	public ModelAndView paymentCompletePost(HttpSession session, ListVO vo, String price, String unique_id) {
		ModelAndView mav = new ModelAndView();
		System.out.println("price : "+price);
		System.out.println("unique : "+unique_id);
		System.out.println(vo);
		UserVO loginSession = (UserVO) session.getAttribute("status");
		String user_id = loginSession.getUser_id();
		vo.setUser_id(user_id);
		vo.setUnique_id(unique_id);
		vo.setPrice(price);
		dao.completeBuy(vo);
		System.out.println("Post결제완료~서버받음");
		String viewName="mainView";
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value = "/payment/complete", method = RequestMethod.GET)
	public ModelAndView paymentCompleteGet(HttpSession session, AuctionVO vo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("Get결제완료~서버받음");
		String viewName="mainView";
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value = "/payment/fail", method = RequestMethod.GET)
	public ModelAndView paymentFail(HttpSession session, AuctionVO vo) {
		ModelAndView mav = new ModelAndView();
		System.out.println("결제실패~서버받음");
		String viewName="mainView";
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public ModelAndView payment(String productId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//로그인유저와
		UserVO loginSession = (UserVO) session.getAttribute("status");
		String userId = loginSession.getUser_id();
		System.out.println("유저아이디"+userId);
		//낙찰자
		AuctionLogVO maxBidVO = dao.selectMaxPriceAndUser2(productId);
		String maxBidder = maxBidVO.getUser_id();
		System.out.println("낙찰자"+maxBidder);
		//물건이름
		ListVO temp = dao.auctionOne(productId);
		String productName = temp.getProduct_name();
		//로그인 유저와 낙찰자 비교하여 & 낙찰 시간 완료 시 이메일과 가격정보 결제페이지로 넘기기
		ListVO listVO =  dao.auctionOne(productId);
		String endTime = listVO.getEnd_date();
		String serverTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		int timeout = endTime.compareTo(serverTime);
		System.out.println(timeout);
		if(userId.equals(maxBidder) && timeout<0) {
			String viewName="paymentTest";
			mav.setViewName(viewName);
			System.out.println(maxBidVO.getEmail());
			System.out.println(maxBidVO.getUser_name());
			mav.addObject("name", maxBidVO.getUser_name());
			mav.addObject("cost", maxBidVO.getPrice());
			mav.addObject("email", maxBidVO.getEmail());
			mav.addObject("productId", productId);
			mav.addObject("productName", productName);
			String flag = "bidder";
			mav.addObject("flag", flag);
		}else {
			String viewName="paymentTest";
			String flag = "notBidder";
			mav.setViewName(viewName);
			mav.addObject("flag", flag);
		}
		return mav;
	}
	
	@RequestMapping(value = "/auctionWebsocket", method = RequestMethod.GET)
	protected ModelAndView get(String productId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String viewName = "auctionOneView";
		ListVO listVO =  dao.auctionOne(productId);
		mav.addObject("serverTime",LocalDateTime.now());
		mav.addObject("list", listVO);
		mav.addObject("maxPriceAndUser", dao.selectMaxPriceAndUser1(productId));
		mav.addObject("biddingList", dao.selectBiddingList(productId));
		//System.out.println(dao.selectBiddingList(productId));
		//멀티룸용 세션
		session.setAttribute("list", listVO);
		//
		mav.setViewName(viewName);
		//카트 숫자
		UserVO loginSession = (UserVO) session.getAttribute("status");
		String userId = loginSession.getUser_id();
		System.out.println("zzzz"+userId);
		mav.addObject("cartCount", dao.selectBiddingComplete(userId).size());
		return mav;
	}

	@RequestMapping(value = "/auction", method = RequestMethod.GET)
	public ModelAndView auctionmain(ListVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.auctionlist());
		mav.setViewName("auction");
		return mav;
	}

	@RequestMapping(value = "/lostkey", method = RequestMethod.GET)
	public ModelAndView category(ListVO vo, HttpSession session, String key) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.category(key));
		mav.setViewName("auction");
		return mav;
	}

	// 경매추가
	@RequestMapping(value = "/insertAuction", method = RequestMethod.GET)
	public String get(AuctionVO vo) {
		return "insertAuction";
	}

	@RequestMapping(value = "/insertAuction", method = RequestMethod.POST)
	public ModelAndView auction_insert(Model model, HttpSession session, AuctionVO vo) {
		ModelAndView mav = new ModelAndView();
		boolean result = dao.insert(vo);
		if (result) {
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
