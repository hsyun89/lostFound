package service;

import java.io.File;
import java.io.FileWriter;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class LostScheduler {
	@Scheduled(cron = "10 * * * * *") // 10시
	public void scrapRun() {
		RConnection rc = null;
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		boolean flag = false;

		try {
			rc = new RConnection();

			REXP x = rc.eval("imsi<-source('C:/mine/lost.R', encoding = 'UTF-8'); imsi$value");
			RList list = x.asList();
			String[] addr = list.at("addr").asStrings();
			String[] atcid = list.at("atcid").asStrings();
			String[] fdsbjt = list.at("fdsbjt").asStrings();
			String[] depplace = list.at("depplace").asStrings();
			String[] fdfilepathimg = list.at("fdfilepathimg").asStrings();
			String[] fdprdtnm = list.at("fdprdtnm").asStrings();
			String[] fdymd = list.at("fdymd").asStrings();
			String[] prdtclnm = list.at("prdtclnm").asStrings();
			String[] lon = list.at("lon").asStrings();
			String[] lat = list.at("lat").asStrings();
			Charset.forName("UTF-8");

			String date = dateFormat.format(calendar.getTime());

			File file = new File("C:/mine/" + date + ".csv");
			for (int i = 0; i < atcid.length; i++) {
				System.out.println(addr[i]);
			}
			if (!file.isFile())
				flag = true;
			FileWriter fw = new FileWriter(file, true);
			if (flag) {
				fw.write("addr,atcid,fdsbjt,depplace,fdfilepathimg,fdprdtnm,fdymd,prdtclnm,lon,lat\r\n");
			}
			for (int i = 0; i < atcid.length; i++) {
				fw.write(addr[i] + "," + atcid[i] + "," + fdsbjt[i] + "," + depplace[i] + "," + fdfilepathimg[i] + ","
						+ fdprdtnm[i] + "," + fdymd[i] + "," + prdtclnm[i] + "," + lon[i] + "," + lat[i] + "\r\n");
			}
			fw.close();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			rc.close();
		}
	}

}
