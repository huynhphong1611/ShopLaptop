/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.entity;

/**
 *
 * @author FR
 */
public class Configuration {

    private int ConfigID;
    private String OSName;
    private String OSVersion;
    private String SizeDisplay;
    private String FrontCamera;
    private String Cpu;
    private String Ram;
    private String Battery;

    private int ProductID;

    public int getConfigID() {
        return ConfigID;
    }

    public String getOSName() {
        return OSName;
    }

    public String getOSVersion() {
        return OSVersion;
    }

    public String getSizeDisplay() {
        return SizeDisplay;
    }

    public String getFrontCamera() {
        return FrontCamera;
    }

    public String getCpu() {
        return Cpu;
    }

    public String getRam() {
        return Ram;
    }

    public String getBattery() {
        return Battery;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setConfigID(int ConfigID) {
        this.ConfigID = ConfigID;
    }

    public void setOSName(String OSName) {
        this.OSName = OSName;
    }

    public void setOSVersion(String OSVersion) {
        this.OSVersion = OSVersion;
    }

    public void setSizeDisplay(String SizeDisplay) {
        this.SizeDisplay = SizeDisplay;
    }

    public void setFrontCamera(String FrontCamera) {
        this.FrontCamera = FrontCamera;
    }

    public void setCpu(String Cpu) {
        this.Cpu = Cpu;
    }

    public void setRam(String Ram) {
        this.Ram = Ram;
    }

    public void setBattery(String Battery) {
        this.Battery = Battery;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

}
