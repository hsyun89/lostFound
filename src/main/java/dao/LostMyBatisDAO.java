package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.LostVO;
@Repository
public class LostMyBatisDAO implements LostDAO{
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	public List<LostVO> listAll(){
		List<LostVO> list=null;
		SqlSession session = sqlSessionFactory.openSession();	
		String statement = "LostMapper.selectLost";
		list = session.selectList(statement);
		System.out.println(list.get(0).getLat()+" "+list.get(0).getLon());
	    session.close();
		return list;
	}
	public LostVO listOne(String actid){
		LostVO list=null;
		SqlSession session = sqlSessionFactory.openSession();	
		String statement = "LostMapper.selectLostOne";
		list = session.selectOne(statement, actid);
	    session.close();
		return list;
	}
	public List<LostVO> search(String keyword){
		List<LostVO> list=null;
		SqlSession session = sqlSessionFactory.openSession();	
		String statement = "LostMapper.searchLost";
		list = session.selectList(statement, keyword);
		session.close();
		return list;
	}
}