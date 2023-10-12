package com.izitable.service;

import java.util.List;

import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.User;

public interface ShopService {

	List<Shop> list(Shop shop);

	Shop item(int shopNo);

	Boolean login(Shop shop);

	void update(Shop item);

	List<Shop> list_admin(Pager pager);

	void add(Shop shop);

	int duplicateCheck(Shop shop);

	void shopSettingTimeAdd(Shop shop);

	List<Shop> shopSettingTimeList(Shop shop);

	void shopSettingTableAdd(Shop shop);

	List<Shop> shopSettingTableList(Shop shop);

}
