package com.xcj.pojo;

import java.util.Date;
import javax.persistence.*;

public class Role {
    private Long id;

    private String name;

    private String descpt;

    private String code;

    private Date createtime;

    private Date updatetime;

    @Column(name = "insertUid")
    private Long insertuid;

    /**
     * @return id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return descpt
     */
    public String getDescpt() {
        return descpt;
    }

    /**
     * @param descpt
     */
    public void setDescpt(String descpt) {
        this.descpt = descpt;
    }

    /**
     * @return code
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * @return createtime
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * @param createtime
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * @return updatetime
     */
    public Date getUpdatetime() {
        return updatetime;
    }

    /**
     * @param updatetime
     */
    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    /**
     * @return insertUid
     */
    public Long getInsertuid() {
        return insertuid;
    }

    /**
     * @param insertuid
     */
    public void setInsertuid(Long insertuid) {
        this.insertuid = insertuid;
    }
}