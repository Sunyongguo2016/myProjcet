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
@Table(name = "parentquestion")
public class ParentQuestion {
	
	private Integer parentQuestionId;
	private String parentQuestionName;
	private String parentQuestionArticle;
	private String parentQuestionTitle;
	private String description;
	private String imgUrl;
	
	private Exam exam;
	private Set<Question> questions = new HashSet<Question>(0);
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getParentQuestionId() {
		return parentQuestionId;
	}
	public void setParentQuestionId(Integer parentQuestionId) {
		this.parentQuestionId = parentQuestionId;
	}
	
	public String getParentQuestionName() {
		return parentQuestionName;
	}
	public void setParentQuestionName(String parentQuestionName) {
		this.parentQuestionName = parentQuestionName;
	}
	
	public String getParentQuestionArticle() {
		return parentQuestionArticle;
	}
	public void setParentQuestionArticle(String parentQuestionArticle) {
		this.parentQuestionArticle = parentQuestionArticle;
	}
	
	public String getParentQuestionTitle() {
		return parentQuestionTitle;
	}
	public void setParentQuestionTitle(String parentQuestionTitle) {
		this.parentQuestionTitle = parentQuestionTitle;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	//延迟加载真的好用！在所有manytoone设置延迟加载、 删除parentquestion时，设置lazy就不会受exam影响  否则删除出错
	@ManyToOne(cascade=CascadeType.MERGE,fetch = FetchType.LAZY)
	@JoinColumn(name="examId")
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}

	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,mappedBy="parentQuestion")
	public Set<Question> getQuestions() {
		return questions;
	}
	public void setQuestions(Set<Question> questions) {
		this.questions = questions;
	}
	
}
