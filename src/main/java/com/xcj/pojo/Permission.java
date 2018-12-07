package com.xcj.pojo;

import java.util.Date;
import javax.persistence.*;

public class Permission {
    private Long id;

    private String name;

    private Long pid;

    private Integer zindex;

    private Integer istype;

    private String descpt;

    private String code;

    private String icon;

    private String page;

    private Date createtime;

    private Date updatetime;

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
     * @return pid
     */
    public Long getPid() {
        return pid;
    }

    /**
     * @param pid
     */
    public void setPid(Long pid) {
        this.pid = pid;
    }

    /**
     * @return zindex
     */
    public Integer getZindex() {
        return zindex;
    }

    /**
     * @param zindex
     */
    public void setZindex(Integer zindex) {
        this.zindex = zindex;
    }

    /**
     * @return istype
     */
    public Integer getIstype() {
        return istype;
    }

    /**
     * @param istype
     */
    public void setIstype(Integer istype) {
        this.istype = istype;
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
     * @return icon
     */
    public String getIcon() {
        return icon;
    }

    /**
     * @param icon
     */
    public void setIcon(String icon) {
        this.icon = icon;
    }

    /**
     * @return page
     */
    public String getPage() {
        return page;
    }

    /**
     * @param page
     */
    public void setPage(String page) {
        this.page = page;
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
}