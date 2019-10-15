package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AuctionLogVO;
import vo.AuctionVO;
import vo.ListVO;

@Repository
public class AuctionDAO {

	@Autowired
	SqlSession session = null;
	
	//경매리스트
	public List<ListVO> auctionlist() {
		List<ListVO> list = null;
		String statement = "resource.AuctionMapper.auctionlistAll";
		list = session.selectList(statement);
		return list;
	}
	
	//경매상세페이지
	public ListVO auctionOne(String productId) {
		ListVO result = null;
		String statement = "resource.AuctionMapper.auctionOne";
		result = session.selectOne(statement, productId);
		//update(result);
		return result;
	}
	
	//카테고리
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
	
	//경매추가
	public boolean insert(AuctionVO vo) {
		boolean result=true;
		String statement = "resource.AuctionMapper.insertAuction";
		if(session.insert(statement, vo) != 1)
			result = false;
		System.out.println("DAO : " + result);
		return result;
	}
	
	//경매 입찰 내역 인서트
	public boolean insertBiddingLog(AuctionLogVO vo) {
		System.out.println(vo);
		boolean result=true;
		String statement = "resource.AuctionMapper.insertAuctionLog";
		if(session.insert(statement, vo) != 1)
			result = false;
		System.out.println("DAO : " + result);
		return result;
	}
	
}
