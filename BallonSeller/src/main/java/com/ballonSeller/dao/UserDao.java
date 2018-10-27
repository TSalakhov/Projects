package com.ballonSeller.dao;

import com.ballonSeller.model.User;

public interface UserDao {
    User findById(Long id);
    User findByUsername(String username);
}
