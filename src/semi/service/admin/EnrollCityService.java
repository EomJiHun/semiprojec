package semi.service.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import semi.model.dao.AdminLogDAO;
import semi.model.dao.CountryDAO;
import semi.model.dto.AdminLogDTO;
import semi.model.dto.CountryDTO;
import semi.service.Service;

public class EnrollCityService implements Service {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 디렉토리생성 경로
		String dftFilePath = req.getServletContext().getRealPath("/");
		System.out.println("dftFilePath : " + dftFilePath);
		// 파일 기본경로 _ 상세경로
		String saveDirectory = dftFilePath + "city_image" + File.separator;
		System.out.println("saveDirectory : " + saveDirectory);
		File file = new File(saveDirectory);
		String[] list = file.list(); // 중복확인을 위해서 폴더에있는 모든 파일의 리스트를 가지고 온다.

		// 파일 이름을 저장할 리스트 객체 생성
		List<String> NameList = new ArrayList<String>(); // 파일이름 저장
		List<String> paramList = new ArrayList<String>(); // 파라미터 값 저장

		// 디렉토리가 없으면 만들어라
		if (!file.isDirectory()) {
			file.mkdir();
			System.out.println("Make Directory");
		}

		// factory 객체 생성
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// factory 에 폴더 지정 (여기까지는 설정단계이다 다양한 설정이 있지만 필요없으니 패스)
		factory.setRepository(file);

		// 구현단계
		ServletFileUpload upload = new ServletFileUpload(factory);

		// 최대 파일 크기(10M)
		upload.setSizeMax(10 * 1024 * 1024);

		// 실제 업로드 부분(이부분에서 파일이 생성된다.)
		try {
			// request로 부터 파일 목록을 받아온다.
			List<FileItem> items = upload.parseRequest(req);
			Iterator iter = items.iterator(); // 목록을 뽑아내기위해 Iterator객체로 변환
			while (iter.hasNext()) {
				// getName을 통해 파일 이름으르 가져온다.
				FileItem fileitem = (FileItem) iter.next();
				if (!fileitem.isFormField()) {
					String fileName = fileitem.getName();
					NameList.add(fileName);
					System.out.println(fileName); // 확인을 위한 출력

					// common-fileupload의 경우 중복된 파일을 저장할 경우 에러가 발생해서 중복확인을 통해 에러를 제거해준다.
					//////////////////
					boolean confirm = false; // 중복확인을 위한 변수
					for (int i = 0; i < list.length; i++) {
						if (fileName.equals(list[i])) {
							System.out.println("이미 존재하는 파일입니다.");
							NameList.remove(fileName);
							confirm = true;
						}
					}
					if (confirm)
						continue;
					/////////////////
					// 파일에 실제로 쓰는 부분
					File uploadedFile = new File(saveDirectory, fileName);
					fileitem.write(uploadedFile);
				} else {
					System.out.println("param : " + fileitem.getString("UTF-8"));
					paramList.add(fileitem.getString("UTF-8"));
				}
			}
		} catch (FileUploadException e) {
			System.out.println("EnrollCityService에러: " + e.getMessage());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("EnrollCityService에러 : " + e.getMessage());
		}
		String totalName = "";
		for (String name : NameList) {
			totalName += name;
		}
		System.out.println("imagePath : " + totalName);

		CountryDTO dto = new CountryDTO();
		dto.setContinent(paramList.get(0)); // 대륙
		dto.setCountry(paramList.get(1)); // 나라
		dto.setCity(paramList.get(2)); // 도시
		dto.setLat(Double.parseDouble(paramList.get(3))); // 위도
		dto.setLon(Double.parseDouble(paramList.get(4))); // 경도
		dto.setContent(paramList.get(5));
		dto.setWeather(paramList.get(6)); // 날씨
		dto.setTime(paramList.get(7)); // 시간대
		dto.setMoney(paramList.get(8)); // 통화
		dto.setMonth(paramList.get(9)); // 방문하기 좋은 때
		dto.setImagepath(totalName); // 이미지 패스

		CountryDAO dao = CountryDAO.getInstance();

		
		// 도시정보를 등록했다는 로그를 등록해준다.
		AdminLogDAO logDao = AdminLogDAO.getInstance();
		AdminLogDTO logDto = new AdminLogDTO();
		HttpSession session = req.getSession();

		logDto.setId((String) session.getAttribute("admin"));
		logDto.setContent("[등록] 도시 정보 : " + dto.getCity());
		logDto.setName((String) session.getAttribute("adminName"));
		logDto.setIp(req.getRemoteAddr());

		try {
			dao.insertCity(dto, logDto);
			logDao.insertLog(logDto);
		} catch (SQLException e) {
			System.out.println("EnrollCityService DAO에러 : " + e.getMessage());
		}
	}

}
