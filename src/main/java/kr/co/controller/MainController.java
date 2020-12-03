package kr.co.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		return "inputForm4";
	}

	@RequestMapping(value = "/inputForm", method = RequestMethod.POST)
	public String insaInput(@RequestParam String email2,InsaVO insaVO, Model model) throws Exception {
		String email = insaVO.getEmail();
		email += "@" + email2;

		insaVO.setEmail(email);
		int check = service.insert(insaVO);
		int nowSabun = service.sabunCheck()-1;
		
		if(check == 1) {
			if(!insaVO.getProfile_image().equals("")) {
				service.updateFile(nowSabun, insaVO.getProfile_image());
			}
			if(!insaVO.getCarrier().equals("")) {
				service.updateFile(nowSabun, insaVO.getCarrier());
			}
			if(!insaVO.getCmp_reg_image().equals("")) {
				service.updateFile(nowSabun, insaVO.getCmp_reg_image());
			}
		}
		logger.info("현재사번~~~~~~~~~~"+ Integer.toString(nowSabun));
		logger.info(check < 1 ? "N" : "Y");

//		model.addAttribute();
		
		return "redirect:/";
	}

	//파일 업로드
	@ResponseBody
	@RequestMapping(value="/fileupload", method=RequestMethod.POST)
	public FileVO fileUpload(MultipartHttpServletRequest request) throws Exception {
		MultipartFile file = request.getFile("file");
		String type = request.getParameter("type");
		
		FileVO fileVo = service.uploadFile(file, type);
		
		if(fileVo != null) {
			logger.info("성공!");
			return fileVo;
		} else {
			logger.info("실패 ㅠ");
			return null;
		}
	}
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value="/checkId", method=RequestMethod.GET)
	public int idCheck(@RequestParam String id) throws Exception{
		int check = 0;
		
		check = service.idChecking(id);
		return check;
	}
	
	//직원 목록
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) throws Exception {

		List<comVO> com = service.comList();
		List<InsaVO> list = service.list();

		model.addAttribute("com", com);
		model.addAttribute("list", list);

		return "listForm2";
	}
	
	//직원 삭제
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public int deleteSabun(InsaVO insaVO) throws Exception {
		
		logger.info(Integer.toString(insaVO.getSabun()));
		int check = service.deleteSabun(insaVO);
	
		return check;
	}
	
	//직원 수정
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String updatePage() throws Exception {
		
		return "updateForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public int updateSabun(InsaVO insaVO) throws Exception {
		
		int check = 0;
		
		return check;
	}
}
