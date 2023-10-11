package com.izitable.dao;

import java.util.List;

import com.izitable.model.Pager;
import com.izitable.model.Shop;

public interface ShopDao {

	List<Shop> list(Shop shop);

	Shop list(int shopNo);

	Shop login(Shop shop);

	void update(Shop item);

	List<Shop> list_admin(Pager pager);

}
