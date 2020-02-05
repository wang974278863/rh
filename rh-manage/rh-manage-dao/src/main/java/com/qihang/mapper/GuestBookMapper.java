package com.qihang.mapper;

import com.qihang.pojo.GuestBook;
import com.qihang.pojo.GuestBookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GuestBookMapper {
    int countByExample(GuestBookExample example);

    int deleteByExample(GuestBookExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(GuestBook record);

    int insertSelective(GuestBook record);

    List<GuestBook> selectByExample(GuestBookExample example);

    GuestBook selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") GuestBook record, @Param("example") GuestBookExample example);

    int updateByExample(@Param("record") GuestBook record, @Param("example") GuestBookExample example);

    int updateByPrimaryKeySelective(GuestBook record);

    int updateByPrimaryKey(GuestBook record);
}