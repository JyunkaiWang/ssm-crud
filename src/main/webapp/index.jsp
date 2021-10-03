<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
    <link href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <title>首页</title>
</head>
<body>
<!--修改员工信息的模态框-->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="xxx@xxx.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <!--传送部门id即可-->
                            <select class="form-control" name="dId" id="dept_update_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 新增员工信息的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="xxx">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="W"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="xxx@xxx.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <!--传送部门id即可-->
                            <select class="form-control" name="dId" id="dept_add_select"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 搭建显示页面 -->
<div class="container">
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>

    <!-- 添加与删除员工的按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>

    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"> 全选
                    </th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息 -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>

<!--JS代码-->
<script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

    /**
     * 定义全局变量，用来保存总页数，当前页数
     */
    let totalPages, currentPage;

    /**
     * 页面加载完成以后直接去首页
     */
    $(function () {
        //去首页
        to_page(1);
    });

    /**
     * 发送Ajax请求，跳转页面
     */
    function to_page(pn) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                //1、解析并显示员工的数据
                build_emps_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析并显示分页条
                build_page_nav(result);
            }
        });
    }

    /**
     * 显示员工数据表
     */
    function build_emps_table(result) {
        //先清空表格之前的数据
        $("#emps_table tbody").empty();
        //然后添加数据
        let emps = result.data.pageInfo.list;
        $.each(emps, function (index, item) {
            let checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            let empIdTd = $("<td></td>").append(item.empId);
            let empNameTd = $("<td></td>").append(item.empName);
            let genderTd = $("<td></td>").append(item.gender == 'M' ? "男" : "女");
            let emailTd = $("<td></td>").append(item.email);
            let deptNameTd = $("<td></td>").append(item.department.deptName);
            let editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id", item.empId);
            let delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.empId);
            let btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //append方法执行完成以后还是会返回原来的元素
            $("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd)
                .append(deptNameTd).append(btnTd).appendTo("#emps_table tbody");
        });
    }

    /**
     * 解析显示分页信息
     */
    function build_page_info(result) {
        //首先清空之前的数据
        $("#page_info_area").empty();
        //然后添加数据
        $("#page_info_area").append("当前第 " + result.data.pageInfo.pageNum + " 页，总共 "
            + result.data.pageInfo.pages + " 页，总计 " + result.data.pageInfo.total + " 条记录");
        totalPages = result.data.pageInfo.pages;
        currentPage = result.data.pageInfo.pageNum;
    }

    /**
     * 解析显示分页条
     */
    function build_page_nav(result) {
        //先清空分页条数据
        $("#page_nav_area").empty();
        //添加首页和前一页
        let ul = $("<ul></ul>").addClass("pagination");
        let firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        let prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        //如果已经是首页，则禁用首页和前一页
        if (result.data.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加翻页点击事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.data.pageInfo.pageNum - 1)
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        //添加页码提示
        $.each(result.data.pageInfo.navigatepageNums, function (index, item) {
            let numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.data.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            //绑定单击事件，去指定页
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页
        let nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        let lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        //如果已经是末页，则禁用下一页和末页
        if (result.data.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            //为元素添加翻页点击事件
            nextPageLi.click(function () {
                to_page(result.data.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.data.pageInfo.pages);
            });
        }
        ul.append(nextPageLi).append(lastPageLi);
        let navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    /**
     * 重置表单的内容和样式
     */
    function reset_form(ele) {
        //拿到DOM对象，调用reset方法，清空内容
        $(ele)[0].reset();
        //清空样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    /**
     * 点击新增按钮，弹出模态框
     */
    $("#emp_add_modal_btn").click(function () {
        //1、先调用方法重置表单
        reset_form("#empAddModal form");
        //2、再调用方法查部门信息
        getDepts("#dept_add_select");
        //3、弹出模态框
        $("#empAddModal").modal({
            //点击背景不会消失
            backdrop: "static"
        })
    });

    /**
     * 发送 Ajax 请求，查处部门信息，显示在下拉列表中
     */
    function getDepts(ele) {
        //先清空下拉列表的值，再发送请求
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/depts",
            type: "GET",
            success: function (result) {
                $.each(result.data.depts, function () {
                    let optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        })
    }

    /**
     * 显示校验结果的提示信息
     */
    function show_validate_msg(ele, status, msg) {
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    /**
     * 前端 jQuery 校验表单数据是否合法（使用正则表达式）
     */
    function validate_add_form() {
        //1、校验姓名
        let empName = $("#empName_add_input").val();
        let regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input", "error", "用户名必须是2-5位中文或者6-16位英文和数字的组合");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }
        //2、校验邮箱
        let email = $("#email_add_input").val();
        let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }

    /**
     * 校验用户名是否重复
     */
    $("#empName_add_input").change(function () {
        $.ajax({
            url: "${APP_PATH}/checkUser",
            data: "empName=" + this.value,
            type: "GET",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName_add_input", "success", "用户名可用");
                    $("#emp_save_btn").attr("ajax-va", "success");
                } else {
                    show_validate_msg("#empName_add_input", "error", result.data.va_msg);
                    $("#emp_save_btn").attr("ajax-va", "error");
                }
            }
        })
    });

    /**
     * 新增用户数据，点击保存按钮
     */
    $("#emp_save_btn").click(function () {
        //1、前端 jQuery 校验数据格式
        if (!validate_add_form()) {
            return false;
        }
        //2、校验用户名是否可用
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }
        //3、发送 Ajax POST 请求保存新增员工信息
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    //保存成功，关闭模态框，来到最后一页
                    $("#empAddModal").modal('hide');
                    to_page(totalPages + 1);
                } else {
                    //显示失败信息，有哪个字段的错误信息就显示哪个字段的；
                    if (undefined != result.data.errorFields.email) {
                        //显示邮箱错误信息
                        show_validate_msg("#email_add_input", "error", result.data.errorFields.email);
                    }
                    if (undefined != result.data.errorFields.empName) {
                        //显示员工名字的错误信息
                        show_validate_msg("#empName_add_input", "error", result.data.errorFields.empName);
                    }
                }
            }
        });
    });

    /**
     * 根据id查询员工信息，用于数据回显
     */
    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "GET",
            success: function (result) {
                let empData = result.data.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#dept_update_select").val([empData.dId]);
            }
        })
    }

    /**
     * 点击编辑按钮，回显数据，弹出模态框
     */
    $(document).on("click", ".edit_btn", function () {
        //1、查询部门和员工的信息，回显
        getDepts("#dept_update_select");
        getEmp($(this).attr("edit-id"));
        //2、把员工的id传递给模态框的更新按钮
        $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
        //2、弹出模态框
        $("#empUpdateModal").modal({
            backdrop: "static"
        })
    });

    /**
     * 点击更新按钮，更新用户信息
     */
    $("#emp_update_btn").click(function () {
        //1、校验邮箱是否合法
        let email = $("#email_update_input").val();
        let regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }
        //2、发送 Ajax 请求更新员工信息
        $.ajax({
            url: "${APP_PATH}/emp/" + $(this).attr("edit-id"),
            type: "PUT",
            data: $("#empUpdateModal form").serialize(),
            success: function (result) {
                //关闭对话框，回到本页面
                $("#empUpdateModal").modal('hide');
                to_page(currentPage);
            }
        });
    });

    /**
     * 点击单个删除按钮，弹出提示框
     */
    $(document).on("click", ".delete_btn", function () {
        //1、弹出提示框
        let empName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除【 " + empName + " 】吗？")) {
            //确认，发送 Ajax 请求删除即可
            $.ajax({
                url: "${APP_PATH}/emp/" + $(this).attr("del-id"),
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    });

    /**
     * 全选，全不选按钮
     */
    $("#check_all").click(function () {
        //dom 原生的属性用 prop 获取，自定义的属性用 attr 获取
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    /**
     * 全选效果联动
     */
    $(document).on("click", ".check_item", function () {
        let flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    /**
     * 点击全部删除按钮，实现批量删除功能
     */
    $("#emp_delete_all_btn").click(function () {
        let empNames = "";
        let del_idstr = "";
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装员工id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去除empNames多余的","
        empNames = empNames.substring(0, empNames.length - 1);
        //去除删除的id多余的"-"
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        if (confirm("确认删除【" + empNames + "】吗？")) {
            //发送 ajax 请求删除
            $.ajax({
                url: "${APP_PATH}/emp/" + del_idstr,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg);
                    //回到当前页面
                    to_page(currentPage);
                }
            });
        }
    });

</script>
</body>
</html>
