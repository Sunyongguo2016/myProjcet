package com.course.entity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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
	
	@OneToOne
	@JoinColumn(name = "studentId")
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	
	@OneToOne
	@JoinColumn(name = "examId")
	public Exam getExam() {
		return exam;
	}
	public void setExam(Exam exam) {
		this.exam = exam;
	}
	
	@OneToOne
	@JoinColumn(name = "parentQuestionId")
	public ParentQuestion getParentQuestion() {
		return parentQuestion;
	}
	
	public void setParentQuestion(ParentQuestion parentQuestion) {
		this.parentQuestion = parentQuestion;
	}
	
	@OneToOne
	@JoinColumn(name = "questionId")
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}	
}
