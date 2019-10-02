package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.LostVO;

public interface Mapper {
	public List<LostVO> lostlist(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum);
	public int lostcount();
}
