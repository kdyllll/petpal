package com.project.petpal.community.model.service;

import java.util.List;

import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindImg;

public interface FindService {
	int insertFindWrite(Find f, List<FindImg> lfi, FindImg fi);
}