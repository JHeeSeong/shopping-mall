package com.hs.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.choa.util.DBConnector;
import com.choa.util.MakePage;
import com.choa.util.MakeRow;
import com.choa.util.PageMaker;

public class NoticeDAO {
	public int insert(NoticeDTO noticeDTO, Connection con) throws Exception{
		String sql ="insert into daily_notice values(DAILYNOTICE_SEQ.nextval,?,?,?,?,sysdate,?,DAILYNOTICE_SEQ.currval,1,0))";
		PreparedStatement st = con.prepareStatement(sql);
	
		st.setString(1, noticeDTO.getName());
		st.setString(2, noticeDTO.getPassword());
		st.setString(3, noticeDTO.getTitle());
		st.setString(4, noticeDTO.getContents());
		st.setInt(5, noticeDTO.getHit());

		int result = st.executeUpdate();
		st.close();
		return result;
	}
	public ArrayList<NoticeDTO> selectList(MakeRow makeRow,String kind,String search) throws Exception {
		Connection con = DBConnector.getConnect();
		ArrayList<NoticeDTO> ar = new ArrayList<>();
		
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from daily_notice where "+ kind +" like ? order by num desc) N)"
				+ "where R between ? and ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setName(rs.getString("name"));
			noticeDTO.setPassword(rs.getString("password"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getString("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	public NoticeDTO selectOne(int number) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql = "select * from daily_notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, number);
		ResultSet rs = st.executeQuery();
		
		NoticeDTO noticeDTO = null;
		while(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setName(rs.getString("name"));
			noticeDTO.setPassword(rs.getString("password"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getString("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		DBConnector.disConnect(rs, st, con);
		return noticeDTO;
	}
	public int hitUpdate(int number) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "update daily_notice set hit=hit+1 where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, number);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public HashMap<String, Object> selectList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		int curPage = 1;
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");
		
		if(kind==null) {
			kind="title";
		}
		if(search==null) {
			search="";
		}
		
		
		NoticeDAO noticeDAO = new NoticeDAO();
		int totalCount = noticeDAO.getTotalCount(kind,search);
		PageMaker pageMaker = new PageMaker(curPage, totalCount);
		MakeRow makeRow = pageMaker.getMakeRow();
		
		ArrayList<NoticeDTO> ar = noticeDAO.selectList(makeRow,kind,search);
		MakePage makePage = pageMaker.getMakePage();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", ar);
		map.put("page", makePage);
		map.put("search", search);
		map.put("kind", kind);
		
		return map;
	}
	public int getTotalCount(String kind, String search) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from daily_notice where "+kind+" like ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		return result;
	}
	
	public int noticeDelete(int number) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "DELETE FROM daily_notice WHERE NUM=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, number);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int update(NoticeDTO noticeDTO, Connection con) throws Exception{
		String sql ="update daily_notice set title=?, contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
	
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());

		int result = st.executeUpdate();
		st.close();
		return result;
	}
	
	private int replyUpdate(NoticeDTO noticeDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="update daily_notice set step=step+1 where ref=? and step>?";
		PreparedStatement st = con.prepareStatement(sql);

		st.setInt(1, noticeDTO.getRef());
		st.setInt(2, noticeDTO.getStep());
		int result = st.executeUpdate();

		return result;
	}
	public int reply(NoticeDTO noticeDTO) throws Exception{
		NoticeDTO parent = this.selectOne(noticeDTO.getNum());
		int result = this.replyUpdate(parent);

		Connection con = DBConnector.getConnect();
		String sql ="insert into daily_notice values(DAILYNOTICE_SEQ.nextval,?,?,?,?,sysdate,0,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getName());
		st.setString(2, noticeDTO.getPassword());
		st.setString(3, noticeDTO.getTitle());
		st.setString(4, noticeDTO.getContents());
		
		st.setInt(5, parent.getRef());
		st.setInt(6, parent.getStep()+1);
		st.setInt(7, parent.getDepth()+1);

		result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
}
