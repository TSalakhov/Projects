package com.ballonSeller.dao;

import com.ballonSeller.model.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class ItemDaoImpl implements ItemDao {
    @Autowired
    NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    @Autowired
    RowMapper<Item> ItemRowMapper;
    @Autowired
    JdbcTemplate jdbcTemplate;
    @Override
    public List<Item> ShowAllBallon() {
        String sqlQuery="SELECT * FROM items";
        List <Item> item = namedParameterJdbcTemplate.query(sqlQuery,ItemRowMapper);
        return item;
    }


    @Override
    public Item RefactorFilename(Item item) {
        String sqlQuery = "UPDATE items SET filename= :filename WHERE id = :id ";
        Map namedParameters = new HashMap();
        namedParameters.put("filename",item.getFilename());
        namedParameters.put("id",item.getid());
        namedParameterJdbcTemplate.update(sqlQuery,namedParameters);
        return null;
    }
}
