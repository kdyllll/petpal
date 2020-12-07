package com.project.petpal.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petpal.board.model.dao.QuestionDao;
import com.project.petpal.board.model.vo.NoticeImg;
import com.project.petpal.board.model.vo.Question;
import com.project.petpal.board.model.vo.QuestionImg;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private SqlSession session;
	
	@Autowired
	private QuestionDao dao;

	@Override
	public int insertQuestion(Question q, List<QuestionImg> files) {
		int result = dao.insertQuestion(session, q);

		if(result>0) {
			if(files!=null) {
				for(QuestionImg img: files) {
					img.setQuestionNo(q.getQuestionNo());
					result = dao.insertQuestionImg(session, img);
				}
			}
		}
		
		return result;
	}

	@Override
	public List<Map> questionList() {
		return dao.questionList(session);
	}

	@Override
	public List<Map> questionMainList(String questionNo) {
		return dao.questionMainList(session, questionNo);
	}

	@Override
	public List<Map> questionImgList(String questionNo) {
		return dao.questionImgList(session, questionNo);
	}
}
