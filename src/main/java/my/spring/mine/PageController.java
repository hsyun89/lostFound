package my.spring.mine;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.Mapper;
import dao.PageMaker;
import vo.LostVO;

@Controller
public class PageController{
	@Autowired
	private Mapper mapper;
	PageMaker pagemaker;
	@RequestMapping("/lost")
	public String list(HttpServletRequest request) {
		String pagenum = request.getParameter("pagenum");
		String contentnum = request.getParameter("contentnum");
		int cpagenum = Integer.parseInt(pagenum);
		int ccontentnum = Integer.parseInt(contentnum);
		
		pagemaker.settotalcount(mapper.lostcount());  //전체 게시글 개수를 지정
		pagemaker.setpagenum(cpagenum-1);  //현재 페이지를 페이지 객체에 지정. -1을 해야 쿼리에서 사용 가능
		pagemaker.setcontentnum(ccontentnum); //한 페이지에 몇 개씩 게시글을 보여줄지 지정
		pagemaker.setcurrentblock(cpagenum); //현재 페이지 블록이 몇 번인지 현재 페이지 번호를 통해서 지정
		pagemaker.setlastblock(pagemaker.gettotalcount());  //마지막 블록번호를 전체 게시글 수를 통해 결정
		pagemaker.prevnext(cpagenum);  //현재 페이지 번호를 화살표를 나타낼지 결정
		pagemaker.setstartpage(pagemaker.getcurrentblock());  //시작 페이지를 페이지 블록 번호로 정한다
		pagemaker.setendpage(pagemaker.getlastblock(), pagemaker.getcurrentblock());  //마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호를 정한다.
		
		List<LostVO> lostlist = new ArrayList<LostVO>();
			lostlist = mapper.lostlist(pagemaker.getpagenum()*10, pagemaker.getcontentnum());
			request.setAttribute("list", lostlist); 
			request.setAttribute("page", pagemaker);
			return "lostView";
	}
}