package com.ballonSeller.dao;

import com.ballonSeller.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    @Autowired
    RowMapper<User> userRowMapper;
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public User findById(Long id) {
        String sqlQuery = "SELECT * FROM Admin WHERE id = :id";
        Map namedParameters = new HashMap();
        namedParameters.put("id", id);
        User user = namedParameterJdbcTemplate.queryForObject(sqlQuery, namedParameters, userRowMapper);
        return user;
    }

    @Override
    public User findByUsername(String username) {
        String sqlQuery = "SELECT * FROM Admin WHERE username = :username";
        Map namedParameters = new HashMap();
        namedParameters.put("username", username);
        User user = namedParameterJdbcTemplate.queryForObject(sqlQuery, namedParameters, userRowMapper);
        return user;
    }
}

