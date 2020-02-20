package cn.stone.dao;

import cn.stone.domain.Employee;
import cn.stone.domain.EmployeeExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * 员工dao接口
 */
public interface EmployeeMapper {

    /**
     * @param example 查询条件
     * @return 对应条数
     */
    long countByExample(EmployeeExample example);

    /**
     * @param example 查询对象
     * @return 对应条数
     */
    int deleteByExample(EmployeeExample example);

    /**
     * @param empId 员工主键id
     * @return 影响条数
     */
    int deleteByPrimaryKey(Integer empId);

    /**
     * @param record 员工对象
     * @return 影响条数
     */
    int insert(Employee record);

    /**
     * 只插入非空字段
     *
     * @param record 员工对象
     * @return 影响条数
     */
    int insertSelective(Employee record);

    /**
     * 返回符合条件的所有对象
     * @param example 条件
     * @return 返回符合条件的所有对象
     */
    List<Employee> selectByExample(EmployeeExample example);

    /**
     * @param empId 主键id
     * @return 对应主键的对象
     */
    Employee selectByPrimaryKey(Integer empId);

    /**
     * 同selectByExample，加入了员工对应部门的详细信息
     * @param example
     * @return
     */
    List<Employee> selectByExampleWithDept(EmployeeExample example);


    /**
     * selectByPrimaryKey，加入了员工对应部门的详细信息
     * @param empId
     * @return
     */
    Employee selectByPrimaryKeyWithDept(Integer empId);

    /**
     * 有选择的更新字段，更新非空字段
     * @param record
     * @param example
     * @return
     */
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    /**
     * 全字段更新
     * @param record
     * @param example
     * @return
     */
    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    /**有选择的更新主键id对应的字段，更新非空字段
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Employee record);

    /**无选择的更新主键id对应的字段，更新全部字段
     * @param record
     * @return
     */
    int updateByPrimaryKey(Employee record);
}