package com.oti.team2.progress.dto;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.TreeSet;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * [나의할일:관리자] 진척률 선그래프를 위한 객체
 * @author 신정은
 *
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
public class PrgrsPlanDto {
	private String srNo;
	
	private int[] nowArr;
		
	private List<String> dateList;
	
	private List<Integer> prgrsList = new ArrayList<>(Arrays.asList(10,40,70,80,90,100));
			
	public PrgrsPlanDto createPrgrsPlanDto(List<Progress> pList, int nowRt) {
		PrgrsPlanDto ppDto = new PrgrsPlanDto();
		
		TreeSet<String> dSet = new TreeSet<>();
		for(Progress p : pList) {
			dSet.add(p.getBgngYmd().toString());
		}
		
		if(pList.get(pList.size()-1).getEndYmd() != null) {
			dSet.add(pList.get(pList.size()-1).getEndYmd().toString());			
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date now = new java.util.Date();
		dSet.add(sdf.format(now));
				
		ppDto.setSrNo(pList.get(0).getSrNo());
		ppDto.setDateList(new ArrayList<>(dSet));
		
		if(ppDto.getDateList().size() == 6) ppDto.getDateList().add(pList.get(pList.size()-1).getBgngYmd().toString());
		
		//오늘날짜가 dateList의 몇번째에 있는지 확인
		int idx = ppDto.getDateList().indexOf(sdf.format(now));
		int[]arr = new int[7];
		Arrays.fill(arr, 0);
		arr[idx] = nowRt;
		ppDto.setNowArr(arr);
		
		int num  = prgrsList.get(idx);
		this.prgrsList.add(idx, arr[idx]);
		
		ppDto.setPrgrsList(this.prgrsList);
		return ppDto;
	}
}
