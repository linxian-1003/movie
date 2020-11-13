package com.neu.movie.domain;

import com.neu.movie.base.BaseDomain;
import com.neu.movie.validate.AddGroup;
import com.neu.movie.validate.EditGroup;
import org.hibernate.validator.constraints.NotBlank;


public class Role extends BaseDomain {

    //只有在添加和编辑组有效
    @NotBlank(groups = {AddGroup.class, EditGroup.class},message = "{role.name}")
    private String name;
    private String remark;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
