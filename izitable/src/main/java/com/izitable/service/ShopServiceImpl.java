package com.izitable.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.izitable.dao.ShopDao;
import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
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

	@Override
	public void shopSettingTimeAdd(ShopTime shopTm) {
		dao.shopSettingTimeAdd(shopTm);
	}

	@Override
	public List<Shop> shopSettingTimeList(ShopTime shopTm) {
		return dao.shopSettingTimeList(shopTm);
	}

	@Override
	public void shopSettingTableAdd(ShopTable shopTb) {
		dao.shopSettingTableAdd(shopTb);
	}

	@Override
	public List<Shop> shopSettingTableList(ShopTable shopTb) {
		return dao.shopSettingTableList(shopTb);
	}

	@Override
	public void shopSettingTableDel(int tableNo) {
		dao.shopSettingTableDel(tableNo);
	}

	@Override
	public void shopSettingTimeDel(int timeNo) {
		dao.shopSettingTimeDel(timeNo);
	}
	
}
