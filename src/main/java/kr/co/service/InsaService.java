package kr.co.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.vo.FileVO;
import kr.co.vo.InsaVO;
import kr.co.vo.comVO;

public interface InsaService {
	public int insert(InsaVO insaVO) throws Exception;
	
	public List<InsaVO> list() throws Exception;
	
	public List<comVO> comList() throws Exception;
	
	public FileVO uploadFile(MultipartFile file, String fileType) throws Exception;
	}
