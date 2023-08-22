package bankers.fisa.controller;

import java.net.URI;
import java.util.ArrayList;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

@RestController
@RequestMapping("/cloud-test")
public class TestController {

	@RequestMapping("/customer")
	public ModelAndView test2() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("length", "3");
		
		ArrayList<String> strArr = new ArrayList<String>();
		
		strArr.add("VM-1");
		strArr.add("VM-21");
		strArr.add("VM-3");
		
		mv.addObject("vmname", strArr);
		
		mv.setViewName("NewFile");
		return mv;
		/*
		 * URI uri = UriComponentsBuilder .fromUriString("http://localhost:7070")
		 * .path("/center-test/test") .encode() .build() .toUri();
		 * 
		 * RestTemplate restTemplate = new RestTemplate(); ResponseEntity<String>
		 * responseEntity = restTemplate.getForEntity(uri, String.class); return
		 * responseEntity.getBody();
		 */
	}

	@GetMapping("/session-test")
	public String test() {
		URI uri = UriComponentsBuilder.fromUriString("https://192.168.0.19").path("/api/session").encode().build()
				.toUri();

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		// parameters.add("test-session", "test");

		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
		System.out.println(responseEntity);
		return responseEntity.getBody();
	}

}
