package com.techwave.busbookingclient.Controllers;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import com.techwave.busbookingclient.Models.Pojo.TicketHistory;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techwave.busbookingclient.Models.Pojo.BusInfo;
import com.techwave.busbookingclient.Models.Pojo.CheckTicket;
import com.techwave.busbookingclient.Models.Pojo.Customer;
import com.techwave.busbookingclient.Models.Pojo.Login;
import com.techwave.busbookingclient.Models.Pojo.Passenger;
import com.techwave.busbookingclient.Models.Pojo.PassengerForm;
import com.techwave.busbookingclient.Models.Pojo.PassengerEmbeddable;
import com.techwave.busbookingclient.Models.Pojo.RouteInfo;
import com.techwave.busbookingclient.Models.Pojo.ScheduleInfo;
import com.techwave.busbookingclient.Models.Pojo.SearchBuses;
import com.techwave.busbookingclient.restConnect.restUrls;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@SessionAttributes({ "customerId", "sId", "noti","ticketId"})
public class ClientController {
	@Autowired
	RestTemplate restTemplate;
	
	@RequestMapping("/main")
	public String mainpage() {		
		return "main";
	}

	@RequestMapping("/customerRegistration")
	public String customerRegistration(Model M) {
		M.addAttribute("c", new Customer());
		return "customerRegistration";
	}

	@RequestMapping("/customer")
	public String CustomerRegistration(@Valid @ModelAttribute("c") Customer C, BindingResult result, Model M) {
		System.out.println(C);
		ResponseEntity<String> str = null;
		System.out.println(result.hasErrors());
		if (!result.hasErrors()) {
			LocalDate currentDate = LocalDate.now();
			String currentYear = DateTimeFormatter.ofPattern("yyyy").format(currentDate);
			String currentMonth = DateTimeFormatter.ofPattern("MM").format(currentDate);
			int randomNum = new Random().nextInt(10000);
			String customerId = String.format("C%s%s%04d", currentYear, currentMonth, randomNum);
			C.setCustomerId(customerId);
			System.out.println(C);
			str = (ResponseEntity<String>) restTemplate.postForEntity(restUrls.INSERT_CUSTOMER, C, String.class);
			M.addAttribute("str", str.getBody());
			M.addAttribute("l", new Login());
			return "successfulRegistration";
		} else {
			return "customerRegistration";
		}
	}

	@RequestMapping("/loginn")
	public String Login(Model M) {
		M.addAttribute("l", new Login());
		return "Login";
	}

	@RequestMapping("/loginAdmin")
	public String LoginRegister(@ModelAttribute("l") Login L, Model M) {
		ResponseEntity<Login> l;
		try {
			l = restTemplate.getForEntity(restUrls.CHECK_ADMIN_EXISTS, Login.class, Map.of("userId", L.getUserId()));
			if (l.getBody().getType().equals("Admin")&&l.getBody().getPassword().equals(L.getPassword())) {
				return "Home";
			} else if (l.getBody().getType().equals("Customer") && l.getBody().getPassword().equals(L.getPassword())) {
				M.addAttribute("customerId", L.getUserId());
				return "CustomerOptions";
			}
			else
			{
				M.addAttribute("str", "Check your credentials");
				return "Login";
			}
		} catch (HttpServerErrorException e) {
			// ResponseEntity.of(Optional.of("User doesnot exist"));
			M.addAttribute("str", e.getResponseBodyAsString());
		}
		return "Login";
	}

	@RequestMapping("/addnewbus")
	public String AddNewBus(Model M) {
		M.addAttribute("B", new BusInfo());
		int randomNum = new Random().nextInt(10000);
		String busId = String.format("B%04d", randomNum);
		M.addAttribute("busId", busId);
		return "addnewbus";
	}

