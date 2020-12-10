package com.project.petpal.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.petpal.board.model.vo.Question;
import com.project.petpal.board.model.vo.QuestionImg;

public interface QuestionDao {
	int insertQuestion(SqlSession session, Question q);
	int insertQuestionImg(SqlSession session, QuestionImg qi);
	List<Map> questionList(SqlSession session);
	List<Map> questionMainList(SqlSession session, String questionNo);
	List<Map> questionImgList(SqlSession session, String questionNo);
}
