package com.course.entity;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "question")
public class Question {
	
	private Integer questionId;
	private String questionContent;
	private String questionAnswer;
	private String questionExplain;
	private float questionScore;
	
	private ParentQuestion parentQuestion;
	private List<Selectt> selectts = new ArrayList<Selectt>(0);
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	
	public String getQuestionAnswer() {
		return questionAnswer;
	}
	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer = questionAnswer;
	}
	public String getQuestionExplain() {
		return questionExplain;
	}
	public void setQuestionExplain(String questionExplain) {
		this.questionExplain = questionExplain;
	}
	
	public float getQuestionScore() {
		return questionScore;
	}
	public void setQuestionScore(float questionScore) {
		this.questionScore = questionScore;
	}
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="parentQuestionId")
	public ParentQuestion getParentQuestion() {
		return parentQuestion;
	}
	public void setParentQuestion(ParentQuestion parentQuestion) {
		this.parentQuestion = parentQuestion;
	}
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="question")
	public List<Selectt> getSelectts() {
		return selectts;
	}
	public void setSelectts(List<Selectt> selectts) {
		this.selectts = selectts;
	}
}
