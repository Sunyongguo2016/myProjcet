package com.course.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="error")
public class Error {

	private Integer errorId;
	private Integer isCollect;
	private String experience;
	
	private StudentInfo studentInfo;
	private Exam exam;
	private Question question;
	private ParentQuestion parentQuestion;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getErrorId() {
		return errorId;
	}
	public void setErrorId(Integer errorId) {
		this.errorId = errorId;
	}
	
/*	@ManyToOne
	@JoinColumn(name="studentId")
*/	@OneToOne
	@JoinColumn(name = "studentId")
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
//	这里需要改
	@OneToOne
	@JoinColumn(name = "examId")
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	@OneToOne
	@JoinColumn(name = "questionId")
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	
	@OneToOne
	@JoinColumn(name = "parentQuestionId")
	public ParentQuestion getParentQuestion() {
		return parentQuestion;
	}

	public void setParentQuestion(ParentQuestion parentQuestion) {
		this.parentQuestion = parentQuestion;
	}
	
	public Integer getIsCollect() {
		return isCollect;
	}
	public void setIsCollect(Integer isCollect) {
		this.isCollect = isCollect;
	}
	
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	
}
