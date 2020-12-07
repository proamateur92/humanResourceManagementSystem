package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.SearchCriteria;
import kr.co.service.InsaService;
import kr.co.vo.Criteria;
import kr.co.vo.FileVO;
import kr.co.vo.InsaVO;
import kr.co.vo.PageMaker;
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

		
		return "redirect:/inputForm";
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
	public String listForm(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("List Form");
		
		List<comVO> com = service.comList();
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("com", com);
		model.addAttribute("list", service.list(scri));
		model.addAttribute("pageMaker",pageMaker);

		return "listFormNew";
	}
	
	//직원 삭제
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public int deleteSabun(InsaVO insaVO) throws Exception {
		
		logger.info("Delete Form");
		int check = service.deleteSabun(insaVO);
	
		return check;
	}
	
	//직원 수정
	@RequestMapping(value="/updateForm", method=RequestMethod.GET)
	public String updatePage(InsaVO insaVO, Model model) throws Exception {
		
		List<comVO> list = service.comList();
		
		int sabun = insaVO.getSabun();
		InsaVO insaInfo = service.loadSabun(sabun);
		
		String jumin = insaInfo.getReg_no();
		String email = insaInfo.getEmail();
		String newJumin ="";
		String newEmail1 = "";
		String newEmail2 = "";
		
		for(int i=0; i<jumin.length(); i++) {
			if(i<8||i>12) {
				newJumin += jumin.charAt(i);
			} else {
				newJumin+='*';
			}
		}

		logger.info("jumin: "+ jumin);
		logger.info("email: "+ email);
		
		if(email.contains("@")){
			int idx = email.indexOf("@");
			newEmail1 = email.substring(0, idx);
			newEmail2 = email.substring(idx+1);
		}
		
		logger.info("newEmail1: "+ newEmail1);
		logger.info("newEmail2: "+ newEmail2);
		
		model.addAttribute("newEmail1", newEmail1);
		model.addAttribute("newEmail2", newEmail2);
		model.addAttribute("newJumin", newJumin);
		model.addAttribute("insaInfo", insaInfo);
		model.addAttribute("comList", list);
		
		return "/updateForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateForm", method=RequestMethod.POST)
	public int updateSabun(InsaVO insaVO,@RequestParam String email2) throws Exception {
		logger.info("Update Form");

		int check = 0;
		String newEmail = insaVO.getEmail()+"@"+email2;
		
		insaVO.setEmail(newEmail);
		logger.info(Integer.toString(insaVO.getSabun()));
		logger.info(insaVO.getId());
		logger.info(insaVO.getName());
		logger.info(insaVO.getPwd());
		logger.info(insaVO.getEmail());
		
		check = service.updateSabun(insaVO);
		
		return check;
	}
}
