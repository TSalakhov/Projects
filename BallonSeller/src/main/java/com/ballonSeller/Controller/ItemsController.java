package com.ballonSeller.Controller;

import com.ballonSeller.dao.ItemDao;
import com.ballonSeller.model.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Controller
public class ItemsController {
    @Value("${upload.path}")
    private String uploadPath;
    @Autowired
    ItemDao itemDao;

    @PostMapping("/refactorImage")
    public String refactor(Model model, @RequestParam("file") MultipartFile file,@RequestParam int id) throws IOException {
        Item item = new Item();
        if (file != null) {
            File uploadDirectory = new File(uploadPath);
            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdir();
            }
            String resultFilename = file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            item.setFilename(resultFilename);
        }
        item.setId(id);
        itemDao.RefactorFilename(item);
        return "redirect:/";
    }

    @PostMapping("/refactorItem")
    public String refactor(Model model,@RequestParam int id, String name, int cost) throws  IOException{
        Item item = new Item();
        item.setId(id);
        item.setName(name);
        item.setCost(cost);
        itemDao.RefactorItem(item);
        return "redirect:/";
    }
    @PostMapping("/AddItem")
    public String add(Model model,@RequestParam  String name, int cost){
        Item item = new Item();
        item.setName(name);
        item.setCost(cost);
        itemDao.AddNewItem(item);
        return "redirect:/";
    }
}
