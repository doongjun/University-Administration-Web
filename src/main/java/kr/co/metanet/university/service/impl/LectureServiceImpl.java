package kr.co.metanet.university.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.metanet.university.domain.Criteria;
import kr.co.metanet.university.domain.LectureVO;
import kr.co.metanet.university.domain.StudentLectureVO;
import kr.co.metanet.university.mapper.LectureMapper;
import kr.co.metanet.university.service.LectureService;


@Service("kr.co.metanet.university.service.impl.LectureServiceImpl")
public class LectureServiceImpl implements LectureService{
	
	@Autowired
	private LectureMapper mapper;
	
	@Override
	public List<LectureVO> getAllLecture(Criteria cri) {
		return mapper.getAllLecture(cri);
	}
	
	@Override
	public List<LectureVO> getSearchLecture(Criteria cri) {
		return mapper.getSearchLecture(cri);
	}
	
	@Override
	public String getMaxCode() {
		return mapper.getMaxCode();
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

	@Override
	public List<StudentLectureVO> getScoreList(int student_id, String lecture_year, String semester) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("student_id", student_id);
		map.put("lecture_year", lecture_year);
		map.put("semester", semester);
		return mapper.getScoreList(map);
	}

	@Override
	public List<LectureVO> getPrevLectureList(String semester, String this_year, String last_year, int student_id) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("semester", semester);
		map.put("this_year", this_year);
		map.put("last_year", last_year);
		map.put("student_id", student_id);
		return mapper.getPrevLectureList(map);
	}

	@Override
	public List<LectureVO> getSelectedPrevLectureList(String semester, String lecture_year,
			int student_id) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("semester", semester);
		map.put("lecture_year", lecture_year);
		map.put("student_id", student_id);
		return mapper.getSelectedPrevLectureList(map);
	}



}
