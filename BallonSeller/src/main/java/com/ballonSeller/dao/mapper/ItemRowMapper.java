package com.ballonSeller.dao.mapper;

import com.ballonSeller.model.Item;
import org.springframework.stereotype.Component;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class ItemRowMapper implements RowMapper<Item> {
    @Override
    public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
       Item item = new Item();
        item.setId(rs.getInt("id"));
        item.setName(rs.getString("name"));
        item.setCost(rs.getInt("cost"));
        item.setFilename(rs.getString("filename"));
        return item;
    }
}
