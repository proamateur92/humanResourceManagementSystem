package kr.co.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.dao.InsaDAO;
import kr.co.vo.FileVO;
import kr.co.vo.InsaVO;
import kr.co.vo.SearchCriteria;
import kr.co.vo.comVO;


@Service
public class InsaServiceImpl implements InsaService{

	@Inject
	private InsaDAO dao;

	@Override
	public int insert(InsaVO insaVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.insert(insaVO);
	}

	@Override
	public List<InsaVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	
	@Override
	public List<comVO> comList() throws Exception {
		// TODO Auto-generated method stub
		return dao.comList();
	}
	
	@Override
	public FileVO uploadFile(MultipartFile file, String fileType) throws Exception {
		
		String saveDir = "C:\\Users\\PINOSOFT\\Desktop\\photo\\";
		String orgName = file.getOriginalFilename();
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		String filePath = saveDir + "\\" + saveName;
		long fileSize = file.getSize();
		FileVO fileVo = new FileVO();
		fileVo.setFileType(fileType);
		fileVo.setFilePath(filePath);
		fileVo.setOrgName(orgName);
		fileVo.setSaveName(saveName);
		fileVo.setFileSize(fileSize);
		
		try {
			byte[] fileData = file.getBytes();
			OutputStream out = new FileOutputStream(saveDir + "/" + saveName);
			BufferedOutputStream bout = new BufferedOutputStream(out);

			bout.write(fileData);

			if (bout != null) {
				bout.close();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int result = dao.insertFileByFileVo(fileVo);
		if (result == 1){
			return fileVo;
		}
		else {
			System.out.println("파일 업로드 실패");
			return null;
		}
	}

	@Override
	public int updateFile(int sabun, String saveName) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateFile(sabun, saveName);
	}

	@Override
	public int sabunCheck() throws Exception {
		// TODO Auto-generated method stub
		return dao.sabunCheck();
	}

	@Override
	public int idChecking(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idChecking(id);
	}

	@Override
	public int deleteSabun(InsaVO insaVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.deleteSabun(insaVO);
	}

	@Override
	public InsaVO loadSabun(int sabun) throws Exception {
		// TODO Auto-generated method stub
		return dao.loadSabun(sabun);
	}

	@Override
	public int updateSabun(InsaVO insaVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateSabun(insaVO);
	}

}
