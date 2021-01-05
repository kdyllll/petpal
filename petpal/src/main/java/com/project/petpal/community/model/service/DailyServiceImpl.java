package com.project.petpal.community.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.community.model.dao.DailyDao;
import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyComment;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;
import com.project.petpal.community.model.vo.Hashtag;
import com.project.petpal.store.model.vo.ProductImg;

@Service
public class DailyServiceImpl implements DailyService {

	@Autowired
	private SqlSession session;
	@Autowired
	private DailyDao dao;
	
	@Override
	@Transactional
	public int insertDaily(Daily d, List<DailyImg> files, List<DailyCoord> coords,List<Hashtag> hashList){
		//글 삽입
		int result=dao.insertDaily(session,d);
		//사진 삽입
		if(result>0) {
			if(files!=null) {//사진이 있을 때
				for(DailyImg di:files) {
					di.setDailyNo(d.getDailyNo());
					result=dao.insertDailyImg(session,di);
					//실패할 경우를 대비해서 result가 0일 때는 분기문으로 강제 exception 처리해야함	
				}
				//좌표 삽입(사진이 있을 때만 좌표 있음!)
				if(result>0) { 
					if(coords!=null) { 
						for(DailyCoord dc:coords) {
							switch(dc.getIndex()) {
								case "0":dc.setDailyImgNo(files.get(0).getDailyImgNo());break;
								case "1":dc.setDailyImgNo(files.get(1).getDailyImgNo());break;
								case "2":dc.setDailyImgNo(files.get(2).getDailyImgNo());break;
								case "3":dc.setDailyImgNo(files.get(3).getDailyImgNo());break;
								case "4":dc.setDailyImgNo(files.get(4).getDailyImgNo());break;
							}
							result=dao.insertDailyCoords(session,dc);
						}
					}
					//해시태그 삽입
					if(result>0) {
						if(hashList.size()!=0) {//해시태그가 있으면
							for(Hashtag h:hashList) {
								h.setPostNo(d.getDailyNo());
								result=dao.insertHashtag(session,h);
							}
						}
					}
				}
			}
		}
		
		return result;
	}
	
	@Override
	public List<Product> selectProductName(String key) {
		return dao.selectProductName(session,key);
	}

	@Override
	public String selectProductNo(String name) {		
		return dao.selectProductNo(session,name);
	}

	@Override
	public ProductImg selectDailyProduct(String productNo) {
		return dao.selectDailyProduct(session,productNo);
	}

	@Override
	public List<Product> selectProductAll() {
		return dao.selectProductAll(session);
	}

	@Override
	public List<Map> selectDailyAll(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectDailyAll(session,cPage,numPerPage);
	}

	@Override
	public List<DailyImg> selectMainImg() {
		// TODO Auto-generated method stub
		return dao.selectMainImg(session);
	}

	@Override
	public List<Hashtag> selectHashAll() {
		// TODO Auto-generated method stub
		return dao.selectHashAll(session);
	}

	@Override
	public Map selectDailyOne(String dailyNo) {
		// TODO Auto-generated method stub
		return dao.selectDailyOne(session,dailyNo);
	}

	@Override
	public List<DailyImg> selectDailyImg(String dailyNo) {
		// TODO Auto-generated method stub
		return dao.selectDailyImg(session,dailyNo);
	}

	@Override
	public List<Hashtag> selectHashList(String dailyNo) {
		// TODO Auto-generated method stub
		return dao.selectHashList(session,dailyNo);
	}

	@Override
	public List<Map> selectCoordList(String dailyNo) {
		// TODO Auto-generated method stub
		return dao.selectCoordList(session,dailyNo);
	}

	@Override
	public ProductImg selectProductImg(String productNo) {
		// TODO Auto-generated method stub
		return dao.selectProductImg(session,productNo);
	}

	@Override
	public int deleteDaily(String dailyNo) {
		// TODO Auto-generated method stub
		return dao.deleteDaily(session,dailyNo);
	}

	@Override
	public List<Map> selectDailyListOne(String memberNo) {
		// TODO Auto-generated method stub
		return dao.selectDailyListOne(session, memberNo);
	}

	@Override
	public int dailyCnt(String memberNo) {
		// TODO Auto-generated method stub
		return dao.dailyCnt(session, memberNo);
	}

	@Override
	public int totalDailyCount() {
		// TODO Auto-generated method stub
		return dao.totalDailyCount(session);
	}

