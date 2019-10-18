package dao;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.AuctionLogVO;
import vo.AuctionVO;
import vo.ListVO;
import vo.UserVO;

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
		return list;
	}
	
	//경매추가
	public boolean insert(AuctionVO vo) {
		boolean result=true;
		String statement = "resource.AuctionMapper.insertAuction";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	//경매삭제
	public boolean delete(String unique_id) {
		boolean result = true;
		String statement = "resource.AuctionMapper.deleteAuction";
		if(session.delete(statement, unique_id) != 1)
			result = false;
		return result;
	}
	
	//경매 입찰 내역 인서트
	public boolean insertBiddingLog(AuctionLogVO vo) {
		boolean result=true;
		String statement = "resource.AuctionMapper.insertAuctionLog";
		if(session.insert(statement, vo) != 1)
			result = false;
		return result;
	}
	
	//경매 입찰자, 최고입찰가 확인
	public AuctionLogVO selectMaxPriceAndUser1(String productId) {
		AuctionLogVO result = null;
		AuctionLogVO result2 = null;
		String statement1 = "resource.AuctionMapper.selectMaxPriceAndUser";
		result = session.selectOne(statement1, productId);
		//if(result.getUser_id()!=null) {
			//String user_id = result.getUser_id();
//			String statement2 = "resource.AuctionMapper.selectMaxBidderInfo";
//			result2 = session.selectOne(statement2, user_id);
//			result.setUser_name(result2.getUser_name());
//			result.setEmail(result2.getEmail());
		//}
		//update(result);
		return result;
	}
	//경매 입찰자, 최고입찰가 확인
	public AuctionLogVO selectMaxPriceAndUser2(String productId) {
		AuctionLogVO result = null;
		AuctionLogVO result2 = null;
		String statement1 = "resource.AuctionMapper.selectMaxPriceAndUser";
		result = session.selectOne(statement1, productId);
		if(result.getUser_id()!=null) {
		String user_id = result.getUser_id();
			String statement2 = "resource.AuctionMapper.selectMaxBidderInfo";
			result2 = session.selectOne(statement2, user_id);
			result.setUser_name(result2.getUser_name());
			result.setEmail(result2.getEmail());
		}
		return result;
	}
	//입찰 내역 다 뽑기
	public List<AuctionLogVO> selectBiddingList(String productId){
		List<AuctionLogVO> list = null;
		String statement = "resource.AuctionMapper.selectBiddingList";
		list = session.selectList(statement,productId);
		//System.out.println("dao : " + key);
//		for(AuctionLogVO vo : list) {
//			System.out.println("입찰내역: " + vo);
//		}
		return list;
	}
	//30초 증가
	public boolean plusEndTime(AuctionVO vo) {
		boolean result = true;
		String statement = "resource.AuctionMapper.plusEndTime";
				if(session.update(statement,vo) != 1) {
					result = false;
				}
		return result;
	}
	//낙찰된 리스트
	public List<ListVO> selectBiddingComplete(String user_id){
		List<ListVO> list = null;
		ListVO result = new ListVO();
		ListVO vo = new ListVO();
		String serverTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		String statement = "resource.AuctionMapper.selectBiddingComplete";
		System.out.println(user_id);
		vo.setUser_id(user_id);
		vo.setEnd_date(serverTime);
		list = session.selectList(statement,vo);
		//System.out.println("dao : " + key);
		System.out.println(list);
		for(ListVO vo1 : list) {
			String productId=vo1.getUnique_id();
			statement = "resource.AuctionMapper.selectBCDetail";
			result = session.selectOne(statement,productId);
			vo1.setImage_address(result.getImage_address());
			vo1.setProduct_name(result.getProduct_name());
		}
		for(ListVO vo1 : list) {
		System.out.println("낙찰내역: " + vo1);
		}
		return list;
	}
	//결제완료
	public boolean completeBuy(ListVO vo) {
		boolean result = true;
		String statement = "resource.AuctionMapper.completeBuy";
				if(session.update(statement,vo) != 1) {
					result = false;
				}
		return result;
	}
	//결제왈료된 리스트
	public List<ListVO> selectBuyComplete(String user_id){
		List<ListVO> list = null;
		ListVO result = null;
		String statement = "resource.AuctionMapper.selectBuyComplete";
		list = session.selectList(statement,user_id);
		//System.out.println("dao : " + key);
		System.out.println(list);
		for(ListVO vo : list) {
			String productId=vo.getUnique_id();
			statement = "resource.AuctionMapper.selectBCDetail";
			result = session.selectOne(statement,productId);
			vo.setImage_address(result.getImage_address());
			vo.setProduct_name(result.getProduct_name());
			vo.setPrice(result.getPrice());
		}
		for(ListVO vo : list) {
		System.out.println("낙찰내역: " + vo);
		}
		return list;
	}
}
