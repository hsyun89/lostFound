package my.spring.mine;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.PageDAO;
import dao.PageMapper;
import vo.LostVO;

@Controller
public class PageController {
	@Autowired
	private PageMapper pagemapper;
	@RequestMapping("/lost")
	public String pageList(HttpServletRequest request) {
		PageDAO dao = new PageDAO();
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);

		dao.setTotalcount(pagemapper.lostCount());  //전체 게시글 개수를 지정
		dao.setPagenum(cpagenum-1);  //현재 페이지를 페이지 객체에 지정. -1을 해야 쿼리에서 사용 가능
		dao.setContentnum(ccontentnum); //한 페이지에 몇 개씩 게시글을 보여줄지 지정
		dao.setCurrentblock(cpagenum); //현재 페이지 블록이 몇 번인지 현재 페이지 번호를 통해서 지정
		dao.setLastblock(dao.getTotalcount());  //마지막 블록번호를 전체 게시글 수를 통해 결정
		dao.prevnext(cpagenum);  //현재 페이지 번호를 화살표를 나타낼지 결정
		dao.setStartPage(dao.getCurrentblock());  //시작 페이지를 페이지 블록 번호로 정한다
		dao.setEndPage(dao.getLastblock(), dao.getCurrentblock());  //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호를 정한다.
		
		List<LostVO> lostList = new ArrayList();
		lostList = pagemapper.lostList(dao.getPagenum()*10, dao.getContentnum());
		request.setAttribute("pageList", lostList);
		request.setAttribute("page", dao);
		return "lostView";
	}
}