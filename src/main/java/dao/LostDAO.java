package dao;

import java.util.List;

import vo.LostVO;
import vo.PageMakerAndSearch;

public interface LostDAO {
	public List<LostVO> listPageSearch(PageMakerAndSearch pageMaker) throws Exception;
	public int listPageCount(PageMakerAndSearch pageMaker) throws Exception;
	public boolean insertLost(LostVO vo) throws Exception;
}