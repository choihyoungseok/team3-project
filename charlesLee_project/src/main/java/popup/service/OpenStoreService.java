package popup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import popup.mapper.OpenStoreMapper;
import popup.vo.StoreVo;

@Service
public class OpenStoreService {

	@Autowired
	OpenStoreMapper openStoreMapper;

	public List<StoreVo> getAllStore() {
		return openStoreMapper.getOpenStoreList();
	}

	
	public List<StoreVo> getMapStore() {
		return openStoreMapper.getMapList();
	}
	


	public List<StoreVo> getStoreByTitle(String inputText) {
		return openStoreMapper.getStoreByTitle(inputText);
	}

}
