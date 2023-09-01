package bankers.fisa.controller;

import java.net.URI;
import java.util.ArrayList;

import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class MainController {
	
	private static final int COOKIE_TIME = 3600;
	
	@GetMapping("/")
	public ModelAndView indexPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("/vmmonitoring")
	public ModelAndView vmmonitoring(
			HttpServletResponse response,
			HttpServletRequest request) {
		
		String id = cookieCheck(response, request);
		if(id.equals("false")) {
			return new ModelAndView("index");
		}
		
		ModelAndView mv = new ModelAndView("vmmonitoring");
		
		ArrayList<String> vmnumber = new ArrayList<String>();
		ArrayList<String> vmname = new ArrayList<String>();
		ArrayList<String> vmcpu = new ArrayList<String>();
		ArrayList<String> vmram = new ArrayList<String>();
		ArrayList<String> vmstorage = new ArrayList<String>();
		
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/center/vmmonitoringlist")
				.encode()
				.build()
				.toUri();
			
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("id", id);
			
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
		if(responseEntity.getBody() == null) {
			return mv;
		}
		
		String[] vmlist = responseEntity.getBody().toString().split(",");
		for(int i = 0; i < vmlist.length; i++) {
			
			String[] vmInfo = vmlist[i].split("_");
			if(vmInfo.length == 2) {
				vmnumber.add("PREPARING");
				vmname.add(vmInfo[0]);
				vmcpu.add("PREPARING");
				vmram.add("PREPARING");
				vmstorage.add("PREPARING");
			}else if(vmInfo.length == 3) {
				vmnumber.add("TOOL OFF");
				vmname.add(vmInfo[0]);
				vmcpu.add("TOOL OFF");
				vmram.add("TOOL OFF");
				vmstorage.add("TOOL OFF");
			}else if(vmInfo.length == 4) {
				vmnumber.add("POWER OFF");
				vmname.add(vmInfo[0]);
				vmcpu.add("POWER OFF");
				vmram.add("POWER OFF");
				vmstorage.add("POWER OFF");
			}else {
				vmname.add(vmInfo[0]);
				vmnumber.add(vmInfo[1]);
				vmcpu.add(Integer.parseInt(vmInfo[2].substring(2, 4)) + "." + vmInfo[2].substring(4, 5) + "%");
				
				float totalram = Float.parseFloat(vmInfo[3]);
				float useram = totalram - Float.parseFloat(vmInfo[4]);
				float ramload = Math.round(useram / totalram * 1000);
				
				float ramh = Math.round((totalram / 1024) * 100);
				
				vmram.add((ramload / 10) + "%@" + (ramh / 100) + "GB");
				
				float totalstorage = Float.parseFloat(vmInfo[5]);
				float usestorage = totalstorage - Float.parseFloat(vmInfo[6]);
				float storageload = Math.round(usestorage / totalstorage * 1000);
				
				float storageh = Math.round((totalstorage / 1024) * 100);
				
				vmstorage.add((storageload / 10) + "%@" + (storageh / 100) + "GB");
			}
		}
		
		mv.addObject("vmnumber", vmnumber);
		mv.addObject("vmname", vmname);
		mv.addObject("vmcpu", vmcpu);
		mv.addObject("vmram", vmram);
		mv.addObject("vmstorage", vmstorage);
		
		return mv;
	}
	
	@GetMapping("/vmupdate")
	public ModelAndView vmupdate(
			HttpServletResponse response,
			HttpServletRequest request) {
		
		String id = cookieCheck(response, request);
		if(id.equals("false")) {
			return new ModelAndView("index");
		}
		
		ModelAndView mv = new ModelAndView();
		
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/center/vmupdate")
				.encode()
				.build()
				.toUri();

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("vmnumber", request.getParameter("vmnumber"));
		parameters.add("vmname", request.getParameter("vmname"));
		parameters.add("catalType", request.getParameter("catalType"));
		parameters.add("state", request.getParameter("state"));
		
		parameters.add("cpu1", request.getParameter("cpu1"));
		parameters.add("cpu2", request.getParameter("cpu2"));
		parameters.add("ram1", request.getParameter("ram1"));
		parameters.add("ram2", request.getParameter("ram2"));
		parameters.add("storage1", request.getParameter("storage1"));
		parameters.add("storage2", request.getParameter("storage2"));
		
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForEntity(uri, parameters, String.class);
		
		mv.setViewName("redirect:/dashboard");
		return mv;
	}

	@GetMapping("/vmdelete/{vmid}")
	public ModelAndView vmdelete(
			@PathVariable String vmid,
			HttpServletResponse response,
			HttpServletRequest request) {
		
		String id = cookieCheck(response, request);
		if(id.equals("false")) {
			return new ModelAndView("index");
		}
		
		ModelAndView mv = new ModelAndView();
		
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/center/vmdelete")
				.encode()
				.build()
				.toUri();

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("vmnumber", vmid);
		
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForEntity(uri, parameters, String.class);
		
		mv.setViewName("redirect:/dashboard");
		return mv;
	}
	
	@GetMapping("/vmmanagement/vmnumber={vmnumber}")
	public ModelAndView vmmanagement(
			@PathVariable String vmnumber,
			HttpServletResponse response,
			HttpServletRequest request) {
		String id = cookieCheck(response, request);
		if(id.equals("false")) {
			return new ModelAndView("index");
		}
		
		ModelAndView mv = new ModelAndView("vmmanagement");
		
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/center/getvm")
				.encode()
				.build()
				.toUri();

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("vmnumber", vmnumber);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
		
		String[] vminfo = responseEntity.getBody().toString().split("_");
		mv.addObject("vmid", vminfo[0]);
		mv.addObject("vmdate", vminfo[1]);
		mv.addObject("vmname", vminfo[2]);
		mv.addObject("vmcataltype", vminfo[3]);
		mv.addObject("vmaddress", vminfo[4]);
		mv.addObject("vmstate", vminfo[5]);
		mv.addObject("vmmail", getCustEmp(vminfo[6]).split("_")[2]);
		
		String[] vmAlarmInfo = getVMAlarm(vmnumber).split("_");
		mv.addObject("cpu1", vmAlarmInfo[2]);
		mv.addObject("cpu2", vmAlarmInfo[3]);
		mv.addObject("ram1", vmAlarmInfo[4]);
		mv.addObject("ram2", vmAlarmInfo[5]);
		mv.addObject("storage1", vmAlarmInfo[6]);
		mv.addObject("storage2", vmAlarmInfo[7]);
		return mv;
	}
	
	@GetMapping("/vmadd")
	public ModelAndView vmaddPage(
			HttpServletResponse response,
			HttpServletRequest request) {
		
		String id = cookieCheck(response, request);
		if(id.equals("false")) {
			return new ModelAndView("index");
		}
		return new ModelAndView("vmadd");
	}

	@PostMapping("/vmcreate")
	public ModelAndView vmcreatePage(
			@RequestParam("vmname") String vmname,
			@RequestParam("catalType") String catalType,
			@CookieValue("id") String id) {
		ModelAndView mv = new ModelAndView();
		
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/center/vmcreate")
				.encode()
				.build()
				.toUri();

		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("vmname", vmname);
		parameters.add("catalType", catalType);
		parameters.add("creater", id);
		
		RestTemplate restTemplate = new RestTemplate();
		restTemplate.postForEntity(uri, parameters, String.class);
		
		mv.setViewName("redirect:/dashboard");
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView loginPage(
			@RequestParam("loginID") String id,
			@RequestParam("loginPW") String pw,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		if(!login(id, pw)) {
			mv.setViewName("fail");
			return mv;
		}
		
//		URI uri_pos = UriComponentsBuilder.fromUriString("http://localhost:7070")
//				.path("/center/custpos")
//				.encode()
//				.build()
//				.toUri();
//		
//		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
//		parameters.add("custId", id);
//		
//		RestTemplate restTemplatePos = new RestTemplate();
//		ResponseEntity<String> responseEntityPos = restTemplatePos.postForEntity(uri_pos, parameters, String.class);
//		String pos = responseEntityPos.getBody();
//		System.out.println(pos);
		
		Cookie idCookie = new Cookie("id", id);
		idCookie.setDomain("localhost");
		idCookie.setPath("/");
		idCookie.setMaxAge(COOKIE_TIME);
		idCookie.setSecure(true);
		response.addCookie(idCookie);
		
//		Cookie posCookie = new Cookie("pos", pos);
//		posCookie.setDomain("localhost");
//		posCookie.setPath("/");
//		posCookie.setMaxAge(COOKIE_TIME);
//		posCookie.setSecure(true);
//		response.addCookie(posCookie);
		
		mv.setViewName("redirect:/dashboard");
		
		return mv;
	}
	
	@GetMapping("/dashboard")
	public ModelAndView dashboardPage(
			HttpServletResponse response,
			HttpServletRequest request) {
		
		String id = cookieCheck(response, request);
		if(id.equals("false")) {
			return new ModelAndView("index");
		}
		
		return goVMDashboard(id, new ModelAndView());
	}

	private String cookieCheck(
			HttpServletResponse response,
			HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("id")) {
				cookie.setPath("/");
				cookie.setMaxAge(COOKIE_TIME);
				response.addCookie(cookie);
				return cookie.getValue();
			}
		}
		return "false";
	}
	
	private ModelAndView goVMDashboard(String id, ModelAndView mv) {
		
		mv.setViewName("vmdashboard");
		ArrayList<String> vmnumber = new ArrayList<String>();
		ArrayList<String> vmcreatedate = new ArrayList<String>();
		ArrayList<String> vmname = new ArrayList<String>();
		ArrayList<String> vmaddress = new ArrayList<String>();
		ArrayList<String> vmstate = new ArrayList<String>();
		ArrayList<String> vmcatal = new ArrayList<String>();
		ArrayList<String> vmcustid = new ArrayList<String>();
			
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/center/vmlist")
				.encode()
				.build()
				.toUri();
			
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("id", id);
			
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
		if(responseEntity.getBody() == null) {
			return mv;
		}
		
		String[] vmlist = responseEntity.getBody().toString().split(",");
		for(int i = 0; i < vmlist.length; i++) {
			String[] vmInfo = vmlist[i].split("_");
			vmnumber.add(vmInfo[0]);
			vmcreatedate.add(vmInfo[1]);
			vmname.add(vmInfo[2]);
			vmcatal.add(vmInfo[3]);
			vmaddress.add(vmInfo[4]);
			vmstate.add(vmInfo[5]);
			vmcustid.add(getCustEmp(vmInfo[6]).split("_")[3]);	
		}
		
		mv.addObject("vmnumber", vmnumber);
		mv.addObject("vmcreatedate", vmcreatedate);
		mv.addObject("vmname", vmname);
		mv.addObject("vmcatal", vmcatal);
		mv.addObject("vmaddress", vmaddress);
		mv.addObject("vmstate", vmstate);
		mv.addObject("vmcustid", vmcustid);
		
		return mv;
	}
	
	private String getVMAlarm(String vmnumber) {
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/center/getvmalarm")
				.encode()
				.build()
				.toUri();
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		parameters.add("vmnumber", vmnumber);
		
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> responseEntity = restTemplate.postForEntity(uri, parameters, String.class);
		
		return responseEntity.getBody();
	}
	
	private String getCustEmp(String custEmpNumber) {
		URI uri = UriComponentsBuilder.fromUriString("http://localhost:7070")
				.path("/center/custemp")
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
				.path("/center/login")
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