	@Override
	@Transactional
	public int updateDaily(Daily d, List<Hashtag> hashList, List<DailyCoord> coords,List<Map> fileList, List<DailyImg> updateFile,
			List<DailyImg> newFile) {
		// TODO Auto-generated method stub
		//fileList (사진번호, 상태(none,delete,update), 파일이름)
		int result=1;
		int updateCnt=0;
		//기존 사진 변화
		for(Map m:fileList) {
			String status=(String) m.get("change");
			String imgNo=(String) m.get("dailyImgNo");
			if(status.equals("delete")) {//사진 상태가 삭제면 행삭제
				result=dao.deleteDailyImg(session,imgNo);
			}else if(status.equals("update")) {//사진 상태가 업데이트면 파일명 업데이트
				updateFile.get(updateCnt).setDailyImgNo(imgNo);
				result=dao.updateDailyImg(session,updateFile.get(updateCnt));
				updateCnt++;
			}//변화없으면 아무것도 X	
			
			//사진에 얽힌 모든 좌표 지우기
			dao.deleteAllCoords(session,imgNo);
		}
		//새로운 사진 삽입
		if(result>0) {
			if(newFile!=null) {
				for(DailyImg di:newFile) {
				result=dao.insertDailyImg(session, di);
				}
			}
		}
		
		List<DailyImg> imgList=dao.selectDailyImg(session, d.getDailyNo());
		//메인사진M
		String status=(String) fileList.get(0).get("change");
		if(result>0&&status.equals("delete")) {//메인사진이 지워진상태라면
			result=dao.updateImgStatus(session,imgList.get(0));
		}
		//내용, 해시, 좌표는 다 삭제하고 새로 삽입	
		if(result>0) { 
			//좌표 삽입
			if(result>0) {
				if(coords!=null) { 
					for(DailyCoord dc:coords) {
						switch(dc.getIndex()) {
							case "0":dc.setDailyImgNo(imgList.get(0).getDailyImgNo());break;
							case "1":dc.setDailyImgNo(imgList.get(1).getDailyImgNo());break;
							case "2":dc.setDailyImgNo(imgList.get(2).getDailyImgNo());break;
							case "3":dc.setDailyImgNo(imgList.get(3).getDailyImgNo());break;
							case "4":dc.setDailyImgNo(imgList.get(4).getDailyImgNo());break;
						}
						result=dao.insertDailyCoords(session,dc);
					}
				}
			}
			//해시태그 삭제
			dao.deleteAllHash(session,d.getDailyNo());

			//해시태그 삽입
			if(result>0) {
				if(hashList.size()!=0) {//해시태그가 있으면
					for(Hashtag h:hashList) {
						h.setPostNo(d.getDailyNo());
						result=dao.insertHashtag(session,h);
					}
				}
			}
			//글 내용 수정
			if(result>0) {
				result=dao.updateDailyContent(session,d);
			}
		}
		

		return result;
	}

	@Override
	public List<DailyComment> selectComment(String dailyNo,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectComment(session,dailyNo,cPage,numPerPage);
	}

	@Override
	public int countComment(String dailyNo) {
		// TODO Auto-generated method stub
		return dao.countComment(session,dailyNo);
	}
	
	@Override
	public int countCommentPage(String dailyNo) {
		// TODO Auto-generated method stub
		return dao.countCommentPage(session,dailyNo);
	}

	@Override
	public int insertComment(DailyComment dc) {
		// TODO Auto-generated method stub
		return dao.insertComment(session,dc);
	}

	@Override
	@Transactional
	public int commentDelete(String dailyCommentNo) {
		// TODO Auto-generated method stub
		//자기 자신을 참조하는 댓글(=대댓글)이 있다면 상태만 D로 변경
		int result=dao.commentDelete(session,dailyCommentNo);
		//대댓글이 없다면 댓글 삭제 처리
		if(result<1) {
			result=dao.comment2Delete(session,dailyCommentNo);
		}		
		return result;
	}

	@Override
	public int comment2Delete(String dailyCommentNo) {
		// TODO Auto-generated method stub
		return dao.comment2Delete(session,dailyCommentNo);
	}

	@Override
	public List<Map> selectDailyHeart(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectDailyHeart(session,cPage,numPerPage);
	}

	@Override
	public List<Map> selectDailyFollow(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectDailyFollow(session,cPage,numPerPage);
	}

	@Override
	public List<Map> selectDailyHeartWeek(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.selectDailyHeartWeek(session,cPage,numPerPage);
	}

	
	


}
