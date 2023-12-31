package com.summer.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.summer.dao.HeDao;
import com.summer.dto.Dayoff;
import com.summer.dto.GroupUserInfo;
import com.summer.dto.GroupWorkingHour;
import com.summer.dto.Workflow;
import com.summer.dto.WorkflowCategory;
import com.summer.dto.WorkflowDate;
import com.summer.dto.WorkingHour;

@Service
public class HeServiceImpl implements HeService{
	
	@Autowired
	HeDao dao;

	@Override
	public int whgotimeInsert(WorkingHour wh) {
		return dao.whgotimeInsert(wh);
	}

	@Override
	public int whleavetimeUpdate(WorkingHour wh) {
		return dao.whleavetimeUpdate(wh);
	}

	@Override
	public List<WorkingHour> monthlyWorkingHour(Map<String, String> para) {
	
		return dao.monthlyWorkingHour(para);
	}

	@Override
	public int insertWorkFlow(Workflow wf) {
		return dao.insertWorkFlow(wf);
	}

	@Override
	public int editWorkingHour(WorkingHour wh) {
		return dao.editWorkingHour(wh);
	}

	@Override
	public int insertOriginWH(Map<String, String> para) {
		return dao.insertOriginWH(para);
	}

	@Override
	public int totalDayOff(String para) {
		return dao.totalDayOff(para);
	}

	@Override
	public int useDayOffSum(String para) {
		return dao.useDayOffSum(para);
	}

	@Override
	public List<GroupUserInfo> selectName(String para) {
		return dao.selectName(para);
	}

	@Override
	public List<Dayoff> groupUseDayOff(Map<String, String> para) {
		return dao.groupUseDayOff(para);
	}

	@Override
	public List<WorkflowDate> selectWfapplyDate(String para) {
		List<WorkflowDate> list = new ArrayList<>();
		list = dao.selectWfapplyDate(para);
		return list;
	}

	  @Override public List<Integer> dateDiff(String para) { return
	  dao.dateDiff(para); }
	 

	@Override
	public int insertDayOff(Workflow wf) {
		return dao.insertDayOff(wf);
	}

	@Override
	public List<Workflow> listWorkflow(String para) {
		return dao.listWorkflow(para);
	}

	@Override
	public WorkflowCategory workflowcategoryView(int para) {
		return dao.workflowcategoryView(para);
	}

	@Override
	public List<String> groupLeaderId() {
		return dao.groupLeaderId();
	}

	@Override
	public int deleteWorkflow(Workflow wf) {
		return dao.deleteWorkflow(wf);
	}

	@Override
	public List<Workflow> groupWorkflow(String para) {
		return dao.groupWorkflow(para);
	}

	@Override
	public String groupname(String para) {
		return dao.groupname(para);
	}

	@Override
	public List<GroupWorkingHour> groupWorkingHour(Map<String, String> para) {	
	return dao.groupWorkingHour(para);
	}

	@Override
	public WorkingHour selectWorkingHour(WorkingHour wh) {
	  WorkingHour result = new WorkingHour(); 
	  result = dao.selectWorkingHour(wh);

	return result  != null ? result : new WorkingHour(0, "00:00", "00:00", "test");
	}

	@Override
	public Workflow detailWorkflow(Workflow wf) {
		return dao.detailWorkflow(wf);
	}

	@Override
	public int acceptworkflow(Workflow wf) {
		return dao.acceptworkflow(wf);
	}

	@Override
	public Integer selectdateDiff(Workflow wf) {
		return dao.selectdateDiff(wf)==null?0:dao.selectdateDiff(wf);
	}

	@Override
	public int rejectworkflow(Workflow wf) {
		return dao.rejectworkflow(wf);
	}

	@Override
	public List<String> groupId() {
		return dao.groupId();
	}

	@Override
	public int insertWorkFlowLeader(Workflow wf) {
		return dao.insertWorkFlowLeader(wf);
	}

	@Override
	public int selectwfsrn(String para) {
		return dao.selectwfsrn(para);
	}
}
