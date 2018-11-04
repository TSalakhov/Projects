package com.ballonSeller.Controller;

import com.ballonSeller.dao.ItemDao;
import com.ballonSeller.dao.ItemDaoImpl;
import com.ballonSeller.model.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

    @Controller
    public class AuthController {
@Autowired
        ItemDao itemDao;
        @GetMapping("/login")
        public String login(@ModelAttribute("model") ModelMap model, Authentication authentication, @RequestParam Optional<String> error) {
            if (authentication != null) {
                return "redirect:/";
            }
            model.addAttribute("error", error);
            return "login";
        }

        @GetMapping(value = {"/", "/home"})
        String home(Model model) {
            List<Item> items = itemDao.ShowAllBallon();
            model.addAttribute("items",items);
            return "index";
        }
    }
