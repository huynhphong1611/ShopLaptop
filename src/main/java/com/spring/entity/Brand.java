package com.spring.entity;

import java.sql.Date;

public class Brand {

    private int BrandID;
    private String BrandName;
    private String BrandUrl;
    private Date CreatedDate;

    public Brand() {
    }

    public Brand(int BrandID, String BrandName, String BrandUrl, Date CreatedDate) {
        this.BrandID = BrandID;
        this.BrandName = BrandName;
        this.BrandUrl = BrandUrl;
        this.CreatedDate = CreatedDate;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public String getBrandUrl() {
        return BrandUrl;
    }

    public void setBrandUrl(String BrandUrl) {
        this.BrandUrl = BrandUrl;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }
}