	@RequestMapping("/addNewBus")
	public String addNewBus(@Valid @ModelAttribute("B") BusInfo B, BindingResult res, Model M) {
		if (!res.hasErrors()) {
			ResponseEntity<String> str = restTemplate.postForEntity(restUrls.INSERT_BUS_INFO, B, String.class);
			M.addAttribute("str", str.getBody());
		}
		return "addnewbus";
	}

	@RequestMapping("/addnewroute")
	public String AddNewRoute(Model M) {
		M.addAttribute("R", new RouteInfo());
		int randomNum = new Random().nextInt(10000);
		String routeId = String.format("R%04d",randomNum);
		M.addAttribute("routeId", routeId);
		return "addnewroute";
	}

	@RequestMapping("/addNewRoute")
	public String addNewRoute(@Valid @ModelAttribute("R") RouteInfo R, BindingResult res, Model M) {
		if (!res.hasErrors()) {
			ResponseEntity<Long> count=restTemplate.getForEntity(restUrls.GET_BY_FROM+"?fromLocation="+R.getFromLocation()+"&toLocation="+R.getToLocation(), Long.class);
			if(count.getBody()==0)
			{
			ResponseEntity<String> str = restTemplate.postForEntity(restUrls.INSERT_ROUTE_INFO, R, String.class);
			M.addAttribute("str", str.getBody());
			}
			else
			{
				M.addAttribute("str1", "Route already exists for these locations");
			}
		}
		return "addnewroute";
	}

	@RequestMapping("/addnewschedule")
	public String AddNewSchedule(Model M) {
		M.addAttribute("S", new ScheduleInfo());
		LocalDate currentDate = LocalDate.now();
		String currentYear = DateTimeFormatter.ofPattern("yyyy").format(currentDate);
		String currentMonth = DateTimeFormatter.ofPattern("MM").format(currentDate);
		int randomNum = new Random().nextInt(10000);
		String scheduleId = String.format("S%s%s%04d", currentYear, currentMonth, randomNum);
		M.addAttribute("scheduleId", scheduleId);
		return "addnewschedule";
	}

	@RequestMapping("/addNewSchedule")
	public String addNewRoute(Model M, @Valid @ModelAttribute("S") ScheduleInfo S,BindingResult res,@RequestParam("busno") String busno,
			@RequestParam("routeno") String routeno,@RequestParam("fromLocation")  String fromLocation,@RequestParam("toLocation")  String toLocation,@RequestParam("scheduleTime")  String time) {
		System.out.println("Hello");
		ResponseEntity<BusInfo> B = null;
		ResponseEntity<RouteInfo> R = null;
		System.out.println("sarithaaaaaaaaaaaaaaaaaa");
		try {
			B = restTemplate.getForEntity(restUrls.BUS_INFO, BusInfo.class, Map.of("busId", busno));
			R = restTemplate.getForEntity(restUrls.ROUTE_INFO, RouteInfo.class, Map.of("routeId", routeno));
			S.setBusId(B.getBody());
			S.setRouteId(R.getBody());
			System.out.println("sarithaaaaaaaaaaaaaaaaaa11111111");
			System.out.println(res.hasErrors());
			if (!res.hasErrors()) {
			
				
				System.out.println("***********************************************************");
				LocalTime timeString =LocalTime.parse( time);
				S.setScheduleTime(timeString);
				System.out.println("@@@@@@@@@@@@@@"+S.getScheduleTime());
				ResponseEntity<String> str = restTemplate.postForEntity(restUrls.INSERT_SCHEDULE_INFO, S, String.class);
				M.addAttribute("str", str.getBody());
			}
			else {
				System.out.println("**********"+res.getErrorCount());
				System.out.println(res.getFieldErrors());
			}
		} catch (HttpServerErrorException e) {
			System.out.println("sarithaaaaaaaaaaaaaaaaaa111111111111");
			// TODO: handle exception
			M.addAttribute("str", e.getResponseBodyAsString());
		}
		return "addnewschedule";
	}

