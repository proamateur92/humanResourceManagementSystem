package kr.co.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.service.InsaService;
import kr.co.vo.FileVO;
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

		logger.info(check < 1 ? "N" : "Y");

		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value="/fileupload", method=RequestMethod.POST)
	public FileVO fileUpload(MultipartHttpServletRequest request) throws Exception {
		MultipartFile file = request.getFile("file");
		String type = request.getParameter("type");
		
		FileVO fileVO = service.uploadFile(file, type);
		logger.info("1111111111111111");
		if(fileVO != null) {
			logger.info("22222222222222222222222222");
			return fileVO;
		} else {
			logger.info("333333333333333333333333333");
			return null;
		}
	}
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) throws Exception {

		List<comVO> com = service.comList();
		List<InsaVO> list = service.list();

		model.addAttribute("com", com);
		model.addAttribute("list", list);

		return "listForm2";
	}
}
