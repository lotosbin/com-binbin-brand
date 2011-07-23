package com.binbin.brand;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.users.User;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class ThirdBrand {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;

	public Long getId() {
		return id;
	}

	@Persistent
	private User author;

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public String getName() {
		return name;
	}

	public void setName(String content) {
		this.name = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Persistent
	private String name;

	@Persistent
	private Date date;

	/**
	 * @param author
	 * @param name
	 * @param date
	 */
	public ThirdBrand(User author, String name, Date date) {
		super();
		this.author = author;
		this.name = name;
		this.date = date;
	}
}