package service;

import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import vo.LostVO;

@Service
public class LostScheduler {
	@Scheduled(cron = "* * 6 * * *") // 매일 6시에 실행
	public void scheduleRun() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		try {
			Thread.sleep(2000);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(new java.util.Date()+"스케줄 실행:"+dateFormat.format(calendar.getTime()));
	}
	public void ServiceRun() {
		RConnection rc = null;
//		Calendar calendar = Calendar.getInstance();
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
//		boolean flag = false;
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
			
			LostVO vo = new LostVO();
			for(int i=0; i<unique_id.length; i++) {
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
//			String date = dateFormat.format(calendar.getTime());
//			
//			File file = new File("C:/Rstudy/" + date + ".csv");
//			for (int i = 0; i < Unique_id.length; i++) {
//				System.out.println(Addr[i]);
//			}
//			if (!file.isFile())
//				flag = true;
//			FileWriter fw = new FileWriter(file, true);
//			if (flag) {
//				fw.write("Addr, Unique_id, Content, Keep_place, Image_address, Product_name, Find_date, Category, Find_place\r\n");
//			}
//			for (int i = 0; i < Unique_id.length; i++) {
//				fw.write(Addr[i] + "," + Unique_id[i] + "," + Content[i] + "," + Keep_place[i] + "," + Image_address[i] + ","
//						+ Product_name[i] + "," + Find_date[i] + "," + Category[i] + "," + Find_place[i] + "\r\n");
//			}
//			fw.close();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			rc.close();
		}
	}
}