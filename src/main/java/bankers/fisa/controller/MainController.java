package bankers.fisa.controller;

import java.net.URI;

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
		
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/controller/login")
				.encode()
				.build()
				.toUri();

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("loginID", loginID);
		parameters.add("loginPW", loginPW);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
		
		if(responseEntity.getBody().equals("true")) {
			mv.setViewName("vmdashboard");
		}else if(responseEntity.getBody().equals("false")){
			mv.setViewName("fail");
		}
		
		return mv;
	}
}
