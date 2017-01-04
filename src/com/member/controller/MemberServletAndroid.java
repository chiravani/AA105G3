package com.member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.member.model.*;
import util.SendResponse;
import util.ImageUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.stream.JsonReader;

import java.util.Base64;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

@SuppressWarnings("serial")
@WebServlet("/MemberServletAndroid")
public class MemberServletAndroid extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		MemberService memberSvc = new MemberService();
		BufferedReader br = req.getReader();
		StringBuffer jsonIn = new StringBuffer();
		String line = null;
		while ((line = br.readLine()) != null) {
			jsonIn.append(line);
		}
		if (gson.fromJson(jsonIn.toString(), JsonObject.class) == null) {
			System.out.println("Member JsonObject null");
			return;
		}

		JsonObject jsonObject = gson.fromJson(jsonIn.toString(), JsonObject.class);

		String action = jsonObject.get("action").getAsString();
		System.out.println("Member action = " + action);
		StringBuffer outStr = new StringBuffer();

		if ("getAll".equals(action)) {
			List<MemberVO> memberlist = memberSvc.getAll();
			SendResponse.writeText(res, gson.toJson(memberlist));
			return;
		}

		if ("getOne_For_Display".equals(action)) {

			String mem_noJson = jsonObject.get("mem_no").getAsString();
			JsonReader reader = new JsonReader(new StringReader(mem_noJson));
			reader.setLenient(true);
			String mem_no = gson.fromJson(reader, String.class);
			// MemberVO memberVO = memberSvc.getOneMemberTextOnly(mem_no);
			MemberVO memberVO = memberSvc.getOneMember(mem_no, 1);

			outStr.append(gson.toJson(memberVO));
			SendResponse.writeText(res, outStr.toString());
			return;
		}

		if ("getOne_For_Update".equals(action)) {
		}

		if ("update".equals(action)) {
			String memberJson = jsonObject.get("memberVO").getAsString();
			MemberVO memberVO = gson.fromJson(memberJson, MemberVO.class);
			memberVO = memberSvc.updateMember(memberVO.getMem_no(), memberVO.getMem_name(), memberVO.getMem_ac(),
					memberVO.getMem_pw(), memberVO.getMem_image(), memberVO.getMem_sex(), memberVO.getMem_phone(),
					memberVO.getMem_email(), memberVO.getMem_adrs(), memberVO.getMem_own(), memberVO.getMem_history(),
					memberVO.getMem_online());

			outStr.append(gson.toJson(memberVO));
			SendResponse.writeText(res, outStr.toString());
		}

		//
		// =========================== Login ============================
		//
		if ("login".equals(action)) {
			String mem_ac = jsonObject.get("mem_ac").getAsString();
			String mem_pw = jsonObject.get("mem_pw").getAsString();
			MemberVO memberVO = memberSvc.getOneByMem_ac(mem_ac);

			if (memberVO.getMem_pw().equals(mem_pw)) {

				outStr.append(gson.toJson(memberVO));

				MemberVO memberVO_pic = memberSvc.getOneMember(memberVO.getMem_no());

				memberVO.setMem_online("1");// login之後，表示在線上, mem_online = 1

				memberSvc.updateMember(memberVO.getMem_no(), memberVO.getMem_name(), memberVO.getMem_ac(),
						memberVO.getMem_pw(), memberVO_pic.getMem_image(), memberVO.getMem_sex(),
						memberVO.getMem_phone(), memberVO.getMem_email(), memberVO.getMem_adrs(), memberVO.getMem_own(),
						memberVO.getMem_history(), memberVO.getMem_online());
				
			} else {
				memberVO = null;
				outStr.append(gson.toJson(memberVO));
			}

			SendResponse.writeText(res, outStr.toString());
		}

		// ===============logout============
		if ("logout".equals(action)) {
			String mem_ac = jsonObject.get("mem_ac").getAsString();
			String mem_pw = jsonObject.get("mem_pw").getAsString();
			MemberVO memberVO = memberSvc.getOneByMem_ac(mem_ac);

			// if(memberVO.getMem_pw().equals(mem_pw)){
			
			MemberVO memberVO_pic = memberSvc.getOneMember(memberVO.getMem_no());
			
			memberVO.setMem_online("0");// login之後，表示在線上, mem_online = 1

			memberSvc.updateMember(memberVO.getMem_no(), memberVO.getMem_name(), memberVO.getMem_ac(),
					memberVO.getMem_pw(), memberVO_pic.getMem_image(), memberVO.getMem_sex(), memberVO.getMem_phone(),
					memberVO.getMem_email(), memberVO.getMem_adrs(), memberVO.getMem_own(), memberVO.getMem_history(),
					memberVO.getMem_online());
			//
			//// memberVO.setMem_image(null);
			//// outStr.append(gson.toJson(memberVO));
			//// }else{
			memberVO = null;
			outStr.append(gson.toJson(memberVO));
			// }

			SendResponse.writeText(res, outStr.toString());
		}

		if ("insert".equals(action)) {
		}

		if ("delete".equals(action)) {
			MemberVO member = gson.fromJson(jsonObject.get("memberVO").getAsString(), MemberVO.class);
			memberSvc.deleteMember(member.getMem_no());
			SendResponse.writeText(res, String.valueOf(member));
		}
		if ("getImage".equals(action)) {
			OutputStream os = res.getOutputStream();
			String mem_no = jsonObject.get("mem_no").getAsString();
			int imageSize = jsonObject.get("imageSize").getAsInt();
			byte[] mem_image = memberSvc.getImage(mem_no);
			System.out.println("mem_no " + mem_no + " mem_image " + mem_image + " imageSize " + imageSize);

			if (mem_image != null) {
				System.out.println("Get image @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				mem_image = ImageUtil.shrink(mem_image, imageSize);
				res.setContentType("image/jpeg");
				res.setContentLength(mem_image.length);
			} else {
				System.out.println("mem_image is nullllllllllllllllllllllllllllllllllllllllllllllllllllllll");
				InputStream in = getServletContext().getResourceAsStream("/images/noimage.jpg");
				mem_image = new byte[in.available()];
				in.read(mem_image);
				in.close();
			}
			os.write(mem_image);
			return;
		}

	}

}
