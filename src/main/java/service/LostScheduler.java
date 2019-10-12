package service;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class LostScheduler {
	public String ServiceRun() {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection();
			r.eval("library(XML)");
			r.eval("library(rvest)");
			r.eval("imsi <- read_html(\"http://media.daum.net/ranking/popular/\")");
			r.eval("t <- htmlParse(imsi)");
			r.eval("newstitle <- xpathSApply(t,\"//a[@class='link_txt']\", xmlValue)");
			r.eval("newstitle <- gsub(\"\\t\", \"\", newstitle)");
			r.eval("newstitle <- gsub(\"[\\r\\n]\", \"\", newstitle)");
			r.eval("newstitle <- newstitle[1:5]");
			r.eval("newspapername <- xpathSApply(t,\"//span[@class='info_news']\", xmlValue)");
			r.eval("newspapername <- newspapername[1:5]");
			r.eval("daumnews <- cbind(newstitle, newspapername)");
			r.eval("write.csv(daumnews, \"daumnews2.csv\")");
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retStr;
	}
	@Scheduled(cron="10 * * * * *")
	public void scheduleRun() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Thread.sleep(2000);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(new java.util.Date()+"스케줄 실행(Lost):"+dateFormat.format(calendar.getTime()));
	}
}

//package service;
//
//import java.text.SimpleDateFormat;
//import java.util.Calendar;
//
//import org.rosuda.REngine.REXPMismatchException;
//import org.rosuda.REngine.Rserve.RserveException;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Service;
//
//@Service
//public class LostScheduler {
////	public static void ServiceRun() throws RserveException, REXPMismatchException{
////		RConnection rc = null;
////		try {
////			rc = new RConnection();
////			REXP x = rc.eval("imsi<-source('C:/Rstudy/lost.R', encoding = 'UTF-8'); imsi$value");
////			RList list = x.asList();
////			String[] addr = list.at("addr").asStrings();
////			String[] unique_id = list.at("unique_id").asStrings();
////			String[] content = list.at("content").asStrings();
////			String[] keep_place = list.at("keep_place").asStrings();
////			String[] image_address = list.at("image_address").asStrings();
////			String[] product_name = list.at("product_name").asStrings();
////			String[] find_date = list.at("find_date").asStrings();
////			String[] category = list.at("category").asStrings();
////			String[] find_place = list.at("find_place").asStrings();
////			Charset.forName("UTF-8");
////			
////			LostVO vo = new LostVO();
////			for(int i=0; i<unique_id.length; i++) {
////				vo.setAddr(addr[i]);
////				vo.setUnique_id(unique_id[i]);
////				vo.setContent(content[i]);
////				vo.setKeep_place(keep_place[i]);
////				vo.setImage_address(image_address[i]);
////				vo.setProduct_name(product_name[i]);
////				vo.setFind_date(find_date[i]);
////				vo.setCategory(category[i]);
////				vo.setFind_place(find_place[i]);
////			}
////		} catch (Exception e) {
////			System.out.println(e);
////		} finally {
////			rc.close();
////		}
////	}
//	@Scheduled(fixedDelay = 1000)
//	public void scheduleRun() throws RserveException, REXPMismatchException{
//		Calendar calendar = Calendar.getInstance();
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
//		try {
//			Thread.sleep(2000);
////			LostScheduler.ServiceRun();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println(new java.util.Date()+"스케줄 실행:"+dateFormat.format(calendar.getTime()));
//	}
//}
////	@Scheduled(cron = "* /5 * * * *") // 5분마다 실행
////	public void scheduleRun() {
////		RConnection rc = null;
////		Calendar calendar = Calendar.getInstance();
////		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
////		try {
////			rc = new RConnection();
////			REXP x = rc.eval("imsi<-source('C:/Rstudy/lost.R', encoding = 'UTF-8'); imsi$value");
////			RList list = x.asList();
////			String[] addr = list.at("addr").asStrings();
////			String[] unique_id = list.at("unique_id").asStrings();
////			String[] content = list.at("content").asStrings();
////			String[] keep_place = list.at("keep_place").asStrings();
////			String[] image_address = list.at("image_address").asStrings();
////			String[] product_name = list.at("product_name").asStrings();
////			String[] find_date = list.at("find_date").asStrings();
////			String[] category = list.at("category").asStrings();
////			String[] find_place = list.at("find_place").asStrings();
////			Charset.forName("UTF-8");
////			System.out.println("리스트 추가 완료");
////			LostVO vo = new LostVO();
////			for(int i=0; i<unique_id.length; i++) {
////				vo.setAddr(addr[i]);
////				vo.setUnique_id(unique_id[i]);
////				vo.setContent(content[i]);
////				vo.setKeep_place(keep_place[i]);
////				vo.setImage_address(image_address[i]);
////				vo.setProduct_name(product_name[i]);
////				vo.setFind_date(find_date[i]);
////				vo.setCategory(category[i]);
////				vo.setFind_place(find_place[i]);
////			}
////		}catch(Exception e) {
////			e.printStackTrace();
////		}finally {
////			rc.close();
////		}
////		System.out.println(new java.util.Date()+"스케줄 실행(lost):"+dateFormat.format(calendar.getTime()));
////	}
////	public static void ServiceRun() throws RserveException, REXPMismatchException{
////		RConnection rc = null;
////		Calendar calendar = Calendar.getInstance();
////		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
////		boolean flag = false;
////		try {
////			rc = new RConnection();
////			REXP x = rc.eval("imsi<-source('C:/Rstudy/lost.R', encoding = 'UTF-8'); imsi$value");
////			RList list = x.asList();
////			String[] addr = list.at("addr").asStrings();
////			String[] unique_id = list.at("unique_id").asStrings();
////			String[] content = list.at("content").asStrings();
////			String[] keep_place = list.at("keep_place").asStrings();
////			String[] image_address = list.at("image_address").asStrings();
////			String[] product_name = list.at("product_name").asStrings();
////			String[] find_date = list.at("find_date").asStrings();
////			String[] category = list.at("category").asStrings();
////			String[] find_place = list.at("find_place").asStrings();
////			Charset.forName("UTF-8");
////			
////			LostVO vo = new LostVO();
////			for(int i=0; i<unique_id.length; i++) {
////				vo.setAddr(addr[i]);
////				vo.setUnique_id(unique_id[i]);
////				vo.setContent(content[i]);
////				vo.setKeep_place(keep_place[i]);
////				vo.setImage_address(image_address[i]);
////				vo.setProduct_name(product_name[i]);
////				vo.setFind_date(find_date[i]);
////				vo.setCategory(category[i]);
////				vo.setFind_place(find_place[i]);
////			}
////			String date = dateFormat.format(calendar.getTime());
////			
////			File file = new File("C:/Rstudy/" + date + ".csv");
////			for (int i = 0; i < unique_id.length; i++) {
////				System.out.println(addr[i]);
////			}
////			if (!file.isFile())
////				flag = true;
////			FileWriter fw = new FileWriter(file, true);
////			if (flag) {
////				fw.write("addr, unique_id, content, keep_place, image_address, product_name, find_date, category, find_place\r\n");
////			}
////			for (int i = 0; i < unique_id.length; i++) {
////				fw.write(addr[i] + "," + unique_id[i] + "," + content[i] + "," + keep_place[i] + "," + image_address[i] + ","
////						+ product_name[i] + "," + find_date[i] + "," + category[i] + "," + find_place[i] + "\r\n");
////			}
////			fw.close();
////		} catch (Exception e) {
////			System.out.println(e);
////		} finally {
////			rc.close();
////		}
////	}
////}