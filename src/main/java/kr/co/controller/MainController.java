package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.InsaService;
import kr.co.vo.InsaVO;
import kr.co.vo.comVO;

@Controller	
public class MainController {
	
	@Inject
	private InsaService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		logger.info("welcome index");
		
		return "index2";
	}
	
	@RequestMapping(value = "/inputForm", method = RequestMethod.GET)
	public String insaInputForm(Model model) throws Exception {
		List<comVO> list = service.comList();
		
		model.addAttribute("comList", list);
		return "inputForm";
	}
	
	@RequestMapping(value = "/inputForm", method = RequestMethod.POST)
	public String insaInput(InsaVO insaVO) throws Exception {
		
		int check = service.insert(insaVO);
		
		logger.info(check < 1 ? "N":"Y");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) throws Exception {
		
		List<InsaVO> list = service.list();
		model.addAttribute("list", list);
		
		return "listForm";
	}
}
