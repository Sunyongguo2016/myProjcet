package com.course.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "selectt")
public class Selectt {
	
	private Integer selecttId;
	private String selecttName;
	private String selecttContent;
	
	private Question question;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getSelecttId() {
		return selecttId;
	}
	public void setSelecttId(Integer selecttId) {
		this.selecttId = selecttId;
	}
	
	public String getSelecttName() {
		return selecttName;
	}
	public void setSelecttName(String selecttName) {
		this.selecttName = selecttName;
	}
	
	public String getSelecttContent() {
		return selecttContent;
	}
	public void setSelecttContent(String selecttContent) {
		this.selecttContent = selecttContent;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "questionId")
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}	
}
