package com.techwave.busbookingclient.Models.Pojo;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;
public class Customer {
	
	private String customerId;
	
	@Pattern(regexp = "^[A-Za-z ]+$", message = "Name should contain only letters and spaces")
	private String customerName;
	@Pattern(regexp = "^[A-Za-z ]+$", message = "Address should contain only letters and spaces")
	private String address;
	private String city;
	private String state;
	private String country;
	@Pattern(regexp="^\\d{6}$",message="Must be 6 digits")
	private String pincode;
	@Pattern(regexp="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$",message="Check email format")
	//regexp="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
	private String email;
	private String gender;
	@Pattern(regexp="^\\d{10}$",message="Must be 10 digits")
	private String contactNo;	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@NotNull(message = "required")
	@DOBValidatorInterface
	private LocalDate dob;
	private String customerPassword;
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Customer(String customerId, String customerName, String address, String city, String state, String country,
			String pincode, String email, String gender, String contactNo, LocalDate dob, String customerPassword) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pincode = pincode;
		this.email = email;
		this.gender = gender;
		this.contactNo = contactNo;
		this.dob = dob;
		this.customerPassword = customerPassword;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public String getCustomerPassword() {
		return customerPassword;
	}

	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerName=" + customerName + ", address=" + address
				+ ", city=" + city + ", state=" + state + ", country=" + country + ", pincode=" + pincode + ", email="
				+ email + ", gender=" + gender + ", contactNo=" + contactNo + ", dob=" + dob + ", customerPassword="
				+ customerPassword + "]";
	}

}
