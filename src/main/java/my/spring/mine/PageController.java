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

		dao.setTotalcount(pagemapper.lostCount());  //��ü �Խñ� ������ ����
		dao.setPagenum(cpagenum-1);  //���� �������� ������ ��ü�� ����. -1�� �ؾ� �������� ��� ����
		dao.setContentnum(ccontentnum); //�� �������� �� ���� �Խñ��� �������� ����
		dao.setCurrentblock(cpagenum); //���� ������ ����� �� ������ ���� ������ ��ȣ�� ���ؼ� ����
		dao.setLastblock(dao.getTotalcount());  //������ ��Ϲ�ȣ�� ��ü �Խñ� ���� ���� ����
		dao.prevnext(cpagenum);  //���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ����
		dao.setStartPage(dao.getCurrentblock());  //���� �������� ������ ��� ��ȣ�� ���Ѵ�
		dao.setEndPage(dao.getLastblock(), dao.getCurrentblock());  //������ �������� ������ ������ ��ϰ� ���� ������ ��� ��ȣ�� ���Ѵ�.
		
		List<LostVO> lostList = new ArrayList();
		lostList = pagemapper.lostList(dao.getPagenum()*10, dao.getContentnum());
		request.setAttribute("pageList", lostList);
		request.setAttribute("page", dao);
		return "lostView";
	}
}