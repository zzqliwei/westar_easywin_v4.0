package com.westar.core.web.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.westar.base.cons.CommonConstant;
import com.westar.base.model.UserInfo;
import com.westar.base.pojo.BaseTalk;
import com.westar.base.pojo.HttpResult;
import com.westar.base.pojo.PageBean;
import com.westar.core.service.DemandTalkService;
import com.westar.core.web.PaginationContext;
/**
 * 描述:需求留言控制层
 * @author zzq
 * @date 2018年10月12日 下午1:35:24
 */
@Controller
@RequestMapping("/demandTalk")
public class DemandTalkController extends BaseController{

	@Autowired
	DemandTalkService demandTalkService;
	
	/**
	 * 跳转到需求留言界面
	 * @return
	 */
	@RequestMapping("/demandTalkPage")
	public ModelAndView demandTalkPage(){
		ModelAndView mav = new ModelAndView("/common/modTalk");
		UserInfo sessionUser = this.getSessionUser();
		mav.addObject("userInfo", sessionUser);
		return mav;
	}
	/**
	 * 分页查询需求留言信息
	 * @param busId
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/ajaxListPagedTalk")
	public HttpResult<PageBean<BaseTalk>> ajaxListPagedDemandTalk(Integer busId,
			Integer pageNum,Integer pageSize){
		UserInfo sessionUser = this.getSessionUser();
		if(null == sessionUser){
			return new HttpResult<PageBean<BaseTalk>>().error(CommonConstant.OFF_LINE_INFO); 
		}
		pageNum = null == pageNum ? 0 : pageNum;
		pageSize = null == pageSize ? 15 : pageSize;
		// 一次加载行数
		PaginationContext.setPageSize(pageSize);
		// 列表数据起始索引位置
		PaginationContext.setOffset(pageNum * PaginationContext.getPageSize());
		
		PageBean<BaseTalk> pageBean = demandTalkService.listPagedDemandTalk(sessionUser,busId);
		return new HttpResult<PageBean<BaseTalk>>().ok(pageBean);
	}
	/**
	 * 添加留言
	 * @param baseTalk
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/ajaxAddTalk")
	public HttpResult<BaseTalk> ajaxAddTalk(BaseTalk baseTalk){
		UserInfo sessionUser = this.getSessionUser();
		if(null == sessionUser){
			return new HttpResult<BaseTalk>().error(CommonConstant.OFF_LINE_INFO); 
		}
		//添加留言
		Integer demandTalkId = demandTalkService.addTalk(sessionUser,baseTalk);
		//查询留言
		baseTalk = demandTalkService.queryTalk(sessionUser, demandTalkId);
		
		return new HttpResult<BaseTalk>().ok(baseTalk);
	}
	/**
	 * 删除留言
	 * @param busId 需求主键
	 * @param talkId 留言主键
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/ajaxDelTalk")
	public HttpResult<String> ajaxDelTalk(BaseTalk baseTalk){
		UserInfo sessionUser = this.getSessionUser();
		if(null == sessionUser){
			return new HttpResult<String>().error(CommonConstant.OFF_LINE_INFO); 
		}
		demandTalkService.delTalk(sessionUser,baseTalk);
		return new HttpResult<String>().ok("操作成功！");
	}
	
}