	@RequestMapping("/checkticket")
	public String checkticket(Model M) {
		CheckTicket c = new CheckTicket();
		// System.out.println(customerId);
		M.addAttribute("c", c);
		return "checkticket";
	}

	@RequestMapping("/CheckTicket")
	public String CheckTicket(Model M, @Valid @ModelAttribute("c") CheckTicket c, BindingResult res) {
		/*
		 * System.out.println(c.getCustomerId());
		 * System.out.println(c.getFromLocation());
		 * System.out.println(c.getToLocation());
		 * System.out.println(c.getJourneyDate());
		 * System.out.println(c.getNoOfTickets());
		 */
		if (!res.hasErrors()) {
			UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(restUrls.Get_BUSES)
					.queryParam("customerId", c.getCustomerId()).queryParam("fromLocation", c.getFromLocation())
					.queryParam("toLocation", c.getToLocation()).queryParam("journeyDate", c.getJourneyDate())
					.queryParam("noOfTickets", c.getNoOfTickets());
			// HttpEntity<CheckTicket> http=new HttpEntity<CheckTicket>(c);
			ParameterizedTypeReference<List<ScheduleInfo>> response = new ParameterizedTypeReference<List<ScheduleInfo>>() {
			};
			ResponseEntity<List<ScheduleInfo>> schedules = restTemplate.exchange(builder.toUriString(), HttpMethod.GET,
					null, response);
			List<ScheduleInfo> list = schedules.getBody();
			System.out.println("************" + list.size());

			M.addAttribute("noti", c.getNoOfTickets());
			M.addAttribute("str", "No buses available on " + c.getJourneyDate());
			M.addAttribute("buses", list);
		}
		// M.addAttribute("c", c);
		return "checkticket";
	}

	@RequestMapping("/bookticket/{sId}")
	public String bookticket(Model M, @PathVariable("sId") String sId, HttpSession session) {
		M.addAttribute("s", new Passenger());
		M.addAttribute("sId", sId);
		Integer noOftickets = (Integer) session.getAttribute("noti");
		System.out.println("++++++++++++++++++++++++++" + noOftickets);
		return "bookticket";
	}

	@RequestMapping("/bookTicket")
	public String bookTicket(@ModelAttribute("s") PassengerForm p, Model M,
			@SessionAttribute("customerId") String customerId, @SessionAttribute("sId") String scheduleId,
			@SessionAttribute("noti") int noOfTickets, HttpSession session) {
		List<Passenger> passenger = p.getPassengerList();
		int passengerSize = passenger.size();
		System.out.println(session.getAttribute("sId"));
		LocalDate currentDate = LocalDate.now();
		String currentYear = DateTimeFormatter.ofPattern("yyyy").format(currentDate);
		String currentMonth = DateTimeFormatter.ofPattern("MM").format(currentDate);
		int randomNum = new Random().nextInt(10000);
		String transactionId = String.format("TR%s%s%04d", currentYear, currentMonth, randomNum);
		String ticketId = String.format("TI%s%s%04d", currentYear, currentMonth, randomNum);
		System.out.println("?????????????????????????????" + transactionId);
		System.out.println("???????????????????????????????????????" + ticketId);
		ResponseEntity<Customer> c = restTemplate.getForEntity(restUrls.GET_CUSTOMER_BY_ID, Customer.class,
				Map.of("customerId", customerId));
		ResponseEntity<ScheduleInfo> s = restTemplate.getForEntity(restUrls.GET_SCHEDULE_BY_ID, ScheduleInfo.class,
				scheduleId, noOfTickets);
		System.out.println("{{{{{{{{{{{{{{{{{{{{{{{"+s.getBody().getScheduleTime());
		TicketHistory T = new TicketHistory(transactionId, c.getBody(), LocalDateTime.now(), s.getBody(), noOfTickets,
				ticketId, "Booked", s.getBody().getCost() * passengerSize);
		HttpEntity<TicketHistory> h = new HttpEntity<>(T);
		ResponseEntity<TicketHistory> t = restTemplate.exchange(restUrls.INSERT_TICKETHISTORY, HttpMethod.POST, h,
				TicketHistory.class);
		System.out.println(t.getBody().getScheduleId().getAvailableSeats());
		for (int i = 0; i < passengerSize; i++) {
			System.out.println(passenger.get(i).getPassengerKey().getPassengerId());
			PassengerEmbeddable P = new PassengerEmbeddable(passenger.get(i).getPassengerKey().getPassengerId(),
					t.getBody());
			Passenger passengerObject = new Passenger(P, passenger.get(i).getPassengerName(), passenger.get(i).getAge(),
					passenger.get(i).getGender(), t.getBody().getStatus(), t.getBody().getTransctionDate());
			restTemplate.postForEntity(restUrls.INSERT_PASSENGER, passengerObject, null);
		}
		M.addAttribute("customerName", t.getBody().getCustomerId().getCustomerName());
		M.addAttribute("ticketId", ticketId);
		M.addAttribute("transactionId", transactionId);
		M.addAttribute("passengerList", passenger);
		M.addAttribute("totalFare", t.getBody().getTotalFare());
		M.addAttribute("s", s.getBody());
		return "SuccessfulBooking";
	}

