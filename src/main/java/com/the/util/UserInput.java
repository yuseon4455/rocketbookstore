package com.the.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class UserInput {
   private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
   
   public static Scanner sc = new Scanner(System.in);
   
   public static long inputLong(String st) {
      System.out.println(st+" 정수 입력>>");
      return Long.parseLong(sc.nextLine());
   }
   
   public static int inputInt(String st) {
      System.out.println(st+" 정수 입력>>");
      return Integer.parseInt(sc.nextLine());
   }
   
   public static double inputDouble(String st) {
      System.out.println(st+" 실수 입력>>");
      return Double.parseDouble(sc.nextLine());
   }
   public static String inputString(String st) {
      System.out.println(st+" 문자열 입력>>");
      return sc.nextLine();
   }
   public static LocalDate inputDate(String st) {
         System.out.println(st + " 시간입력(yyyy-MM-dd)>>");

         String dtString = sc.nextLine();
         LocalDate dt;
         if (dtString == null || dtString.equals("")) {
            dt = LocalDate.now();
         } else {
            dt = LocalDate.parse(dtString, FORMATTER);
         }
         return dt;
      }
   public static LocalDateTime inputLocalDateTime(String st) {
      System.out.println(st+"시간 입력('yyyy-MM-dd HH:mm:ss')");
      String input = sc.nextLine();
      if (input.equals("")) {
         return LocalDateTime.now();
      } else {
         return LocalDateTime.parse(input, 
               DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
      }
   }
   public static String dateToString(LocalDateTime date) {
      return date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
   }

   public static String dateToString(LocalDate localDate) {
      return localDate.format(FORMATTER);

   }
   
   
   // 메서드 오버로딩- 기본값 반환
   public static LocalDate inputDate(String st, LocalDate defaultValue) {
       System.out.println(st + " 시간입력(yyyy-MM-dd)>>");

       String dtString = sc.nextLine();
       LocalDate dt;
       if (dtString.isEmpty()) {
          return defaultValue;
       } else {
          dt = LocalDate.parse(dtString, FORMATTER);
       }
       return dt;
    }
   
   // 메서드오버로딩- 기본값 반환
   public static LocalDateTime inputLocalDateTime(String st, LocalDateTime defaultValue) {
      System.out.println(st+"시간 입력('yyyy-MM-dd HH:mm:ss')");
      String input = sc.nextLine();
      if (input.isEmpty()) {
         return defaultValue;
      }
      return LocalDateTime.parse(input, 
              DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
   }
   
   
   //메서드 오버로딩
   public static String inputString(String st, String defaultValue) {
      System.out.println(st+" 문자열 입력>>");
      String input = sc.nextLine();
      if (input.isEmpty()) {
         return defaultValue;
      }
      return input;
   }

}