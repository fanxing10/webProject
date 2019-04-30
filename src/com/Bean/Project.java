package com.Bean;

public class Project {

    private int id;
    private String projectName;
    private String applyer;
    private String landlinePhone;
    private String mobilePhone;
    private String appleTime;
    private String email;
    private int money;
    private int moneyGiven;

    private String moment;
    private String promaryCoverage;


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getApplyer() {
        return applyer;
    }

    public void setApplyer(String applyer) {
        this.applyer = applyer;
    }

    public String getLandlinePhone() {
        return landlinePhone;
    }

    public void setLandlinePhone(String landlinePhone) {
        this.landlinePhone = landlinePhone;
    }

    public String getMobilePhone() {
        return mobilePhone;
    }

    public void setMobilePhone(String mobilePhone) {
        this.mobilePhone = mobilePhone;
    }

    public String getAppleTime() {
        return appleTime;
    }

    public int getMoneyGiven() {
        return moneyGiven;
    }

    public void setMoneyGiven(int moneyGiven) {
        this.moneyGiven = moneyGiven;
    }

    public void setAppleTime(String appleTime) {
        this.appleTime = appleTime;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getMoment() {
        return moment;
    }

    public void setMoment(String moment) {
        this.moment = moment;
    }

    public String getPromaryCoverage() {
        return promaryCoverage;
    }

    public void setPromaryCoverage(String promaryCoverage) {
        this.promaryCoverage = promaryCoverage;
    }
}
