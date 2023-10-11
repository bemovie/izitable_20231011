package com.izitable.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.izitable.dao.ShopDao;
import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.User;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopDao dao;

	@Override
	public List<Shop> list(Shop shop) {
		return dao.list(shop);
	}

	@Override
	public Shop item(int shopNo) {
		return dao.list(shopNo);
	}

	@Override
	public Boolean login(Shop shop) {
		
		Shop result = dao.login(shop);
		
		if (result != null) {
			BeanUtils.copyProperties(result, shop);
			shop.setShopPwd(null);
			
			return true;
		}
		return false;
	}

	@Override
	public void update(Shop item) {
		dao.update(item);
	}

	@Override
	public List<Shop> list_admin(Pager pager) {
		return dao.list_admin(pager);
	}

	@Override
	public void add(Shop shop) {
		dao.add(shop);
	}

	@Override
	public int duplicateCheck(Shop shop) {
		return dao.duplicateCheck(shop);
	}
	
}
