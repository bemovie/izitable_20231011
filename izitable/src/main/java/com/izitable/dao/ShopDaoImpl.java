package com.izitable.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.izitable.model.Pager;
import com.izitable.model.Shop;
import com.izitable.model.ShopTable;
import com.izitable.model.ShopTime;

@Repository
public class ShopDaoImpl implements ShopDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Shop> list(Shop shop) {
		return sql.selectList("shop.list", shop);
	}

	@Override
	public Shop item(int shopNo) {
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
	public void shopSettingTimeAdd(ShopTime shopTm) {
		sql.insert("shop.shopSettingTimeAdd", shopTm);
	}

	@Override
	public List<Shop> shopSettingTimeList(ShopTime shopTm) {
		return sql.selectList("shop.shopSettingTimeList", shopTm);
	}

	@Override
	public void shopSettingTableAdd(ShopTable shopTb) {
		sql.insert("shop.shopSettingTableAdd", shopTb);
	}

	@Override
	public List<Shop> shopSettingTableList(ShopTable shopTb) {
		return sql.selectList("shop.shopSettingTableList", shopTb);
	}

	@Override
	public void shopSettingTableDel(int tableNo) {
		sql.delete("shop.shopSettingTableDel", tableNo);
	}

	@Override
	public void shopSettingTimeDel(int timeNo) {
		sql.delete("shop.shopSettingTimeDel", timeNo);
	}

	@Override
	public void update_admin(Shop item) {
		sql.update("shop.update_admin", item);
	}

	@Override
	public void delete(int shopNo) {
		sql.delete("shop.delete", shopNo);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("shop.total", pager);
	}

}
