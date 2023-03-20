package com.oti.team2.progress.dto;

import java.text.ParseException;
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
	
	private List<Integer> prgrsList = new ArrayList<>(Arrays.asList(0,10,40,70,80,90,100));
			
	public PrgrsPlanDto createPrgrsPlanDto(List<Progress> pList, int nowRt){
		PrgrsPlanDto ppDto = new PrgrsPlanDto();
		if(nowRt == 0) nowRt = 2;
		TreeSet<String> dSet = new TreeSet<>();
		
		dSet.add(pList.get(0).getBgngYmd().toString());
		for(Progress p : pList) {
			dSet.add(p.getEndYmd().toString());
		}
		
		/*if(pList.get(pList.size()-1).getEndYmd() != null) {
			dSet.add(pList.get(pList.size()-1).getEndYmd().toString());			
		}*/
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date now = new java.util.Date();
		dSet.add(sdf.format(now));
				
		ppDto.setSrNo(pList.get(0).getSrNo());
		ppDto.setDateList(new ArrayList<>(dSet));
		
		
		//오늘날짜가 dateList의 몇번째에 있는지 확인
		int idx = ppDto.getDateList().indexOf(sdf.format(now));
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		//int num  = prgrsList.get(idx);
		int middle = 0;
		long d1;
		long d2;
		long d3;
		System.out.println(ppDto.getDateList());
		/*if(idx == 0) {*/
		
		if(ppDto.getDateList().size() == 7) {
			int[]arr = new int[7];
			Arrays.fill(arr, 0);
			arr[idx] = nowRt;
			ppDto.setNowArr(arr);			
		
		} else {
			int[]arr = new int[8];
			Arrays.fill(arr, 0);
			arr[idx] = nowRt;
			ppDto.setNowArr(arr);
			
			try {
				d1 = format2.parse(ppDto.getDateList().get(idx - 1)).getTime() / 1000;
				d2 = format2.parse(ppDto.getDateList().get(idx)).getTime() / 1000;
				d3 = format2.parse(ppDto.getDateList().get(idx + 1)).getTime() / 1000;
				
				
				
				long d31 = (d3 - d1) / (24*60*60);
				long d21 = (d2 - d1) / (24*60*60);
				System.out.println(d31);
				System.out.println(d21);
				System.out.println(d21/d31);
				middle = (int) (prgrsList.get(idx - 1) + ((prgrsList.get(idx) - prgrsList.get(idx - 1)) / d31 * d21));
			} catch (ParseException e) {
				e.printStackTrace();
			}	
		}
			
			
			
	/*	}
		else {
			try {
				d1 = format2.parse(ppDto.getDateList().get(idx - 1)).getTime() / 1000;
				d2 = format2.parse(ppDto.getDateList().get(idx + 1)).getTime() / 1000;
				
				int day = (int) ((d2 - d1) / (24*60*60));
				middle = (int)  prgrsList.get(idx-1) + (prgrsList.get(idx) - prgrsList.get(idx-1)) / day;
				System.out.println(day);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}*/
		
		prgrsList.add(idx, middle);
		
		ppDto.setPrgrsList(this.prgrsList);
		return ppDto;
	}
}
