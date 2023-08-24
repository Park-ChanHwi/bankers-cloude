package bankers.fisa.controller;

import java.net.URI;
import java.util.ArrayList;

import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class MainController {
	
	@GetMapping("/")
	public ModelAndView indexPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("/vmadd")
	public ModelAndView vmaddPage(@CookieValue("id") String id) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println(id);
		
		mv.setViewName("vmadd");
		return mv;
	}
	
	@PostMapping("/dashboard")
	public ModelAndView dashboardPage(
			@RequestParam("loginID") String id,
			@RequestParam("loginPW") String pw,
			HttpServletResponse response) {
		
		ModelAndView mv = new ModelAndView();
		
		if(!login(id, pw)) {
			mv.setViewName("fail");
			return mv;
		}
		
		Cookie cookie = new Cookie("id", id);
		cookie.setDomain("localhost");
		cookie.setPath("/");
		cookie.setMaxAge(30*60);
		cookie.setSecure(true);
		response.addCookie(cookie);
		
		return goVMDashboard(id, pw, mv);
	}

	private ModelAndView goVMDashboard(String id, String pw, ModelAndView mv) {
		
		ArrayList<String> vmname = new ArrayList<String>();
		ArrayList<String> vmaddress = new ArrayList<String>();
		ArrayList<String> vmstate = new ArrayList<String>();
		ArrayList<String> vmcatal = new ArrayList<String>();
		ArrayList<String> vmcustid = new ArrayList<String>();
			
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/controller/vmlist")
				.encode()
				.build()
				.toUri();
			
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("loginID", id);
		parameters.add("loginPW", pw);
			
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
			
		String[] vmlist = responseEntity.getBody().toString().split(",");
		for(int i = 0; i < vmlist.length; i++) {
			String[] vmInfo = vmlist[i].split("_");
			
			vmname.add(vmInfo[2]);
			vmcatal.add(vmInfo[3]);
			vmaddress.add(vmInfo[4]);
			vmstate.add(vmInfo[5]);
			vmcustid.add(getCustEmp(vmInfo[6]).split("_")[3]);
		}
		mv.addObject("vmname", vmname);
		mv.addObject("vmcatal", vmcatal);
		mv.addObject("vmaddress", vmaddress);
		mv.addObject("vmstate", vmstate);
		mv.addObject("vmcustid", vmcustid);
		
		mv.setViewName("vmdashboard");
		
		return mv;
	}
	
	private String getCustEmp(String custEmpNumber) {
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/controller/custemp")
				.encode()
				.build()
				.toUri();
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("custEmpNumber", custEmpNumber);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
		
		return responseEntity.getBody();
	}
	
	private boolean login(String id, String pw) {
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/controller/login")
				.encode()
				.build()
				.toUri();

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("loginID", id);
		parameters.add("loginPW", pw);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
		
		if(responseEntity.getBody().equals("true")) {
			return true;
		}else {
			return false;
		}
	}
}
