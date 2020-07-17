package org.kh.fin.notice.domain;

import java.util.Date;

public class Notice {
	
	private int nId;//글 번호 
	private String nTitle;//글 제목
	private String nWriter;//작성자
	private String nContent;//내용
	private Date nCreateDate;//작성일
	private Date nModifyDate;//글 수정일
	private int nCategory;//건의내용
	private String nStatus;//회원 상태(탈퇴여부)
	private int prgress;//진행상황
	
	public Notice() {}
	//매개 변수가 있는 생성자 만드는 이유?
	//ModelAttribute 폼태그에있는 매개변수를 가져오기위해

	public Notice(int nId, String nTitle, String nWriter, String nContent, Date nCreateDate, Date nModifyDate,
			int nCategory, String nStatus, int prgress) {
		super();
		this.nId = nId;
		this.nTitle = nTitle;
		this.nWriter = nWriter;
		this.nContent = nContent;
		this.nCreateDate = nCreateDate;
		this.nModifyDate = nModifyDate;
		this.nCategory = nCategory;
		this.nStatus = nStatus;
		this.prgress = prgress;
	}

	public int getnId() {
		return nId;
	}

	public void setnId(int nId) {
		this.nId = nId;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnCreateDate() {
		return nCreateDate;
	}

	public void setnCreateDate(Date nCreateDate) {
		this.nCreateDate = nCreateDate;
	}

	public Date getnModifyDate() {
		return nModifyDate;
	}

	public void setnModifyDate(Date nModifyDate) {
		this.nModifyDate = nModifyDate;
	}

	public int getnCategory() {
		return nCategory;
	}

	public void setnCategory(int nCategory) {
		this.nCategory = nCategory;
	}

	public String getnStatus() {
		return nStatus;
	}

	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}

	public int getPrgress() {
		return prgress;
	}

	public void setPrgress(int prgress) {
		this.prgress = prgress;
	}

	@Override
	public String toString() {
		return "Notice [nId=" + nId + ", nTitle=" + nTitle + ", nWriter=" + nWriter + ", nContent=" + nContent
				+ ", nCreateDate=" + nCreateDate + ", nModifyDate=" + nModifyDate + ", nCategory=" + nCategory
				+ ", nStatus=" + nStatus + ", prgress=" + prgress + "]";
	}

	
	
	
	

	

	
	
}