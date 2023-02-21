package com.oti.team2.member.dto;

import lombok.Data;

@Data
public class Member {
   private String memberId;
   private String pswd;
   private String flnm;
   private String addr;
   private String telNo;
   private String eml;
   private String jbgdCd;
   private String memberType;
   private String fileType;
   private byte[] fileData;
 }
