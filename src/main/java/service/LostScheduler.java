//package service;
//
//import java.nio.charset.Charset;
//import java.text.SimpleDateFormat;
//import java.util.Calendar;
//
//import org.rosuda.REngine.REXP;
//import org.rosuda.REngine.REXPMismatchException;
//import org.rosuda.REngine.RList;
//import org.rosuda.REngine.Rserve.RConnection;
//import org.rosuda.REngine.Rserve.RserveException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Repository;
//import org.springframework.stereotype.Service;
//
//import dao.LostDAO;
//import vo.LostVO;
//
//@Service
//@Repository
//public class LostScheduler {
//	@Autowired
//	LostDAO dao;
//	@Scheduled(cron = "0 7 15 * * ?")
//	public String ServiceRun() throws RserveException, REXPMismatchException{
//		RConnection rc = null;
//		String retStr = "";
//		Calendar calendar = Calendar.getInstance();
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		System.out.println("스케줄 시작 : "+dateFormat.format(calendar.getTime()));
//		try {
//			rc = new RConnection();
//			REXP x = rc.eval("imsi<-source('C:/Rstudy/lost.R', encoding = 'UTF-8'); imsi$value");
//			RList list = x.asList();
//			String[] addr = list.at("addr").asStrings();
//			String[] unique_id = list.at("unique_id").asStrings();
//			String[] content = list.at("content").asStrings();
//			String[] keep_place = list.at("keep_place").asStrings();
//			String[] image_address = list.at("image_address").asStrings();
//			String[] product_name = list.at("product_name").asStrings();
//			String[] find_date = list.at("find_date").asStrings();
//			String[] category = list.at("category").asStrings();
//			String[] find_place = list.at("find_place").asStrings();
//			Charset.forName("UTF-8");
//			System.out.println("R 완료 : "+dateFormat.format(calendar.getTime()));
//			
//			LostVO vo = new LostVO();
//			for (int i = 0; i < unique_id.length; i++) {
//				vo.setAddr(addr[i]);
//				vo.setUnique_id(unique_id[i]);
//				vo.setContent(content[i]);
//				vo.setKeep_place(keep_place[i]);
//				vo.setImage_address(image_address[i]);
//				vo.setProduct_name(product_name[i]);
//				vo.setFind_date(find_date[i]);
//				vo.setCategory(category[i]);
//				vo.setFind_place(find_place[i]);
//				dao.insertLost(vo);
//			}
//		} catch (Exception e) {
//			System.out.println(e);
//		} finally {
//			rc.close();
//			System.out.println(new java.util.Date()+"DB INSERT 완료:"+dateFormat.format(calendar.getTime()));
//		}
//		return retStr;
//	}
//}