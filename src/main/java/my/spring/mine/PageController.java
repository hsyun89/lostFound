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
		
		pagemaker.settotalcount(mapper.lostcount());  //��ü �Խñ� ������ ����
		pagemaker.setpagenum(cpagenum-1);  //���� �������� ������ ��ü�� ����. -1�� �ؾ� �������� ��� ����
		pagemaker.setcontentnum(ccontentnum); //�� �������� �� ���� �Խñ��� �������� ����
		pagemaker.setcurrentblock(cpagenum); //���� ������ ����� �� ������ ���� ������ ��ȣ�� ���ؼ� ����
		pagemaker.setlastblock(pagemaker.gettotalcount());  //������ ��Ϲ�ȣ�� ��ü �Խñ� ���� ���� ����
		pagemaker.prevnext(cpagenum);  //���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ����
		pagemaker.setstartpage(pagemaker.getcurrentblock());  //���� �������� ������ ��� ��ȣ�� ���Ѵ�
		pagemaker.setendpage(pagemaker.getlastblock(), pagemaker.getcurrentblock());  //������ �������� ������ ������ ��ϰ� ���� ������ ��� ��ȣ�� ���Ѵ�.
		
		List<LostVO> lostlist = new ArrayList<LostVO>();
			lostlist = mapper.lostlist(pagemaker.getpagenum()*10, pagemaker.getcontentnum());
			request.setAttribute("list", lostlist); 
			request.setAttribute("page", pagemaker);
			return "lostView";
	}
}