package org.jyunkai.ssm.crud.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.jyunkai.ssm.crud.bean.Department;
import org.jyunkai.ssm.crud.bean.Employee;
import org.jyunkai.ssm.crud.dao.DepartmentMapper;
import org.jyunkai.ssm.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;

import java.util.UUID;

@SpringJUnitConfig(locations = "classpath:applicationContext.xml")
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;


    @Test
    public void testMapper() {
        //新增部门信息
        departmentMapper.insertSelective(new Department(null, "开发部"));
        departmentMapper.insertSelective(new Department(null, "测试部"));

        //插入一条员工数据
        employeeMapper.insertSelective(new Employee(null, "张三", "M", "zhangsan@qq.com", 1));
        employeeMapper.insertSelective(new Employee(null, "李四", "M", "lisi@163.com", 1));
        employeeMapper.insertSelective(new Employee(null, "王五", "M", "wangwu@sina.com", 1));

        //批量插入员工数据
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 100; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null, uid, "W", uid + "@gmail.com", 2));
        }
    }
}
