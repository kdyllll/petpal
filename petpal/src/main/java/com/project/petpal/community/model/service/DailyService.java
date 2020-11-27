package com.project.petpal.community.model.service;

import java.util.List;

import com.project.petpal.community.model.vo.Daily;
import com.project.petpal.community.model.vo.DailyCoord;
import com.project.petpal.community.model.vo.DailyImg;

public interface DailyService {

	int insertDaily(Daily d,List<DailyImg> files,List<DailyCoord> coords);
}