	@RequestMapping("/viewhistory")
	public String viewHistory(Model M, @SessionAttribute("customerId") String customerId,@RequestParam(name = "pageIndex", defaultValue = "1") int pageIndex) {
		ResponseEntity<Customer> c = restTemplate.getForEntity(restUrls.GET_CUSTOMER_BY_ID, Customer.class,
				Map.of("customerId", customerId));
		System.out.println("customer id *****" + c.getBody().getCustomerId());
		HttpEntity<Customer> h = new HttpEntity<>(c.getBody());
		System.out.println("http " + h.getBody().getCustomerId());
		ParameterizedTypeReference<List<TicketHistory>> response = new ParameterizedTypeReference<List<TicketHistory>>() {
		};
		ResponseEntity<List<TicketHistory>> list = restTemplate
				.exchange(restUrls.VIEW_HISTORY + "?customerId=" + customerId, HttpMethod.GET, null, response);
		System.out.println(list.getBody().size());
		M.addAttribute("list", list.getBody());
		for (int i = 0; i < list.getBody().size(); i++) {
			System.out.println(list.getBody().get(i).getTransactionId());
		}
		
		M.addAttribute("str", "No history found on this customerId: " + customerId);
		
		int totalRecords = list.getBody().size();
		int pageSize=5;
		List<TicketHistory> d=new ArrayList<>();
		for(int i=0;i<list.getBody().size();i++)
		{
			d.add(list.getBody().get(i));
		}

        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        System.out.println(pageIndex);
        List<TicketHistory> recordsToDisplay = d.subList((pageIndex - 1) * pageSize, Math.min(pageIndex * pageSize, totalRecords));

        M.addAttribute("list", recordsToDisplay); // Pass vlist as "list" to the JSP
        M.addAttribute("totalPages", totalPages);
        M.addAttribute("pageIndex", pageIndex);
		
		return "ViewHistoryPagination";
	}

	@RequestMapping("/updateprofile")
	public String updateprofile(Model M) {
		M.addAttribute("c", new Customer());
		// M.addAttribute("customerId", customerId);
		return "UpdateProfile";
	}

	@RequestMapping("/updateProfile")
	public String updateProfile(@SessionAttribute("customerId") String customerId, Model M,
			@Valid@ModelAttribute("c") Customer c,BindingResult res) {
		if(!res.hasErrors())
		{
		ResponseEntity<Customer> C = restTemplate.getForEntity(restUrls.GET_CUSTOMER_BY_ID, Customer.class,
				Map.of("customerId", customerId));
		c.setCustomerPassword(C.getBody().getCustomerPassword());
		HttpEntity<Customer> h = new HttpEntity<Customer>(c);
		ResponseEntity<String> str = restTemplate.exchange(restUrls.UPDATE_CUSTOMER, HttpMethod.PUT, h, String.class);
		M.addAttribute("str", str.getBody());
		}
		else
		{
			M.addAttribute("c", c);
		}
		return "UpdateProfile";
	}

