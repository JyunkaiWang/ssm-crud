package org.jyunkai.ssm.crud.service;

import org.jyunkai.ssm.crud.bean.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> getAll();

    void saveEmp(Employee employee);

    Boolean checkUser(String empName);

    Employee getEmp(Integer empId);

    void updateEmp(Employee employee);

    void deleteEmpById(Integer empId);

    void deleteBatch(List<Integer> ids);
}
