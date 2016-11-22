package com.course.entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
@Entity
@Table(name="score")
public class Score {
	
	private Integer id;
	private float score;       
	
	private StudentInfo studentInfo;
	private Exam exam;
	private ParentQuestion parentQuestion;
	private Question question;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	
	@ManyToOne
	@JoinColumn(name="studentId")
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	
	@OneToOne
	@PrimaryKeyJoinColumn
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	@OneToOne
	@PrimaryKeyJoinColumn
	public ParentQuestion getParentQuestion() {
		return parentQuestion;
	}
	
	public void setParentQuestion(ParentQuestion parentQuestion) {
		this.parentQuestion = parentQuestion;
	}
	
	@OneToOne
	@PrimaryKeyJoinColumn
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}	
}
