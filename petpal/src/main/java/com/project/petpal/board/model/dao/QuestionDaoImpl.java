package com.project.petpal.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.petpal.board.model.vo.Question;
import com.project.petpal.board.model.vo.QuestionImg;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	@Override
	public int insertQuestion(SqlSession session, Question q) {
		return session.insert("question.insertQuestion", q);
	}

	@Override
	public int insertQuestionImg(SqlSession session, QuestionImg qi) {
		return session.insert("question.insertQuestionImg", qi);
	}

	@Override
	public List<Map> questionList(SqlSession session) {
		return session.selectList("question.questionList");
	}

	@Override
	public List<Map> questionMainList(SqlSession session, String questionNo) {
		return session.selectList("question.questionMainList", questionNo);
	}

	@Override
	public List<Map> questionImgList(SqlSession session, String questionNo) {
		return session.selectList("question.questionImgList", questionNo);
	}
}
