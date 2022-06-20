package com.idol.model;

import java.util.HashMap;
import java.util.List;


public interface UserEventDAO {
	
	public int getListCount();
	
	public List<EventDTO> eventList(HashMap<String, Object> map);
	
	public List<EventDTO> concertList(HashMap<String, Object> map);
	
	public void readCount(int no);
	
	public EventDTO eventCont(int no);
	
	
	
}
