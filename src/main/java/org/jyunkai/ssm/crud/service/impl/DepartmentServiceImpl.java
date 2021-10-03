package org.jyunkai.ssm.crud.service.impl;

import org.jyunkai.ssm.crud.bean.Department;
import org.jyunkai.ssm.crud.dao.DepartmentMapper;
import org.jyunkai.ssm.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
