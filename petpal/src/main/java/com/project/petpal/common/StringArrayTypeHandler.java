package com.project.petpal.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringArrayTypeHandler implements TypeHandler<String[]> {

	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		// TODO Auto-generated method stub
		if(parameter != null) {
			String value=String.join(",", parameter);
			ps.setNString(i,value);
		}else {
			ps.setString(i,"");
		}
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String[] temp=rs.getNString(columnName).split(",");
		return temp;
	}

	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String[] temp=rs.getNString(columnIndex).split(",");
		return temp;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return cs.getNString(columnIndex).split(",");
	}

}
