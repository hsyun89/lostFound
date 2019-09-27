package dao;

import java.util.List;

import vo.LostVO;

public interface LostDAO {
	public List<LostVO> listAll();
	public LostVO listOne(String atcid);
	public List<LostVO> search(String keyword);
}