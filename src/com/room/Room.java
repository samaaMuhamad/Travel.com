package com.room;

import java.sql.*;

public class Room {
	private String roomType;
	private String roomNumber ;
	private String roomFacilities ;
	private String startAvDate ;
	private String endAvDate ;
	private String hotel ;
	private String reserved;
	
	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getRoomFacilities() {
		return roomFacilities;
	}

	public void setRoomFacilities(String roomFacilities) {
		this.roomFacilities = roomFacilities;
	}

	public String getStartAvDate() {
		return startAvDate;
	}

	public void setStartAvDate(String startAvDate) {
		this.startAvDate = startAvDate;
	}

	public String getEndAvDate() {
		return endAvDate;
	}

	public void setEndAvDate(String endAvDate) {
		this.endAvDate = endAvDate;
	}

	public String getHotel() {
		return hotel;
	}

	public void setHotel(String hotel) {
		this.hotel = hotel;
	}

	
	public Room(String roomType, String roomNumber, String roomFacilities, String startAvDate, String endAvDate,
			String hotel, String reserved) {
		super();
		this.roomType = roomType;
		this.roomNumber = roomNumber;
		this.roomFacilities = roomFacilities;
		this.startAvDate = startAvDate;
		this.endAvDate = endAvDate;
		this.hotel = hotel;
		this.reserved = reserved;
	}

	public Room() {
	
	}

	public String getReserved() {
		return reserved;
	}

	public void setReserved(String reserved) {
		this.reserved = reserved;
	}

}
