package com.summer.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.summer.dto.Dayoff;
import com.summer.dto.GroupWorkingHour;
import com.summer.dto.Workflow;
import com.summer.dto.WorkflowCategory;
import com.summer.dto.WorkflowDate;
import com.summer.dto.WorkingHour;

public interface HeService {
	
	public int whgotimeInsert(WorkingHour wh);
	public int whleavetimeUpdate(WorkingHour wh);
	public List<WorkingHour> monthlyWorkingHour(Map<String, String> para);
	//public WorkingHour selectDate(WorkingHour wh);
	public int insertWorkFlow(Workflow wf);
	public int editWorkingHour(WorkingHour wh);
	public int insertOriginWH(Map<String, String> para);
	public int totalDayOff(String para); 
	public int useDayOffSum(String para);
	public List<String> selectName(String para);
	//public List<WorkingHour> groupWorkingHour(Map<String, String> para);
	public List<Dayoff> groupUseDayOff(Map<String, String> para);
	public List<WorkflowDate> selectWfapplyDate(String para);
	public List<Integer> dateDiff(String para);
	public int insertDayOff(Workflow wf);
	public List<Workflow> listWorkflow(String para);
	public WorkflowCategory workflowcategoryView(int para);
	//public WorkflowCategory workflowCategoryView(int para);
	public List<String> groupLeaderId();
	public int deleteWorkflow(Workflow wf);
	public List<Workflow> groupWorkflow(String para);
	public String groupname(String para);
	//public List<Integer> useDayOffDate(String para);
	public List<GroupWorkingHour> groupWorkingHour(Map<String, String> para);
	public WorkingHour selectWorkingHour(WorkingHour wh);
	public Workflow detailWorkflow(Workflow wf);
	public int acceptworkflow(Workflow wf);
	public int rejectworkflow(Workflow wf);
	public int selectdateDiff(Workflow wf);
}
