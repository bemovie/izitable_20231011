package com.izitable.service;

import java.util.List;

import com.izitable.model.Pager;
import com.izitable.model.Shop;

public interface ShopService {

	List<Shop> list(Shop shop);

	Shop item(int shopNo);

	Boolean login(Shop shop);

	void update(Shop item);

	List<Shop> list_admin(Pager pager);
	
}
