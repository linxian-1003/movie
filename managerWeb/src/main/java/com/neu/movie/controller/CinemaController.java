package com.neu.movie.controller;

import com.neu.movie.domain.Area;
import com.neu.movie.domain.Cinema;
import com.neu.movie.query.AreaQuery;
import com.neu.movie.query.CinemaQuery;
import com.neu.movie.service.AreaService;
import com.neu.movie.service.CinemaService;
import com.neu.movie.utils.StringUtil;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("cinemas")
public class CinemaController extends BaseController<Cinema,CinemaQuery>{

    @Autowired
    AreaService areaService;

    @Autowired
    public void setCinemaService(CinemaService cinemaService){
        this.baseService = cinemaService;
    }

    @Override
    public Cinema beforeEdit(Cinema cinema) {
        return cinema;
    }

    @Override
    public void beforeSaveUI(Model model, Cinema cinema) {
        AreaQuery areaQuery =  new AreaQuery();
        areaQuery.setPaging(false);
        List<Area> provinces = areaService.findByQuery(areaQuery).getList();
        model.addAttribute("provices",provinces);
    }


    @RequestMapping("export")
    public void export(HttpServletResponse response) throws IOException {

        //生成Excel
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet= workbook.createSheet("电影院数据");


        HSSFCellStyle style= workbook.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER);
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        HSSFRow headerRow = sheet.createRow(0);

        HSSFCell idCell =headerRow.createCell(0);
        idCell.setCellStyle(style);

        idCell.setCellValue("主键");
        HSSFCell nameCell =headerRow.createCell(1);
        nameCell.setCellValue("名称");
        nameCell.setCellStyle(style);

        CinemaQuery cinemaQuery = new CinemaQuery();
        cinemaQuery.setPaging(false);
        List<Cinema> cinemas = this.baseService.findByQuery(cinemaQuery).getList();

        int size = cinemas.size();
        for(int i=0;i<size;i++){
            HSSFRow dataRow = sheet.createRow(i+1);

            HSSFCell idDataCell =dataRow.createCell(0);
            idDataCell.setCellValue(cinemas.get(i).getId());
            idDataCell.setCellStyle(style);

            HSSFCell nameDataCell =dataRow.createCell(1);
            nameDataCell.setCellValue(cinemas.get(i).getName());
            nameDataCell.setCellStyle(style);
        }

        //设置响应头
        response.addHeader("content-disposition","attachment;filename="+ URLEncoder.encode(StringUtil.formateDate(new Date(),"yyyy年MM月dd日"),"utf-8")+".xls");
        workbook.write(response.getOutputStream());
    }
}
