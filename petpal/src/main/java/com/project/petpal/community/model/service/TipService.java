package com.project.petpal.community.model.service;

import java.util.List;

import com.project.petpal.community.model.vo.Tip;
import com.project.petpal.community.model.vo.TipImg;

public interface TipService {
	int insertTip(Tip t, List<TipImg> files);
}
