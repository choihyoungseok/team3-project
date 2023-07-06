package popup.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import popup.service.LoginAPIService;

@RestController
@RequiredArgsConstructor
public class LoginAPIController {
	
	@Autowired
	final LoginAPIService loginService;
	
	@RequestMapping(value = "/api/member/{memberId}", method = RequestMethod.GET)
	public boolean loginId(@PathVariable String memberId) throws Exception {
	
		boolean result =  loginService.getAPIMemberById(memberId);

		return result;
	}
	
	//이메일 정규표현식
	// 양식에 맞는지
	// 인풋 타입 텍스트 대신 이메일
	// HTML 5 지원
	//
	
	@RequestMapping(value = "/api/email/{memberEmail}", method = RequestMethod.GET)
	public boolean loginEmail(@PathVariable String memberEmail) throws Exception {
	
		boolean result =  loginService.getAPIMemberByEmail(memberEmail);

		return result;
	}	
	
	
	@RequestMapping(value = "/api/nickname/{memberNickname}", method = RequestMethod.GET)
	public boolean loginNickname(@PathVariable String memberNickname) throws Exception {
	
		boolean result =  loginService.getAPIMemberByNickname(memberNickname);

		return result;
	}
	
	
	@RequestMapping(value = "/api/companyName/{memberCompanyName}", method = RequestMethod.GET)
	public boolean loginCompanyName(@PathVariable String memberCompanyName) throws Exception {
	
		boolean result =  loginService.getMemberByCompanyName(memberCompanyName);

		return result;
	}	
	
	@RequestMapping(value = "/api/companyNum/{memberCompanyNum}", method = RequestMethod.GET)
	public boolean loginCompanyNum(@PathVariable int memberCompanyNum) throws Exception {
	
		boolean result =  loginService.getMemberByCompanyNum(memberCompanyNum);

		return result;
	}	
	
	
	
	
	@ExceptionHandler(value = {Exception.class})
	public ResponseEntity<String> handleException(Exception e){
		return new ResponseEntity<String>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
