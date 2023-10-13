package com.izitable.dao;

import java.util.List;

import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;

public interface ShopDao {

	List<Shop> list(Shop shop);

	Shop list(int shopNo);

	Shop login(Shop shop);

	void update(Shop item);

	List<Shop> list_admin(Pager pager);

	Object add(Shop shop);

	int duplicateCheck(Shop shop);

	void shopSettingTimeAdd(ShopTime shopTm);

	List<Shop> shopSettingTimeList(ShopTime shopTm);

	void shopSettingTableAdd(ShopTable shopTb);

	List<Shop> shopSettingTableList(ShopTable shopTb);

	void shopSettingTableDel(int tableNo);

	void shopSettingTimeDel(int timeNo);

	void update_admin(Shop item);

	void delete(int shopNo);

	int total(Pager pager);

}
