package com.entity;

public class Orders {
    private Integer id;

    private Integer uid;

    private Integer fid;

    private String status;

    private String mark;

    private String stime;

    private String etime;

    private Integer amount;

    private String btype;

    private String pubtime;

    private Double zprice;

    private String ono;

    private String otype;

    private String ytime;

    private Integer sid;

    private Double bprice;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark == null ? null : mark.trim();
    }

    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime == null ? null : stime.trim();
    }

    public String getEtime() {
        return etime;
    }

    public void setEtime(String etime) {
        this.etime = etime == null ? null : etime.trim();
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getBtype() {
        return btype;
    }

    public void setBtype(String btype) {
        this.btype = btype == null ? null : btype.trim();
    }

    public String getPubtime() {
        return pubtime;
    }

    public void setPubtime(String pubtime) {
        this.pubtime = pubtime == null ? null : pubtime.trim();
    }

    public Double getZprice() {
        return zprice;
    }

    public void setZprice(Double zprice) {
        this.zprice = zprice;
    }

    public String getOno() {
        return ono;
    }

    public void setOno(String ono) {
        this.ono = ono == null ? null : ono.trim();
    }

    public String getOtype() {
        return otype;
    }

    public void setOtype(String otype) {
        this.otype = otype == null ? null : otype.trim();
    }

    public String getYtime() {
        return ytime;
    }

    public void setYtime(String ytime) {
        this.ytime = ytime == null ? null : ytime.trim();
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Double getBprice() {
        return bprice;
    }

    public void setBprice(Double bprice) {
        this.bprice = bprice;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", uid=").append(uid);
        sb.append(", fid=").append(fid);
        sb.append(", status=").append(status);
        sb.append(", mark=").append(mark);
        sb.append(", stime=").append(stime);
        sb.append(", etime=").append(etime);
        sb.append(", amount=").append(amount);
        sb.append(", btype=").append(btype);
        sb.append(", pubtime=").append(pubtime);
        sb.append(", zprice=").append(zprice);
        sb.append(", ono=").append(ono);
        sb.append(", otype=").append(otype);
        sb.append(", ytime=").append(ytime);
        sb.append(", sid=").append(sid);
        sb.append(", bprice=").append(bprice);
        sb.append("]");
        return sb.toString();
    }
}