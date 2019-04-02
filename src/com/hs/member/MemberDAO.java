package com.hs.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.choa.util.DBConnector;

public class MemberDAO {
	public int insert(MemberDTO memberDTO, Connection con) throws Exception{
		String sql ="insert into daily_member values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, memberDTO.getName());
		st.setString(2, memberDTO.getId());
		st.setString(3, memberDTO.getPassword());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getBirth());
		st.setString(6, memberDTO.getSex());
		st.setString(7, memberDTO.getPhone());

		int result = st.executeUpdate();
		st.close();
		return result;
	}
	public MemberDTO selectOne(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from daily_member where id=? and password=?";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPassword());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			memberDTO.setName(rs.getString("name"));
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPassword(rs.getString("password"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setBirth(rs.getString("birth"));
			memberDTO.setSex(rs.getString("sex"));
			memberDTO.setPhone(rs.getString("phone"));
		}else {
			memberDTO=null;
		}
		
		DBConnector.disConnect(rs, st, con);
		return memberDTO;
	}
	
	public boolean idCheck(String id) throws Exception{
		boolean check = true;
		Connection con = DBConnector.getConnect();
		String sql = "select * from daily_member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			check = !check;
		}else {
			check = check;
		}
		DBConnector.disConnect(st, con);
		return check;
	}
	
	public MemberDTO findMember(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select * from daily_member where name=? and email=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getName());
		st.setString(2, memberDTO.getEmail());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			memberDTO.setName(rs.getString("name"));
			memberDTO.setId(rs.getString("id"));
			memberDTO.setPassword(rs.getString("password"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setBirth(rs.getString("birth"));
			memberDTO.setSex(rs.getString("sex"));
			memberDTO.setPhone(rs.getString("phone"));
		}else {
			memberDTO=null;
		}
		
		DBConnector.disConnect(rs, st, con);
		return memberDTO;
	}
}
