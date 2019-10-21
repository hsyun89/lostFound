package my.spring.mine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.LostDAO;
import vo.PageMakerAndSearch;

@Controller
public class LostController {
	@Autowired
	LostDAO dao;
	@RequestMapping(value = "/lost", method = RequestMethod.GET)
	public String listPageSearch(@ModelAttribute("pageMaker") PageMakerAndSearch pageMaker, Model model) throws Exception{
		pageMaker.setTotalCount(dao.listPageCount(pageMaker));
		//model.addAttribute("listMain", dao.listMainSearch(pageMaker));
		if(pageMaker.getPage()!=0) {
			System.out.println(pageMaker.toString());
		}
		model.addAttribute("list", dao.listPageSearch(pageMaker));
		model.addAttribute("pageMaker", pageMaker);
		return "lost";
	}
}
