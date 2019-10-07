package dao;

import java.util.List;

import vo.LostVO;
import vo.PageMakerAndSearch;

public interface LostDAO {
	public List<LostVO> listMainSearch(PageMakerAndSearch pageMaker) throws Exception;
	public List<LostVO> listPageSearch(PageMakerAndSearch pageMaker) throws Exception;
	public int listPageCount(PageMakerAndSearch pageMaker) throws Exception;
}