	@RequestMapping("/cancelticket")
	public String cancelticket() {
		return "cancelTicket";
	}

	@RequestMapping("/cancelTicket")
	public String cancelTicket(@RequestParam("ticketId") String ticketId, @SessionAttribute("customerId") String customerId,Model M) {
		System.out.println("sachin ???????????????????????????????");
		try {
			ResponseEntity<TicketHistory> t = restTemplate.getForEntity(restUrls.GET_BY_TICKET_ID+"?ticketId="+ticketId+"&customerId="+customerId, TicketHistory.class,
					Map.of("ticketId", ticketId), Map.of("customerId", customerId));
			ParameterizedTypeReference<List<TicketHistory>> response = new ParameterizedTypeReference<List<TicketHistory>>() {
			};
			ResponseEntity<List<TicketHistory>> list = restTemplate.exchange(
					restUrls.GET_BY_TICKETID_CANCEL_STATUS + "?ticketId=" + ticketId + "&customerId=" + customerId,
					HttpMethod.GET, null, response);
			int cancelledTickets=0 ;
			int bookedTickets = t.getBody().getNoOfTickets();
			LocalDateTime scheduleTimings=LocalDateTime.of(t.getBody().getScheduleId().getDateOfJourney(),t.getBody().getScheduleId().getScheduleTime());
			LocalDateTime now=LocalDateTime.now();
			if(list.getBody().size()!=0)
			{
				cancelledTickets=list.getBody().stream().mapToInt(TicketHistory::getNoOfTickets).sum();
			}
			if(bookedTickets==cancelledTickets)
			{
				System.out.println("*************************");
				M.addAttribute("msg","No bookings availiabe");
			}
			if(scheduleTimings.compareTo(now)<=0)
			{
				M.addAttribute("msg2", "Oops!..Your journey is already completed");
			}
			else
			{
				if(bookedTickets > cancelledTickets)
				{		
					ParameterizedTypeReference<List<Passenger>> plist=new ParameterizedTypeReference<List<Passenger>>() {
					};
					ResponseEntity<List<Passenger>> passengerList=restTemplate.exchange(restUrls.GET_BY_TRANSACTIONID_AND_STATUS+"?transactionId="+t.getBody().getTransactionId(),HttpMethod.GET,null,plist);
					M.addAttribute("passengerList", passengerList.getBody());
				}
			}
			M.addAttribute("ticketId",ticketId);
			
			return "cancelTicket";
		}
		catch (HttpServerErrorException E) {
			M.addAttribute("msg1",E.getResponseBodyAsString());
			return "cancelTicket";
		}
	}
	
