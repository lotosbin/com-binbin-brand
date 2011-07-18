package com.binbin.brand;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class BrandEntity {
	public static Entity getProduct(String name) {
		Key key = KeyFactory.createKey("Product", name);
		return Util.findEntity(key);
	}
}
