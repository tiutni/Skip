package com.skip.www.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.skip.www.dao.face.QnaDao;
import com.skip.www.dto.QnA;
import com.skip.www.dto.QnAFile;
import com.skip.www.service.face.QnaService;
import com.skip.www.util.Paging;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired QnaDao qnaDao;
	@Autowired private ServletContext context;
	
	@Override
	public List<QnA> list(Paging paging) {
		
		return qnaDao.selectList(paging);
	}

	@Override
	public Paging getPaging(Paging paramData) {
		
		//총 게시글 수 조회
		int totalCount = qnaDao.selectCntAll(paramData);
		
		//페이징 계산
		Paging paging = new Paging(totalCount, paramData.getCurPage());
		paging.setSearch(paramData.getSearch());

		return paging;
	}

	@Override
	public QnA view(QnA viewQna) {

		//상세보기 조회 결과 리턴
		return qnaDao.select(viewQna);
	}
	
	@Override
	public void write(QnA qna, MultipartFile file) {
		
		if( "".equals( qna.getQnaTitle() ) ) {
			qna.setQnaTitle("(제목이 없습니다)");
		}
		qnaDao.insertQna(qna);
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
		return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String qnaFileOriginName = file.getOriginalFilename();
		String qnaFileStoredName = qnaFileOriginName + UUID.randomUUID().toString().split("-")[4];
		
		//저장될 파일 정보 객체
		File dest = new File(storedFolder, qnaFileStoredName);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		QnAFile qnaFile = new QnAFile();
		qnaFile.setQnaFileNo( qna.getQnaNo() );
		//@@@@@@@@@@ 아래여야하는데 위라고썼었음/////@@@@@@@@@@@@@@@@@
		qnaFile.setQnaNo( qna.getQnaNo() );
		qnaFile.setQnaFileOriginName(qnaFileOriginName);
		qnaFile.setQnaFileStoredName(qnaFileStoredName);

		qnaDao.insertFile(qnaFile);
		
	}
}