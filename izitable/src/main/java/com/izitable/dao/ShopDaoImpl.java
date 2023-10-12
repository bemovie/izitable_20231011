package com.izitable.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.izitable.model.Pager;
import com.izitable.model.Shop;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Shop> list(Shop shop) {
		return sql.selectList("shop.list", shop);
	}

	@Override
	public Shop list(int shopNo) {
		return sql.selectOne("shop.item", shopNo);
	}

	@Override
	public Shop login(Shop shop) {
		return sql.selectOne("shop.login", shop);
	}

	@Override
	public void update(Shop item) {
		sql.selectOne("shop.update", item);
	}

	@Override
	public List<Shop> list_admin(Pager pager) {
		return sql.selectList("shop.list_admin", pager);
	}

	@Override
	public Object add(Shop shop) {
		return sql.insert("shop.add", shop);
	}

	@Override
	public int duplicateCheck(Shop shop) {
		return sql.selectOne("shop.duplicateCheck", shop);
	}

	@Override
	public void shopSettingTimeAdd(Shop shop) {
		sql.insert("shop.shopSettingTimeAdd", shop);
	}

	@Override
	public List<Shop> shopSettingTimeList(Shop shop) {
		return sql.selectList("shop.shopSettingTimeList", shop);
	}

	@Override
	public void shopSettingTableAdd(Shop shop) {
		sql.insert("shop.shopSettingTableAdd", shop);
	}

	@Override
	public List<Shop> shopSettingTableList(Shop shop) {
		return sql.selectList("shop.shopSettingTableList", shop);
	}

}
