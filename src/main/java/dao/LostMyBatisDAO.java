package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.LostVO;
import vo.PageMakerAndSearch;
@Repository
public class LostMyBatisDAO implements LostDAO{
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	public List<LostVO> listMainSearch(PageMakerAndSearch pageMaker) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();
		String statement = "LostMapper.listMainSearch";
		return session.selectList(statement, pageMaker);
	}
	@Override
	public List<LostVO> listPageSearch(PageMakerAndSearch pageMaker) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();
		String statement = "LostMapper.listPageSearch";
		return session.selectList(statement, pageMaker);
	}
	@Override
	public int listPageCount(PageMakerAndSearch pageMaker) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();	
		String statement = "LostMapper.listPageCount";
	    return session.selectOne(statement, pageMaker);
	}
}