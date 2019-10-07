package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AuctionVO;
import vo.ListVO;

@Repository
public class AuctionDAO {

	@Autowired
	SqlSession session = null;
	
	//��� ����Ʈ
	public List<ListVO> auctionlist() {
		List<ListVO> list = null;
		String statement = "resource.AuctionMapper.auctionlistAll";
		list = session.selectList(statement);
		return list;
	}
	
	//ī�װ�
	public List<ListVO> category(String key){
		List<ListVO> list = null;
		String statement = "resource.AuctionMapper.category";
		list = session.selectList(statement,key);
		System.out.println("dao : " + key);
		for(ListVO vo : list) {
			System.out.println(vo.getCategory());
		}
		return list;
	}
	
	//��� �߰�
	public boolean insert(AuctionVO vo) {
		boolean result=true;
		String statement = "resource.AuctionMapper.insertAuction";
		if(session.insert(statement, vo) != 1)
			result = false;
		System.out.println("DAO : " + result);
		return result;
	}
	
}
