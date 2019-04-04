package com.core.mappers;

import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.core.entity.User;

public class MyRowMapper implements RowMapper<User>{
 
	@Override
	public User mapRow(java.sql.ResultSet resultSet, int arg1) throws SQLException {
		User user = new User();
        user.setId(resultSet.getInt("id"));
        user.setUserName(resultSet.getString("userName"));
        user.setPassword(resultSet.getString("password"));
        user.setRoleName(resultSet.getString("roleName"));
        return user;
	}
 }