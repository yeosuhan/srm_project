package com.oti.team2.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.member.dto.Developer;
import com.oti.team2.member.dto.FilterDto;
import com.oti.team2.member.dto.Member;
import com.oti.team2.member.dto.MemberDto;
import com.oti.team2.member.dto.ProfileImg;
import com.oti.team2.util.pager.Pager;

public interface IMemberDao {

	/**
	 * 아이디 조회 후 있으면, member 객체 리턴하여 principal 객체를 위해 사용됨
	 * 
	 * @author 신정은
	 */
	public Member selectByMemberId(String memberId);

	/**
	 * 멤버 타입별 총 행수 조회
	 * 
	 * @author : 신정은
	 * @param memberType
	 * @return
	 */
	public int countByMemberType(@Param("memberType")String memberType, @Param("filtering")FilterDto filterDto);
	
	/**
	 * 멤버 타입 별 목록 조회 (관리자가 수행)
	 * 
	 * @author : 신정은
	 * @param memberType
	 * @param pager
	 * @param filtering 
	 * @return
	 */
	public List<Member> selectByMemberType(@Param("memberType")String memberType, @Param("pager")Pager pager,@Param("filtering") FilterDto filterDto);
	

	/**
	 * 멤버 타입 별 내 정보 조회
	 * 
	 * @author : 신정은
	 * @param memberId
	 * @param memberType
	 * @return
	 */
	public Member selectByMemberIdAndMemberType(@Param("memberId") String memberId,
			@Param("memberType") String memberType);

	/**
	 * 멤버 타입 별 내 정보 수정 고객은 구현 완료, 사원 로직 추가 필요
	 * 
	 * @author : 신정은
	 * @param member
	 * @return
	 */
	public int updateMember(@Param("member") Member member);

	/**
	 * 멤버의 프로필 사진 조회 추가 구현 필요
	 * 
	 * @author : 신정은
	 * @param memeberId
	 * @return
	 */
	public ProfileImg selectFile(@Param("memberId") String memeberId);

	/*
	 * 사원 삭제 (관리자)
	 * 
	 * @author 안한길
	 * 
	 * @param 맴버아이디
	 * 
	 * @return 반영된 행수
	 */
	public int deleteMemberByMemberId(String memberId);

	/*
	 * 사원 수정 (관리자)
	 * 
	 * @author 안한길
	 * 
	 * @param 수정된 값
	 * 
	 * @return 반영된 행수
	 */
	public int updateMemberByMemberId(Member member);

	/*
	 * 개발자 목록 조회
	 * 
	 * @author 안한길
	 * 
	 * @param 부서 id
	 * 
	 * @return 개발자 목록
	 */
	public List<Developer> selectByDeptCd(String deptCd);
	
	/**
	 * memberId로 사용자 이름 가져오기
	 * @author 신정은
	 */
	public String selectFlnmByMemberId(@Param("memberId")String memberId);
	
	/**
	 * 
	 * @author 최은종
	 * 아이디와 전화번호로 가입 유무 판단해서 비밀번호 찾기 
	 * 
	 */
	public String selectPswd(MemberDto memberDto);
	
	/**
	 * 
	 * @author 최은종
	 * 임시 비밀번호를 암호화한 비밀번호로 DB 업데이트 
	 * 
	 */
	
	public String updatePswdByMemberId(@Param("memberId")String memberId);

	/* 전체 관리자 리스트 조회(알람 전송 수신자)
	 * @author 안한길
	 * */
	public List<String> selectAdmin();
	/**
	 * 
	 * @author 최은종
	 * 비밀번호 찾기 후 임시 비밀번호로 업데이트
	 * 
	 */
	public int updateRandomPswd(MemberDto memberDto);
}