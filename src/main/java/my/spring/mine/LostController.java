package my.spring.mine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.LostDAO;
import vo.LostVO;
import vo.PageMakerAndSearch;

@Controller
public class LostController {
	@Value("#{config['google.geo']}")
	private String GOOGLE_GEO;
	@Autowired
	LostDAO dao;
	@RequestMapping(value = "/lost", method = RequestMethod.GET)
	public String listPageSearch(@ModelAttribute("pageMaker") PageMakerAndSearch pageMaker, Model model) throws Exception{
		pageMaker.setTotalCount(dao.listPageCount(pageMaker));
		//model.addAttribute("listMain", dao.listMainSearch(pageMaker));
		model.addAttribute("list", dao.listPageSearch(pageMaker));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("geoCode", GOOGLE_GEO);
		System.out.println("출력"+pageMaker);
		return "lost";
	}
}
