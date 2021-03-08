package com.spring.entity;

import java.math.BigDecimal;
import java.sql.Date;

public class Product {

    private int ProductID;
    private String ProductName;
    private String ProductDescription;
    private BigDecimal ProductPrice;
    private BigDecimal PromotionPrice;
    private int Rating;
    private String ProductImage;
    private int ProductStock;
    private String ProductURL;
    private int Viewcount;
    private Boolean ProductStatus;
    private Date CreatedDate;
    private int BrandID;

    public Product() {
    }

    public Product(int ProductID, String ProductName, String ProductDescription, BigDecimal ProductPrice, BigDecimal PromotionPrice, String ProductImage, String ProductURL, int BrandID, Date creteddate) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductDescription = ProductDescription;
        this.ProductPrice = ProductPrice;
        this.PromotionPrice = PromotionPrice;
        this.ProductImage = ProductImage;
        this.ProductURL = ProductURL;
        this.BrandID = BrandID;
        this.CreatedDate = creteddate;
    }

    public Product(String ProductName, String ProductDescription, BigDecimal ProductPrice, BigDecimal PromotionPrice, int Rating, String ProductImage, int ProductStock, Boolean ProductStatus, int BrandID) {
        this.ProductName = ProductName;
        this.ProductDescription = ProductDescription;
        this.ProductPrice = ProductPrice;
        this.PromotionPrice = PromotionPrice;
        this.Rating = Rating;
        this.ProductImage = ProductImage;
        this.ProductStock = ProductStock;
        this.ProductStatus = ProductStatus;
        this.BrandID = BrandID;
    }

    public Product(int ProductID, String ProductName, BigDecimal ProductPrice, String ProductImage, int ProductStock) {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.ProductPrice = ProductPrice;
        this.ProductImage = ProductImage;
        this.ProductStock = ProductStock;
    }


    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getProductDescription() {
        return ProductDescription;
    }

    public void setProductDescription(String ProductDescription) {
        this.ProductDescription = ProductDescription;
    }

    public BigDecimal getProductPrice() {
        return ProductPrice;
    }

    public void setProductPrice(BigDecimal ProductPrice) {
        this.ProductPrice = ProductPrice;
    }

    public BigDecimal getPromotionPrice() {
        return PromotionPrice;
    }

    public void setPromotionPrice(BigDecimal PromotionPrice) {
        this.PromotionPrice = PromotionPrice;
    }

    public int getRating() {
        return Rating;
    }

    public void setRating(int Rating) {
        this.Rating = Rating;
    }

    public String getProductImage() {
        return ProductImage;
    }

    public void setProductImage(String ProductImage) {
        this.ProductImage = ProductImage;
    }

    public int getProductStock() {
        return ProductStock;
    }

    public void setProductStock(int ProductStock) {
        this.ProductStock = ProductStock;
    }

    public String getProductURL() {
        return ProductURL;
    }

    public void setProductURL(String ProductURL) {
        this.ProductURL = ProductURL;
    }

    public int getViewcount() {
        return Viewcount;
    }

    public void setViewcount(int Viewcount) {
        this.Viewcount = Viewcount;
    }

    public Boolean getProductStatus() {
        return ProductStatus;
    }

    public void setProductStatus(Boolean ProductStatus) {
        this.ProductStatus = ProductStatus;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

}
