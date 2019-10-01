package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.LostVO;

public interface PageMapper {
	public List<LostVO> lostList(@Param("pagenum") int pagenum, @Param("contentnum") int contentnum);
	public int lostCount();
}
