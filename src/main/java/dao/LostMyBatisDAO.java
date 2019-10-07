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
	@Override
	public LostVO listLostOne(String unique_id) throws Exception{
		SqlSession session = sqlSessionFactory.openSession();	
<<<<<<< HEAD
<<<<<<< HEAD
		String statement = "LostMapper.listLostOne";
		return session.selectOne(statement, unique_id);
=======
		String statement = "LostMapper.searchLost";
		list = session.selectList(statement, keyword);
		session.close();
		System.out.println(list.get(0).getProduct_name());
		System.out.println(list.get(0).getFind_date());
		return list;
>>>>>>> somiBranch
		
=======
		String statement = "LostMapper.listLostOne";
	    return session.selectOne(statement, unique_id);
>>>>>>> kyungjun
	}
}