package com.techwave.busbookingclient.restConnect;

public class restUrls {
	public static final String INSERT_CUSTOMER="http://localhost:9999/registercustomer";
	public static final String GET_BY_COUNTRYID="http://localhost:9999/countryID/{countryId}";
	public static final String GET_ALL_COUNTRIES="http://localhost:9999/getcountries";
	public static final String CHECK_ADMIN_EXISTS="http://localhost:9999/checkadminexists/{userId}";
	public static final String INSERT_BUS_INFO="http://localhost:9999/AddNewBus";
	public static final String INSERT_ROUTE_INFO="http://localhost:9999/AddNewRoute";
	public static final String INSERT_SCHEDULE_INFO="http://localhost:9999/AddNewSchedule";
	public static final String BUS_INFO="http://localhost:9999/getBus/{busId}";
	public static final String ROUTE_INFO="http://localhost:9999/getRoute/{routeId}";
	public static final String Get_BUSES="http://localhost:9999/getbuses";
	public static final String GET_BUSES="http://localhost:9999/getBUSES";
	public static final String INSERT_TICKETHISTORY="http://localhost:9999/insertTicketHistory";
	public static final String GET_CUSTOMER_BY_ID="http://localhost:9999/getCustomerById/{customerId}";
	public static final String GET_SCHEDULE_BY_ID="http://localhost:9999/getScheduleById/{scheduleId}/{noOfTickets}";
	public static final String INSERT_PASSENGER="http://localhost:9999/insertPassenger";
	public static final String VIEW_HISTORY="http://localhost:9999/ViewHistory";
	public static final String UPDATE_CUSTOMER="http://localhost:9999/updateCustomer";
	public static final String GET_BY_TICKET_ID="http://localhost:9999/getbyticketid";
	public static final String GET_BY_TICKETID_CANCEL_STATUS="http://localhost:9999/getByTicketIdCancelStatus";
	public static final String GET_BY_TRANSACTIONID_AND_STATUS="http://localhost:9999/getByTransactionIdAndStatus";
	public static final String UPDATE_PASSENGER="http://localhost:9999/updatePassenger/{transactionId}/{passengerId}";
	public static final String GET_BY_TRANSACTIONID="http://localhost:9999/getByTransactionId/{transactionId}";
	public static final String UPDATE_SCHEDULEINFo="http://localhost:9999/updateSchedule";
	public static final String GET_BY_FROM="http://localhost:9999/getByFrom";
}
