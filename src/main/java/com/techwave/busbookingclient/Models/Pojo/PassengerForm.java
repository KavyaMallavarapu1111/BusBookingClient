package com.techwave.busbookingclient.Models.Pojo;

import java.util.List;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;

public class PassengerForm {
	
	    @Valid
	    @NotEmpty(message = "Passenger list cannot be empty")
	    private List<Passenger> passengerList;

		public List<Passenger> getPassengerList() {
			return passengerList;
		}

		public void setPassengerList(List<Passenger> passengerList) {
			this.passengerList = passengerList;
		}

		public PassengerForm(List<Passenger> passengerList) {
			super();
			this.passengerList = passengerList;
		}

	    public PassengerForm() {
	    	
	    }
}
