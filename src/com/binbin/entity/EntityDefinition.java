/**
 * 
 */
package com.binbin.entity;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.users.User;

/**
 * @author binbin
 *
 */
@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class EntityDefinition {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public Long getId() {
		return id;
	}

	/**
	 * @param author
	 * @param content
	 * @param date
	 */
	public EntityDefinition(User author, String content, Date date) {
		super();
		this.author = author;
		this.content = content;
		this.date = date;
	}

	@Persistent
	private String content;
	@Persistent
	private Date date;
	@Persistent
	private User author;
}
