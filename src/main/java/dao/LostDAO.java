package dao;

import java.util.List;

import vo.LostVO;
import vo.PageMaker;

public interface LostDAO {
	public List<LostVO> listAll();
	public LostVO listOne(String atcid);
	public List<LostVO> search(String keyword);
	
	//물품목록 출력 페이징 처리 및 검색처리
	public List<LostVO> listPageSearch(PageMaker pmas) throws Exception;
	public int listPageCount(PageMaker pageMaker) throws Exception;
}