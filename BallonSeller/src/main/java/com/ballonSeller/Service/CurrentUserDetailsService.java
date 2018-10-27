package com.ballonSeller.Service;

import com.ballonSeller.dao.UserDao;
import com.ballonSeller.model.CurrentUser;
import com.ballonSeller.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
public class CurrentUserDetailsService implements UserDetailsService {
    @Autowired
    UserDao userDao;

    @Override
    public CurrentUser loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("No user with username = " + username + " found");
        }
        CurrentUser currentUser = new CurrentUser(user);
        return currentUser;
    }

}
