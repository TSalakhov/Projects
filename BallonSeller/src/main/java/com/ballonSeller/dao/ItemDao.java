package com.ballonSeller.dao;

import com.ballonSeller.model.Item;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface ItemDao {
    List<Item> ShowAllBallon();
    Item RefactorFilename(Item item);
    Item RefactorItem(Item item);
    Item AddNewItem(Item item);
}
