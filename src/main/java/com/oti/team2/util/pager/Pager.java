package com.oti.team2.util.pager;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pager {
	private int totalRows;		//전체 행수
	private int totalPageNo;	//전체 페이지 수
	private int totalGroupNo;	//전체 그룹 수
	private int startPageNo;	//그룹의 시작 페이지 번호
	private int endPageNo;		//그룹의 끝 페이지 번호
	private int pageNo;			//현재 페이지 번호
	private int pagesPerGroup = 3;	//그룹당 페이지 수
	private int groupNo;		//현재 그룹 번호
	private int rowsPerPage = 12;	//페이지당 행 수 
	private int startRowNo;		//페이지의 시작 행 번호(1, ..., n)
	private int endRowNo;		//페이지의 마지막 행 번호


	public Pager(int totalRows, int pageNo) {
		this.totalRows = totalRows;
		this.pageNo = pageNo;

		totalPageNo = totalRows / rowsPerPage;
		if (totalRows % rowsPerPage != 0)
			totalPageNo++;

		totalGroupNo = totalPageNo / pagesPerGroup;
		if (totalPageNo % pagesPerGroup != 0)
			totalGroupNo++;

		groupNo = (pageNo - 1) / pagesPerGroup + 1;

		startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		if (totalRows != 0) {
			endPageNo = startPageNo + pagesPerGroup - 1;
		} else {
			endPageNo = startPageNo;
		}

		if (groupNo == totalGroupNo)
			endPageNo = totalPageNo;
		startRowNo = (pageNo - 1) * rowsPerPage + 1;
		endRowNo = pageNo * rowsPerPage;
	}

	public Pager commentPager(int totalRows, int pageNo) {
		rowsPerPage = 3;
		totalPageNo = totalRows / rowsPerPage;
		pagesPerGroup = 4;
		if (totalRows % rowsPerPage != 0)
			totalPageNo++;

		totalGroupNo = totalPageNo / pagesPerGroup;
		if (totalPageNo % pagesPerGroup != 0)
			totalGroupNo++;

		groupNo = (pageNo - 1) / pagesPerGroup + 1;

		startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		if (totalRows != 0) {
			endPageNo = startPageNo + pagesPerGroup - 1;
		} else {
			endPageNo = startPageNo;
		}

		if (groupNo == totalGroupNo)
			endPageNo = totalPageNo;
		startRowNo = (pageNo - 1) * rowsPerPage + 1;
		endRowNo = pageNo * rowsPerPage;

		Pager pager = new Pager(totalRows, totalPageNo, totalGroupNo, startPageNo, endPageNo, pageNo, pagesPerGroup,
				groupNo, rowsPerPage, startRowNo, endRowNo);

		return pager;
	}

}