	@RequestMapping("/CancelTicket")
	public String ListOfCancelledTickets(Model M,@RequestParam("passengerArrayInput") String passengerArrayJSON)
	{
		String[] objectStrings = passengerArrayJSON.split("},");
		 String transactionId=null;
		 String passengerId=null;
		for (String objectString : objectStrings) {
			System.out.println(objectString);
		    int transactionIdStartIndex = objectString.indexOf("transactionId") + 16; // Adjust the index
		    int transactionIdEndIndex = objectString.indexOf('"', transactionIdStartIndex);
		   
		    transactionId = objectString.substring(transactionIdStartIndex, transactionIdEndIndex);

		    int passengerIdStartIndex = objectString.indexOf("passengerId") + 14; // Adjust the index
		    int passengerIdEndIndex = objectString.indexOf('"', passengerIdStartIndex);
		  
		    passengerId = objectString.substring(passengerIdStartIndex, passengerIdEndIndex);
    	    ResponseEntity<String> up=restTemplate.exchange(restUrls.UPDATE_PASSENGER,HttpMethod.PUT,null,String.class,transactionId,passengerId);
    	    System.out.println(up.getBody());
		} 
    	    LocalDate currentDate = LocalDate.now();
    		String currentYear = DateTimeFormatter.ofPattern("yyyy").format(currentDate);
    		String currentMonth = DateTimeFormatter.ofPattern("MM").format(currentDate);
    		int randomNum = new Random().nextInt(10000);
    		String tId = String.format("TR%s%s%04d", currentYear, currentMonth, randomNum);
    		ResponseEntity<TicketHistory> th=restTemplate.getForEntity(restUrls.GET_BY_TRANSACTIONID,TicketHistory.class,Map.of("transactionId",transactionId));
		    TicketHistory T=new TicketHistory();
		    T.setTransactionId(tId);
		    T.setCustomerId(th.getBody().getCustomerId());
		    T.setScheduleId(th.getBody().getScheduleId());
		    T.setTransctionDate(LocalDateTime.now());
		    T.setNoOfTickets(objectStrings.length);
		    T.setStatus("Cancelled");
		    T.setTicketId(th.getBody().getTicketId());
		    ScheduleInfo s=th.getBody().getScheduleId();
		    LocalDateTime scheduledTimeDate= LocalDateTime.of(s.getDateOfJourney(), s.getScheduleTime());
		    Duration duration = Duration.between(T.getTransctionDate(),scheduledTimeDate );
		    long hours=duration.toHours();
		    System.out.println("<<<<<<<<<<<<<<<<<<<<<"+hours);
		    double refundMoney=0;
		    if(hours>=48)
		    {
		    	refundMoney=(th.getBody().getTotalFare()-(objectStrings.length*s.getCost()*0.1));
		    }
		    else if (hours<48&&hours>=24) {
				refundMoney=(th.getBody().getTotalFare()-(objectStrings.length*s.getCost()*0.25));
			}
		    else if (hours<24&&hours>=12) {
				refundMoney=(th.getBody().getTotalFare()-(objectStrings.length*s.getCost()*0.5));
			}
		    else
		    {
		    	refundMoney=0;
		    }
		    T.setTotalFare(refundMoney);
		    s.setAvailableSeats(s.getAvailableSeats()+objectStrings.length);
		    restTemplate.postForEntity(restUrls.INSERT_TICKETHISTORY, T, null);
		    restTemplate.put(restUrls.UPDATE_SCHEDULEINFo, s);
		    System.out.println(refundMoney);
		    M.addAttribute("amount", th.getBody().getTotalFare()-refundMoney);
		    M.addAttribute("str", "Ticket cancelled successfully");
		    return "cancelTicket";
	}
	
	@RequestMapping("/buses")
	public String searchbuses(Model M)
	{
		M.addAttribute("s", new SearchBuses());
		return "searchBuses";
	}
	
	@RequestMapping("/Buses")
	public String searchBUSES(Model M,@Valid @ModelAttribute("s") SearchBuses S,BindingResult res)
	{
		if(!res.hasErrors())
		{
			UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(restUrls.GET_BUSES).queryParam("fromLocation", S.getFromLocation())
					.queryParam("toLocation", S.getToLocation()).queryParam("journeyDate", S.getDOJ()).queryParam("noOfTickets",S.getNoOfTickets());
			ParameterizedTypeReference<List<ScheduleInfo>> response = new ParameterizedTypeReference<List<ScheduleInfo>>() {
			};
			ResponseEntity<List<ScheduleInfo>> schedules = restTemplate.exchange(builder.toUriString(), HttpMethod.GET,
					null, response);
			List<ScheduleInfo> list = schedules.getBody();
			M.addAttribute("str", "No buses available on " + S.getDOJ());
			M.addAttribute("buses", list);
		}
		return "searchBuses";
	}
}


