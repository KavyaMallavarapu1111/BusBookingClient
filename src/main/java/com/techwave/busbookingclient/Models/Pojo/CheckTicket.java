package com.techwave.busbookingclient.Models.Pojo;

import java.time.LocalDate;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public class CheckTicket {
	@NotBlank(message="Required")
	private String customerId;
	@NotBlank(message="Required")
	private String fromLocation;
	@NotBlank(message="Required")
	private String toLocation;
	@NotNull(message="Required")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@CheckTicketDOJValidatorInterface
	private LocalDate journeyDate;
	@NotNull(message="Required")
	@Range(min=1,max=4,message="Maximum four tickets can be booked once")
	private Integer noOfTickets;
	public CheckTicket() {
		super();
	}
	public CheckTicket(String customerId, String fromLocation, String toLocation, LocalDate journeyDate,
			Integer noOfTickets) {
		super();
		this.customerId = customerId;
		this.fromLocation = fromLocation;
		this.toLocation = toLocation;
		this.journeyDate = journeyDate;
		this.noOfTickets = noOfTickets;
	}

	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getFromLocation() {
		return fromLocation;
	}
	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}
	public String getToLocation() {
		return toLocation;
	}
	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}
	public LocalDate getJourneyDate() {
		return journeyDate;
	}
	public void setJourneyDate(LocalDate journeyDate) {
		this.journeyDate = journeyDate;
	}
	public Integer getNoOfTickets() {
		return noOfTickets;
	}
	public void setNoOfTickets(Integer noOfTickets) {
		this.noOfTickets = noOfTickets;
	}
	
}
