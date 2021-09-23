<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base target="_blank">
<style type="text/css">
	.syllabus, .syllabus_week{width:800px; border-width: 2px; border-collapse: collapse; border-color: black; border-style: solid; font-size: 12px; line-height: 24px; min-height: 24px; margin-top:10px; table-layout: fixed;}
	.syllabus_sub {width:600px; border-width: 1px; border-collapse: collapse; border-color: black; border-style: solid; font-size: 12px; line-height: 24px; min-height: 24px; margin-top:3px;margin-bottom:3px; k-layout: fixed;}
	tr{min-height: 22px; }
	th{border: 1px black solid; text-align: center; font-weight: bold; background-color: #EFEFEF}
	th.no_topLine{border-top:0px black solid;}
	th.no_botLine{border-bottom:0px black solid;}
	td{border: 1px black solid; text-align: left; padding-left: 3px; min-height: 22px; vertical-align: middle; background-color: #FFFFFF}
	td p{min-height: 22px;}
	td pre{margin:auto; min-height: 1px;}
	
	.multi-line {line-height:1.3em; padding-top:4px}		
</style>
<title>강의계획서 보기</title>

<script type="text/javascript" src="../function/common.js"></script>
<script type="text/javascript" src="../function/sortTable.js"></script>
<script>
	function goPrint(){
		
		var src = '';
		if(isCompatibleIE()){
			src = "../rdreport/r_designer_cs.jsp?repo_val1=2021&repo_val2=2&repo_val3=VA14202&repo_val4=01&repo_val5=100055&repo_path=../sbr/sbr3072.mrd";
		}else{
			src = "https://appx.kangnam.ac.kr/knumis/rdreport/r_designer_cs.jsp?repo_val1=2021&repo_val2=2&repo_val3=VA14202&repo_val4=01&repo_val5=100055&repo_path=../sbr/sbr3072.mrd";
		}

		openWin('',src,850,630,0,0);

		self.close();
	}
</script>
</head>
<body>
	<div align="center" style="margin-top: 0px;; overflow-y: scroll;">
		<table class="syllabus">
			<colgroup>
				<col width="10%">
				<col width="7%">
				<col width="10%">
				<col width="20%">
				<col width="16%">
				<col width="8%">
				<col width="21%">
			</colgroup>

			<tbody>
				<tr>
					<th colspan="5" rowspan="2"><span style="font-size: 24px;">강
							의 계 획 서</span></th>
					<th>년 도</th>
					<td>2021</td>
				</tr>
				<tr>
					<th>학 기</th>
					<td>2 학기</td>
				</tr>
				<tr>
					<th rowspan="2">교과목명</th>
					<th>한글</th>
					<td colspan="2">운영체제</td>
					<th rowspan="2">담당교수</th>
					<td rowspan="2" colspan="2">조승호</td>
				</tr>
				<tr>
					<th>영문</th>
					<td colspan="2">Operating Systems</td>
				</tr>
				<tr>
					<th colspan="2">학수번호-분반</th>
					<td colspan="2">VA14202 - 01</td>
					<th>강의요일교시</th>
					<td colspan="2">(주)수6ab7ab8ab9ab</td>
				</tr>
				<tr>
					<th colspan="2">학점(시간수)</th>
					<td colspan="2">3(4)</td>
					<th>강의실</th>
					<td colspan="2">후B102</td>
				</tr>
				<tr>
					<th rowspan="3" colspan="2">개설(이수)구분</th>
					<th>교양</th>
					<td colspan="4"><input type="checkbox" disabled="disabled">기초교양
						<input type="checkbox" disabled="disabled"
						style="margin-left: 20px">계열교양 <input type="checkbox"
						disabled="disabled" style="margin-left: 20px">일반교양 <input
						type="checkbox" disabled="disabled" style="margin-left: 20px">균형교양:
					</td>
				</tr>
				<tr>
					<th>전공</th>
					<td colspan="4"><input type="checkbox" disabled="disabled">학부기초
						<input type="checkbox" disabled="disabled"
						style="margin-left: 20px">전공기초 <input type="checkbox"
						checked="" disabled="disabled" style="margin-left: 20px">전공선택
						( 3 ) 학년 <input type="checkbox" disabled="disabled"
						style="margin-left: 20px">전공필수 ( &nbsp; ) 학년</td>

				</tr>
				<tr>
					<th>일반선택</th>
					<td colspan="2"><input type="checkbox" disabled="disabled">교직
						<input type="checkbox" disabled="disabled"
						style="margin-left: 20px">자유선택</td>
					<td colspan="2">학부(과) : 소프트웨어전공</td>
				</tr>

				<tr>
					<th rowspan="2" colspan="2">강좌특성</th>
					<td colspan="5"><input type="checkbox" disabled="disabled">이론강의
						<input type="checkbox" disabled="disabled"
						style="margin-left: 20px">실험·실습·실기 <input type="checkbox"
						checked="" disabled="disabled" style="margin-left: 20px">이론/실험·실습병행
						<input type="checkbox" disabled="disabled"
						style="margin-left: 20px">패스 <input type="checkbox"
						disabled="disabled" style="margin-left: 20px">팀티칭</td>
				</tr>
				<tr>
					<th>학문특성</th>
					<td></td>
					<th>기타특성</th>
					<td colspan="2">C러닝</td>
				</tr>
				<tr>
					<th rowspan="2" colspan="2">교수학습<br>방법
					</th>
					<th colspan="2">표준 교과목운영 기준</th>
					<th colspan="2">학생 자기주도식 수업운영</th>
					<th>현장 연계 방법</th>
				</tr>
				<tr>
					<td colspan="2" style="line-height: 1.0em"><input
						type="checkbox" disabled="disabled">강의<br> <input
						type="checkbox" disabled="disabled">발표<br> <input
						type="checkbox" disabled="disabled">토론·토의<br> <input
						type="checkbox" disabled="disabled">협력학습<br> <input
						type="checkbox" disabled="disabled">문제기반학습<br></td>
					<td colspan="2"><input type="checkbox" checked=""
						disabled="disabled">문제기반학습(PBL)<br> <input
						type="checkbox" disabled="disabled">프로젝트기반학습(PBL)<br>
						<input type="checkbox" disabled="disabled">플립러닝<br> <input
						type="checkbox" disabled="disabled">K-MOOC<br> <input
						type="checkbox" disabled="disabled">팀기반학습(TBL)<br> <input
						type="checkbox" disabled="disabled">블랜디드러닝<br> <input
						type="checkbox" disabled="disabled">캡스톤디자인<br></td>
					<td><input type="checkbox" disabled="disabled">현장전문가초청<br>
						<input type="checkbox" disabled="disabled">현장탐방<br> <input
						type="checkbox" disabled="disabled">기타<br></td>
				</tr>
				<tr>
					<th colspan="2">전공역량</th>
					<td colspan="2">D-K,D-A,O-K,I-K</td>
					<th>성적평가기준</th>
					<td colspan="2">상대평가 유형 1</td>
				</tr>

				<tr>
					<th colspan="2" rowspan="3">연락처</th>
					<th>연구실</th>
					<td></td>
					<th>E-Mail</th>
					<td colspan="2"></td>

				</tr>
				<tr>
					<th>휴대전화</th>
					<td></td>
					<th>면담가능시간</th>
					<td colspan="2"></td>

				</tr>
				<tr>
					<th>연구일</th>
					<td>금요일</td>
					<th>관리부서</th>
					<td colspan="2">교학2팀 (031-280-3441 ~ 4)</td>

				</tr>
				<tr>
					<th colspan="2" rowspan="2">교육과정<br>참고사항
					</th>
					<th>선수과목</th>
					<td></td>
					<th>관련 기초과목</th>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th class="multi-line">동시수강<br>관련과목
					</th>
					<td></td>
					<th>관련 고급과목</th>
					<td colspan="2"></td>
				</tr>

				<!-- ------------------------------------------------------------------------  -->
				<tr>
					<th colspan="2">교과목 개요</th>
					<td colspan="5"></td>
				</tr>
				<tr>
					<th rowspan="3">교과목<br>운영
					</th>
					<th>수업목표</th>
					<td colspan="5">- 운영 체제의 주요 구성 요소인 CPU 관리, 메모리 관리, 파일 관리, 입출력
						관리 등의 원리 및 알고리즘 학습을 통해 플랫폼으로서의 운영체제 기능을 분석<br> - Unix system
						call, Windows API 등의 실습을 통해 산업 현장에서 요구되는 서버측 프로그래밍 역량을 함양<br>
						- 최근 산업계 수요가 급격하게 증가하고 있는 AWS, 구글 클라우드 및 빅데이터 관련 플랫폼에 대한 이해 제고
					</td>
				</tr>
				<tr>
					<th class="multi-line">교수학습<br>세부운영<br>방법
					</th>
					<td colspan="5">- 강의는 Bean Projector를 활용하여 강의 - 강의노트들은 학습도우미의
						과목 페이지에 미리 게시 - 실험: 실험실습실에서 매주 1~2시간씩 병행 - Unix
						서버(roots.kangnam.ac.kr, nolia.kangnam.ac.kr)에 개인별 id를 발급하여 실습 수행 -
						수강생들은 항상 Unix 서버를 접근할 수 있음</td>
				</tr>
				<tr>
					<th style="border-right: none">평가방법</th>
					<td colspan="5" style="padding: 0px; border-bottom: none">
						<table
							style="width: 100%; border-collapse: collapse; border-width: 0px;">
							<tbody>
								<tr>
									<th style="border-top: none; border-left: none" width="15%">중간고사</th>
									<th style="border-top: none;" width="15%">기말고사</th>
									<th style="border-top: none" width="14%">출석</th>
									<th style="border-top: none" width="14%">과제</th>
									<th style="border-top: none" width="14%">퀴즈</th>
									<th style="border-top: none" width="14%">토론</th>
									<th style="border-top: none; border-right: none" width="14%">기타</th>
								</tr>
								<tr>
									<td style="border-left: none">30&nbsp;</td>
									<td>30</td>
									<td>5</td>
									<td>25</td>
									<td></td>
									<td></td>
									<td style="border-right: none">10</td>
								</tr>
								<tr>
									<th colspan="2" style="border-left: none; border-bottom: none">과제/퀴즈/토론/기타<br>문제
										및 주제
									</th>
									<td colspan="5" style="border-right: none; border-bottom: none">
										- 중간시험 평가(30%) - 기말시험 평가(30%) - 과제 수행 능력 평가(25%) - 실험/실습
										참여도(10%) - 출석(5%)</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>

				<!---------------교재 ---------------------- -->
				<tr>
					<th rowspan="2" colspan="2">교재</th>
					<th class="multi-line">주교재<br>(저자,출판사)
					</th>
					<td colspan="4">1)W. Stallings 저, 전 광일 외 다수 역, 운영체제, 제8판,
						프로텍미디어, 2015.</td>
				</tr>
				<tr>
					<th class="multi-line">참고도서<br>(저자,출판사)
					</th>
					<td colspan="4">1)창병모, 리눅스 시스템 프로그래밍, 생능출판사, 2014.<br>
						2)K. Haviland 외 2인, 조유근 역, UNIX 시스템 프로그래밍, 홍릉과학, 1999. <br>
						3)W. Stallings, Operating Systems, 제9판, Pearson, 2018.
					</td>
				</tr>

				<tr>
					<th colspan="2" class="multi-line">장애학생 수업<br>지원안내
					</th>
					<td colspan="5"><br></td>
				</tr>



			</tbody>
		</table>

		<table class="syllabus_week">
			<colgroup>
				<col width="6%">
				<col width="34%">
				<col width="24%">
				<col width="18%">
				<col width="18%">
			</colgroup>

			<tbody>
				<tr>
					<th colspan="5"><span style="font-size: 18px;">주차별 강의내용</span></th>
				</tr>
				<tr>
					<th>주차</th>
					<th>학습주제</th>
					<th>수업방식/이용기자재</th>
					<th>교수학습자료</th>
					<th>과제</th>
				</tr>

				<tr>
					<th>1</th>
					<td>강의 소개<br> 1장 개요<br> - 공유 경제와 플랫폼 동향 <br> -
						플랫폼 기술과 운영체제<br> - 운영체제 역사 및 종류
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td></td>
					<td>Unix 서버용 사용자 id 발급 신청</td>
				</tr>

				<tr>
					<th>2</th>
					<td>2장 운영체제 개요<br> - 운영체제의 발전<br> - 주요 성과<br> -
						사례: 윈도우즈, Android
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td>- Unix 기본 명령어 활용 실습</td>
					<td>1)directory 검색 프로그래밍 과제</td>
				</tr>

				<tr>
					<th>3</th>
					<td>3장 프로세스 기술과 제어<br> - 프로세스 개념, 상태도, 이미지 등
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td>- Unix에서 프로세스 생성 실습</td>
					<td></td>
				</tr>

				<tr>
					<th>4</th>
					<td>4장 스레드, SMP, 마이크로 커널<br> - 스레드 개념 <br> [실습] OS별
						멀티스레딩 실습
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td>- Unix에서 pthread 활용 실습</td>
					<td>2)스레드 활용 프로그래밍 과제</td>
				</tr>

				<tr>
					<th>5</th>
					<td>7장 메모리 관리<br> - 실메모리 관리<br> [실습] 메모리 할당 관련 실습
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td></td>
					<td>3)메모리 할당 정책 시뮬레이션 과제</td>
				</tr>

				<tr>
					<th>6</th>
					<td>8장 가상 메모리<br> - 가상 주소 개념<br> - 매핑, 페이징<br>
						- 세그멘테이션<br> [실습] 페이지 교체 알고리즘 시뮬레이션
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<th>7</th>
					<td>9장 단일처리기 스케쥴링<br> - CPU 스케쥴링 정책
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<th>8</th>
					<td>9장 단일처리기 스케쥴링<br> [실습]CPU 스케쥴러 시뮬레이션
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<th>9</th>
					<td>5장 병행성: 상호배제와 동기화<br> - 원리, 상호배제, 세마포<br> - 세마포을
						통한 상호배제 실습<br> - 모니터, 메시지 전달 등<br> [실습]모니터, 메시지 전달 등 병행성
						실습
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td>- 각종 IPC 실습</td>
					<td>4)병행성 제어 프로그래밍 과제</td>
				</tr>

				<tr>
					<th>10</th>
					<td>6장 교착상태 및 기아<br> - 개념<br> - 교착상태 표현<br> -
						교착상태 관련 알고리즘
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<th>11</th>
					<td>11장 입출력 관리<br> [실습]<br> - 캐릭터형,블록형 I/O<br>
						- raw 형식의 터미널 입출력 실습 <br> - 블록형 입출력 활용 실습
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td>- 터미널 I/O 실습</td>
					<td>5)terminal I/O 프로그래밍</td>
				</tr>

				<tr>
					<th>12</th>
					<td>11장 디스크 스케쥴링<br> - 디스크 구조, 성능 요소<br> - 스케쥴링 정책<br>
						[실습] 디스크 스케쥴링 정책 시뮬레이션
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td></td>
					<td></td>
				</tr>

				<tr>
					<th>13</th>
					<td>12장 파일 관리<br> - 화일, 디렉토리 구조<br> - 각종 화일 시스템<br>
						- 미니 파일 시스템 활용
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td>- 파일/디렉토리 정보 검색 실습</td>
					<td>6)mini 파일 시스템 구현 과제</td>
				</tr>

				<tr>
					<th>14</th>
					<td>14장 가상 기계<br> - 가상화 방식<br> - Java, Android,
						Linux 가상 기계
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/UNIX Server
					</td>
					<td>- 파일 시스템 관련 실습</td>
					<td></td>
				</tr>

				<tr>
					<th>15</th>
					<td>16장 분산 처리 및 클러스터<br> - 클라우드 모델, 클러스터<br> - 클라우드
						사례: 구글, 아마존 등<br> - 빅데이터 플랫폼 하둡, HDFS 등
					</td>
					<td>강의/실습<br> Beam Projector/<br> PC/ubuntu 클러스터
					</td>
					<td>- 빅데이터 관련 실습(R)<br> - 클러스터: kws0~7.kangnam.ac.kr
					</td>
					<td></td>
				</tr>

			</tbody>
		</table>




		<div style="margin-top: 10px; text-align: left">
			<div style="font-weight: bolder;">ㅁ전공역량</div>
			<div style="font-size: 12px">○ 과목명 : 운영체제</div>
			<div style="font-size: 12px">○ 전공역량 : D-K,D-A,O-K,I-K</div>
			<div style="text-align: center">
				<table id="capaTable" class="syllabus" style="line-height: 1.4em;">
					<colgroup>
						<col width="14%">
						<col width="5%">
						<col width="23%">
						<col width="5%">
						<col width="33%">
						<col width="5%">
						<col width="5%">
					</colgroup>
					<tbody>
						<tr>
							<th>전공역량</th>
							<th>전공<br>역량<br>코드
							</th>
							<th>내용</th>
							<th>KSA</th>
							<th>설명</th>
							<th>코드</th>
							<th>역량<br>여부
							</th>
						</tr>

					</tbody>
				</table>
			</div>
			<script type="text/javascript">
				mergeCells('capaTable', 2);
				mergeCells('capaTable', 1);
				mergeCells('capaTable', 0);
			</script>
		</div>
		<div
			style="font-weight: bolder; text-align: left; font-size: 12px; margin: 5px 0px 0px 5px">※
			KSA - 지식, 기술, 태도임</div>

	</div>
</body>
</html>