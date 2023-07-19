package popup.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popup.mapper.AlarmMapper;

@Service
public class AlarmService {
	
	@Autowired
	AlarmMapper alarmMapper;

	public boolean insertAlarm(int memberNum,int storeNum,String alarmContent,Date alarmTime) throws SQLException{
		boolean result = false;
		
		result = alarmMapper.insertAlarm(memberNum,storeNum,alarmContent,alarmTime);
		
		return result;
		
	}

	public boolean deleteAlarm(int memberNum, int storeNum) throws SQLException{
		boolean result = false;
		
		result = alarmMapper.deleteAlarm(memberNum,storeNum);
		
		return result;
	}

	public List<Integer> getStoreByAlarm(int customerNum) throws Exception{
		
		return alarmMapper.getStoreByAlarm(customerNum);
	}
}
