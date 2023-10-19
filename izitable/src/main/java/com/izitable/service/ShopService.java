package com.izitable.service;

import java.util.List;

import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;
import com.izitable.model.User;

public interface ShopService {

	List<Shop> list(Shop shop);

	Shop item(int shopNo);

	Boolean login(Shop shop);

	void update(Shop item);

	List<Shop> list_admin(Pager pager);

	void add(Shop shop);

	int duplicateCheck(Shop shop);

	void shopSettingTimeAdd(ShopTime shopTm);

	List<Shop> shopSettingTimeList(ShopTime shopTm);

	void shopSettingTableAdd(ShopTable shopTb);

	List<Shop> shopSettingTableList(ShopTable shopTb);

	void shopSettingTableDel(int tableNo);

	void shopSettingTimeDel(int timeNo);

	void update_admin(Shop item);

	void delete(int shopNo);

	//조회수 증가
	void viewCount(int shopNo);
	
	//메인 페이지 인기 음식점(10곳 제한)
	List<Shop> list_popular(Pager pager);

	
	//지역 db 불러오기
	List<Shop> siList();

	List<Shop> guList(Shop shop);

	List<Shop> dongList(Shop shop);

}
