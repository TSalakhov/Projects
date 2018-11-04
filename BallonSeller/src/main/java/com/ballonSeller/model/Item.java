package com.ballonSeller.model;

public class Item {
    private int id;
    private String name;
    private int cost;
    private String filename;

    public Item() {
    }

    public int getid() {
        return id;
    }

    public void setid(int id) {
        id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
