package com.course.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "exam")
public class Exam {
	
	private Integer examId;
	private String examType;
	private String examName;
	private Integer examTime;
	private String examUrl;
//	双向一对多   主控方
	private Set<ParentQuestion> parentQuestions = new HashSet<ParentQuestion>(0);
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getExamId() {
		return examId;
	}	
	public void setExamId(Integer examId) {
		this.examId = examId;
	}
	
	public String getExamType() {
		return examType;
	}
	public void setExamType(String examType) {
		this.examType = examType;
	}
	
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	
	public Integer getExamTime() {
		return examTime;
	}
	public void setExamTime(Integer examTime) {
		this.examTime = examTime;
	}
	
	public String getExamUrl() {
		return examUrl;
	}
	public void setExamUrl(String examUrl) {
		this.examUrl = examUrl;
	}
	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="exam")
	public Set<ParentQuestion> getParentQuestions() {
		return parentQuestions;
	}
	public void setParentQuestions(Set<ParentQuestion> parentQuestions) {
		this.parentQuestions = parentQuestions;
	}
}
