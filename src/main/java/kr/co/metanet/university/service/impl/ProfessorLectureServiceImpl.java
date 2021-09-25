package kr.co.metanet.university.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.mapper.ProfessorLectureMapper;
import kr.co.metanet.university.service.ProfessorLectureService;


@Service("kr.co.metanet.university.service.impl.ProfessorLectureServiceImpl")
public class ProfessorLectureServiceImpl implements ProfessorLectureService{
	
	@Autowired
	private ProfessorLectureMapper mapper;

	@Override
	public List<LectureVO> getAllLecture(int professor_id) {
		return mapper.getAllLecture(professor_id);
	}

	@Override
	public List<LectureVO> getNowAllLecture(Map map) {
		return mapper.getNowAllLecture(map);
	}

	@Override
	public LectureVO getLecture(int id) {
		return mapper.getLecture(id);
	}

	@Override
	public int create(LectureVO vo) {
		return mapper.create(vo);
	}

	@Override
	public int update(LectureVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(int id) {
		return mapper.delete(id);
	}

	
}
