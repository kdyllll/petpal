package com.project.petpal.board.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.board.model.vo.Question;
import com.project.petpal.board.model.vo.QuestionImg;

public interface QuestionService {
	int insertQuestion(Question q, List<QuestionImg> files);
	List<Map> questionList();
	List<Map> questionMainList(String questionNo);
	List<Map> questionImgList(String questionNo);
}
