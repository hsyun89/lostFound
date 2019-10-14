package service;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import dao.LostDAO;
import vo.LostVO;

@Service
public class LostScheduler {
	@Autowired
	static LostVO vo;
	@Autowired
	static LostDAO dao;
	@Scheduled(cron = "0 0/48 * * * ?")
	public static LostVO ScheduleRun() throws RserveException, REXPMismatchException {
		RConnection rc = null;
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		try {
			rc = new RConnection();
			REXP x = rc.eval("imsi<-source('C:/Rstudy/lost.R', encoding = 'UTF-8'); imsi$value");
			RList list = x.asList();
			String[] addr = list.at("addr").asStrings();
			String[] unique_id = list.at("unique_id").asStrings();
			String[] content = list.at("content").asStrings();
			String[] keep_place = list.at("keep_place").asStrings();
			String[] image_address = list.at("image_address").asStrings();
			String[] product_name = list.at("product_name").asStrings();
			String[] find_date = list.at("find_date").asStrings();
			String[] category = list.at("category").asStrings();
			String[] find_place = list.at("find_place").asStrings();
			Charset.forName("UTF-8");
			
			//LostVO vo = new LostVO();
			for (int i = 0; i < unique_id.length; i++) {
				vo.setAddr(addr[i]);
				vo.setUnique_id(unique_id[i]);
				vo.setContent(content[i]);
				vo.setKeep_place(keep_place[i]);
				vo.setImage_address(image_address[i]);
				vo.setProduct_name(product_name[i]);
				vo.setFind_date(find_date[i]);
				vo.setCategory(category[i]);
				vo.setFind_place(find_place[i]);
			}
			System.out.println(addr[1]);
			System.out.println(unique_id[1]);
			System.out.println(content[1]);
			System.out.println(keep_place[1]);
			System.out.println(image_address[1]);
			System.out.println(product_name[1]);
			System.out.println(find_date[1]);
			System.out.println(category[1]);
			System.out.println(find_place[1]);
			dao.insertLost(vo);
		} catch (Exception e) {
			System.out.println(e);
		}
		rc.close();
		System.out.println(new java.util.Date() + "스케줄 실행(Lost):" + dateFormat.format(calendar.getTime()));
		return vo;
	}
}