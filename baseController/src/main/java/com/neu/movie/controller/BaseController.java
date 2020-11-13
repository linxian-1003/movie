package com.neu.movie.controller;

import com.github.pagehelper.PageInfo;
import com.neu.movie.base.BaseDomain;
import com.neu.movie.base.BaseQuery;
import com.neu.movie.exception.ParamException;
import com.neu.movie.service.BaseService;
import com.neu.movie.utils.JsonModel;
import com.neu.movie.utils.StringUtil;
import com.neu.movie.validate.AddGroup;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.ParameterizedType;

public abstract class BaseController<T extends BaseDomain,E extends BaseQuery> {

    BaseService<T,E> baseService;

    protected  Class<T> clazz;
    String modelName;
    public BaseController(){
        //获取泛型
        ParameterizedType parameterized = (ParameterizedType) getClass().getGenericSuperclass();
        //获取第一个泛型的类型
        clazz = (Class<T>) parameterized.getActualTypeArguments()[0];
        modelName = clazz.getSimpleName().toLowerCase();
    }

    
    /**
     * 转发到列表界面
     * @return
     */
    @RequestMapping(value="",method= RequestMethod.GET)
    public String list(){
        return modelName+"/list";
    }

    @RequestMapping(value="",method=RequestMethod.GET,headers = {"X-Requested-With=XMLHttpRequest"})
    @ResponseBody
    public JsonModel list(E query){
        JsonModel jsonModel = new JsonModel();

        PageInfo<T> pageInfo = baseService.findByQuery(query);//根据条件插叙数据

        jsonModel.setResult(true);
        jsonModel.setData(pageInfo.getList());
        jsonModel.setCount((int)pageInfo.getTotal());  //当前条件下记录数
        jsonModel.setMsg("查询成功");
        return jsonModel;
    }


    @RequestMapping(value="{ids}",method=RequestMethod.DELETE,headers = {"X-Requested-With=XMLHttpRequest"})
    @ResponseBody
    public JsonModel delete(@PathVariable("ids") String ids){
        //判断是否为空
        if(StringUtil.isEmpty(ids)){
            throw new ParamException("删除用户参数错误");
        }
        JsonModel jsonModel = new JsonModel();

        //调用service
        String idArray [] = ids.split(",");
        baseService.deleteByIds(idArray);
        jsonModel.setResult(true);
        jsonModel.setMsg("删除成功");
        return jsonModel;
    }

    @RequestMapping(value="addUI",method=RequestMethod.GET)
    public String add(Model model){
        try {
            model.addAttribute(modelName,clazz.newInstance());
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

        beforeSaveUI(model,null);
        return modelName+"/save";
    }


    @RequestMapping(method=RequestMethod.POST)
    public String add(@Validated(AddGroup.class) T t, Errors errors){
        if(errors.hasErrors()){
            return modelName+"/save";
        }
        //调用service
        boolean result =baseService.add(t);
        return "redirect:/"+modelName+"s";
    }

    @RequestMapping(value="{id}/edit",method=RequestMethod.GET)
    public String edit(@PathVariable int id, Model model){
        T t = baseService.findById(id);
        if(t==null){
            throw new ParamException("编辑用户参数异常");
        }
        beforeSaveUI(model,t);
        model.addAttribute(modelName,t);
        return modelName+"/save";
    }

    @RequestMapping(value="{id}",method=RequestMethod.PUT)
    public String edit(T t){
        beforeEdit(t);
        baseService.update(t);
        return "redirect:/"+modelName+"s";
    }

    public abstract T beforeEdit(T t);
    public abstract void beforeSaveUI(Model model,T t);
}