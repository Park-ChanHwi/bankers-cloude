package bankers.fisa.controller;

import java.net.URI;
import java.util.ArrayList;

import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import jakarta.servlet.http.HttpSession;

@RestController
public class MainController {
	@GetMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	
	
	@PostMapping("/login")
	public ModelAndView login(
			@RequestParam("loginID") String loginID,
			@RequestParam("loginPW") String loginPW) {
		ModelAndView mv = new ModelAndView();
		
		URI loginUri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/controller/login")
				.encode()
				.build()
				.toUri();

		MultiValueMap<String, String> loginParameters = new LinkedMultiValueMap<>();
		loginParameters.add("loginID", loginID);
		loginParameters.add("loginPW", loginPW);
		
		RestTemplate loginRestTemplate = new RestTemplate();
		ResponseEntity<String> loginResponseEntity = loginRestTemplate.postForEntity(loginUri, loginParameters, String.class);
		
		if(loginResponseEntity.getBody().equals("true")) {
			mv.setViewName("vmdashboard");
			
			ArrayList<String> vmname = new ArrayList<String>();
			ArrayList<String> vmaddress = new ArrayList<String>();
			
			URI vmUri = UriComponentsBuilder.fromUriString("http://localhost:7070")
					.path("/controller/vmlist")
					.encode()
					.build()
					.toUri();
			
			MultiValueMap<String, String> vmParameters = new LinkedMultiValueMap<>();
			vmParameters.add("loginID", loginID);
			vmParameters.add("loginPW", loginPW);
			
			RestTemplate vmRestTemplate = new RestTemplate();
			ResponseEntity<String> responseEntity = vmRestTemplate.postForEntity(vmUri, vmParameters, String.class);
			
			String[] strArr2 = responseEntity.getBody().toString().split(",");
			for(String str : strArr2) {
				String[] strArr3 = str.split("_");
				vmname.add(strArr3[2]);
				vmaddress.add(strArr3[4]);
			}
			
			mv.addObject("vmname", vmname);
			mv.addObject("vmaddress", vmaddress);
		}else if(loginResponseEntity.getBody().equals("false")){
			mv.setViewName("fail");
		}
		
		return mv;
	}
}
