package com.hotel;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.Date;

import com.user.DBConnection;

public class Main {

	
	public static void main(String[] args) throws ClassNotFoundException, SQLException, ParseException {

//		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//        String dateInString = "07/01/2021";
//
//           Date date = formatter.parse(dateInString);
//           DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
//            //System.out.println(date);
//            System.out.println(formatter.format(date));
		Set<String> hash_Set  = new HashSet<String>(); 
	    hash_Set.add("Geeks"); 
	    hash_Set.add("For"); 
	    hash_Set.add("Geeks"); 
	    hash_Set.add("Example"); 
	    hash_Set.add("Set"); 

	    for (String s : hash_Set) {
    	System.out.println(s); 
            
	    }
       
	}

}
