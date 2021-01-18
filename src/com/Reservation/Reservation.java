package com.Reservation;


import java.sql.*;

public class Reservation {
	private String reservationID;
	private Date fromDate ;
	private Date toDate ;
	private String Hotel ;
	private String client ;
	private String payment ;
	private String roomNumber;
	private int adults;
	public Reservation(String reservationID, Date fromDate, Date toDate, String hotel, String client, String payment,
			String roomNumber, int adults, int children) {
		super();
		this.reservationID = reservationID;
		this.fromDate = fromDate;
		this.toDate = toDate;
		Hotel = hotel;
		this.client = client;
		this.payment = payment;
		this.roomNumber = roomNumber;
		this.adults = adults;
		this.children = children;
	}
	private int children;
	
	public String getReservationID() {
		return reservationID;
	}
	public void setReservationID(String reservationID) {
		this.reservationID = reservationID;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public String getHotel() {
		return Hotel;
	}
	public void setHotel(String hotel) {
		Hotel = hotel;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public Reservation() {
		}
	public String getPayment() {
		// TODO Auto-generated method stub
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public int getAdults() {
		return adults;
	}
	public void setAdults(int adults) {
		this.adults = adults;
	}
	public int getChildren() {
		return children;
	}
	public void setChildren(int children) {
		this.children = children;
	}
}
