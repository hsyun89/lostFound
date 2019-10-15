package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import service.LostScheduler;
import vo.LostVO;
import vo.PageMakerAndSearch;
@Repository
public class LostMyBatisDAO implements LostDAO{
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	@Override
	public List<LostVO> listMainSearch(PageMakerAndSearch pageMaker) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();
		String statement = "LostMapper.listMainSearch";
		return session.selectList(statement, pageMaker);
	}
	@Override
	public List<LostVO> listPageSearch(PageMakerAndSearch pageMaker) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();
		String statement = "LostMapper.listPageSearch";
		System.out.println("place"+pageMaker.getSearchType());
		List<LostVO> list =session.selectList(statement, pageMaker);
		return list;
	}
	@Override
	public int listPageCount(PageMakerAndSearch pageMaker) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();	
		String statement = "LostMapper.listPageCount";
	    return session.selectOne(statement, pageMaker);
	}
	@Override
	public boolean insertLost(LostVO vo) throws Exception{
		boolean result=true;
		SqlSession session = sqlSessionFactory.openSession();
		String statement = "LostMapper.insertLost";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
}