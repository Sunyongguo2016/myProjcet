package com.course.entity;

import java.util.HashSet;
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
	private Set<Selectt> selectts = new HashSet<Selectt>(0);
	
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
	
	@ManyToOne
	@JoinColumn(name="parentQuestionId")
	public ParentQuestion getParentQuestion() {
		return parentQuestion;
	}
	public void setParentQuestion(ParentQuestion parentQuestion) {
		this.parentQuestion = parentQuestion;
	}
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="question")
	public Set<Selectt> getSelectts() {
		return selectts;
	}
	public void setSelectts(Set<Selectt> selectts) {
		this.selectts = selectts;
	}
	
	
}
