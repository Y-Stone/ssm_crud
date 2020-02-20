<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    /*将项目的根路径/ssm_crud/存入*/
    pageContext.setAttribute("APP_PATH", request.getContextPath());

%>
<html>
<head>
    <title>首页</title>
    <!--引入bootstrap和jquery，注意顺序问题-->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <script src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="application/javascript"></script>
</head>
<body>
<!-- 修改用户模态框Modal -->
<div class="modal fade" id="update_emp_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
            </div>
        </div>
    </div>
</div>
<!-- 添加用户模态框Modal -->
<div class="modal fade" id="add_emp_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId">
                            </select>
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
<!--设计list页面-->
<div class="container">
    <!--标题-->
    <div class="row">
        <!--占12列-->
        <div class="col-md-12"><h1>SSM_CRUD</h1></div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="addEmp_btn">
                <span class="glyphicon glyphicon glyphicon-ok" aria-hidden="true"/>新增
            </button>
            <button class="btn btn-danger" id="delEmp_btn">
                <span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true"/>删除
            </button>
        </div>
    </div>
    <!--表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all"/></th>
                        <th>empId</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <!--分页操作-->
    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-6" id="build_page_nav"></div>
    </div>
</div>


<script type="text/javascript">

    /*总记录数*/
    var totalRecord;
    /*当前页面*/
    var currentPage;
    $(function () {
        //加载完页面跳转第一页
        toPage(1);
    })

    function toPage(pageNum) {
        /*发送ajax请求，跳转页面*/
        $.ajax({
            url: "${APP_PATH}/emps",
            data: "pn=" + pageNum,
            type: "GET",
            success: function (result) {
                //1、解析并显示员工数据
                build_emps_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }


    function build_emps_table(result) {
        //清空员工数据表格
        $("#emps_table tbody").empty();
        //解析并显示员工数据
        //遍历每条结果
        var emps = result.map.pageInfo.list;
        $.each(emps, function (index, item) {
            /*插入每条数据到tbody*/
            var checkTd = $("<td><input type='checkbox' class='check_item'/> </td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == 'M' ? '男' : '女');
            var emailTd = $("<td></td>").append(item.email);
            var departmentNameTd = $("<td></td>").append(item.department.deptName);
            var eidtBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon glyphicon-pencil")).append("编辑");

            /*编辑按钮绑定员工 id属性，方便后期获取*/
            eidtBtn.attr("edit-id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon glyphicon-remove")).append("删除");
            delBtn.attr("del-id", item.empId);

            var btnTd = $("<td></td>").append(eidtBtn).append("  ").append(delBtn);
            /*插入tbody*/
            $("<tr></tr>").append(checkTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd)
                .append(departmentNameTd).append(btnTd).appendTo("#emps_table tbody");
        });

    }

    function build_page_info(result) {
        //构建分页信息
        /*清除上次构建的分页信息*/
        $("#page_info_area").empty();
        /*解析并显示分页信息*/
        var info = result.map.pageInfo;
        $("#page_info_area").append("当前" + info.pageNum + "页,总 " + info.pages + "页,总 " + info.total + "条记录");
        totalRecord = info.total;
        currentPage = info.pageNum;
    }


    function build_page_nav(result) {
        //构建分页条
        /*清除上次构建的分页条*/
        $("#build_page_nav").empty();
        //3、解析显示分页条数据,构造导航条
        var info = result.map.pageInfo;

        /*前一页*/
        var prePageLi = $("<li></li>").append(
            //li标签里面添加a标签
            $("<a></a>").attr("href", "#").attr("aria-label", "Previous").append
            //a标签里面添加span标签
            ($("<span></span>").attr("aria-hidden", "true").append("&laquo;"))
        );
        /*下一页*/
        var nextPageLi = $("<li></li>").append(
            //li标签里面添加a标签
            $("<a></a>").attr("href", "#").attr("aria-label", "Next").append
            //a标签里面添加span标签
            ($("<span></span>").attr("aria-hidden", "true").append("&raquo;"))
        );
        /*构建首页*/
        /*<li><a href="#">1</a></li>*/
        var firstPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("首页"));
        /*尾页*/
        var lastPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("尾页"));

        /*对当前页为第一页或最后一页进行处理*/
        if (info.hasPreviousPage == false) {
            /*没有前一页就禁用首页和前一页*/
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            /*绑定点击事件*/
            prePageLi.click(function () {
                toPage(info.pageNum - 1);
            });
            firstPageLi.click(function () {
                toPage(1);
            });
        }
        if (info.hasNextPage == false) {
            /*没有下一页就禁用最后一页和尾页*/
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                toPage(info.pageNum + 1);
            });
            lastPageLi.click(function () {
                toPage(info.pages);
            });
        }
        var ul = $("<ul></ul>").addClass("pagination");
        //插入首页、前一页
        ul.append(firstPageLi).append(prePageLi);
        /*构建分页条的具体页数*/
        /*显示的每一页*/
        $.each(info.navigatepageNums, function (index, item) {
            /*遍历数组*/
            if(item == currentPage){
                //分页条的当前页不可以点击
                var pageLi = $("<li class='active'></li>").append($("<a></a>").attr("href", "#").append(item));
            }else{
                var pageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append(item));
                /*绑定点击事件，跳转*/
                pageLi.click(function () {
                    toPage(item);
                })
            }
            ul.append(pageLi);
        });
        //插入下一页和尾页
        ul.append(nextPageLi).append(lastPageLi);
        /*构建nav*/
        $("<nav></nav>").attr("aria-labe", "Page navigation").append(ul).appendTo($("#build_page_nav"));
    }

    /*点击新增按钮弹出模态框*/
    $("#addEmp_btn").click(function () {
        /*清空表单数据*/
        // $("#add_emp_model form")[0].reset();
        reset_form("#add_emp_model form");
        //发送ajax请求，查出部门信息，显示在下拉列表中
        getDepts("#add_emp_model select");

        //点击模态框旁边区域不退出模态框
        $("#add_emp_model").modal({backgrop: "static"});

    });

    /*清除表单所有样式*/
    function reset_form(ele) {
        /*清除数据*/
        $(ele)[0].reset();
        /*清除样式*/
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    /*发送ajax请求获取所有部门信息，并添加到模态框中*/
    function getDepts(ele) {
        /*清空下拉列表*/
        $(ele).empty();
        $.ajax({
            url: "${APP_PATH}/getDeparts",
            type: "GET",
            success: function (result) {
                /*{"code":100,"message":"操作成功！","map":{"departments":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}*/
                $.each(result.map.departments, function (index, item) {
                    var option = $("<option ></option>").append(item.deptName).attr("value", item.deptId);
                    $(ele).append(option);
                })
            }
        });
    }
    function validate_add_form() {
        /*校验表单数据*/
        /*校验名字和邮箱*/
        var empName = $("#empName_add_input").val();
        var regName = /^[a-zA-Z0-9_-]{6,16}$|(^[\u2E80-\u9FFF]{2,5})/;
        if (!regName.test(empName)) {
            // $("#empName_add_input").parent().addClass("has-error");
            // $("#empName_add_input").next("span").append("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            // alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            show_validate_msg("#empName_add_input", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        } else {
            // $("#empName_add_input").parent().addClass("has-success");
            // $("#empName_add_input").next("span").append("");
            show_validate_msg("#empName_add_input", "success", "");
        }
        var empEmail = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(empEmail)) {
            // alert("邮箱格式不正确");
            // $("#email_add_input").parent().addClass("has-error");
            // $("#email_add_input").next("span").append("邮箱格式不正确");
            show_validate_msg("#email_add_input", "error", "邮箱格式不正确");
            return false;
        } else {
            // $("#email_add_input").parent().addClass("has-success");
            // $("#email_add_input").next("span").append("");
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }

    /*封装添加用户模态框校验状态*/
    function show_validate_msg(ele, status, msg) {
        //清空校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").append(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").append(msg);
        }
    }

    /*校验用户名是否有效*/
    $("#empName_add_input").change(function () {
        var userName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkUser",
            type: "POST",
            data: "userName=" + userName,
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName_add_input", "success", result.map.msg);
                    //给保存按钮设置属性，判断是否可以保存
                    $("#emp_save_btn").attr("ajax-va", "success");
                } else if (result.code == 200) {
                    show_validate_msg("#empName_add_input", "error", result.map.msg);
                    $("#emp_save_btn").attr("ajax-va", "error");
                }
            }
        });
    });
    /*点击保存按钮新增员工信息*/
    $("#emp_save_btn").click(function () {

        /*前端校验表单数据*/
        if (!validate_add_form()) {
            return false;
        }

        /*根据ajax-va属性判断是否可以保存*/
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }
        /*获取表单数据*/
        var formMsg = $("#add_emp_model form").serialize();
        /*发送ajax请求*/
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: formMsg,
            success: function (result) {
                if (result.code == 100) {
                    alert("保存成功!");
                    /*关闭模态框*/
                    $("#add_emp_model").modal("hide");
                    /*跳转至最后一页*/
                    //设置跳转至总记录数，因为总记录数>=总页数，pageHelper会跳转至最后一页，前提pageHelper设置了reasonable属性
                    toPage(totalRecord);
                } else if (result.code == 200) {
                    //报错
                    if (undefined != result.map.errorFields.empName) {
                        show_validate_msg("#empName_add_input", "error", result.map.errorFields.empName);
                    }
                    if (undefined != result.map.errorFields.email) {
                        show_validate_msg("#email_add_input", "error", result.map.errorFields.email);
                    }
                }
            }
        });
    })

    /*根据员工id获取员工信息*/
    function getEmpById(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "GET",
            success: function (result) {
                // alert(result);
                //回显数据
                var empData = result.map.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                /*性别单选框回显*/
                $("#update_emp_model input[name=gender]").val([empData.gender]);
                $("#update_emp_model select").val([empData.dId]);
            }
        });
    }

    /*编辑按钮绑定点击事件*/
    $(document).on("click", ".edit_btn", function () {
        //
        //查询所有部门信息
        getDepts("#update_emp_model select");
        //查询对应用户信息
        getEmpById($(this).attr("edit-id"));
        //给修改按钮绑定员工id
        $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
        //弹出模态框
        $("#update_emp_model").modal({backgrop: "static"});

    });


    /*编辑用户信息*/
    $("#emp_update_btn").click(function () {
        //校验邮箱信息
        var empEmail = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(empEmail)) {
            show_validate_msg("#email_update_input", "error", "邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }
        //发送ajax请求
        $.ajax({
            url: "${APP_PATH}/emp/" + $(this).attr("edit-id"),
            type: "PUT",
            data: $("#update_emp_model form").serialize(),
            success: function (result) {
                // alert(result.message);

                //关闭模态框

                $("#update_emp_model").modal("hide");
                //跳转至对应页面
                toPage(currentPage);
            }

        });
    })

    /*删除按钮绑定点击事件*/
    $(document).on("click", ".delete_btn", function () {
        var empId = $(this).attr("del-id");
        //获取名字
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除" + empName + "吗？")) {
            $.ajax({
                url: "${APP_PATH}/emp/" + empId,
                type: "DELETE",
                success: function (result) {
                    alert(result.message);
                    toPage(currentPage);
                }
            });
        }
    })

    /*实现全选/全不选*/
    $("#check_all").click(function () {
        /*prop获取或操作标签的原生属性*/
        // alert($(this).prop("checked"));
        $(".check_item").prop("checked", $(this).prop("checked"));
    })
    $(document).on("click", ".check_item", function () {
        var checked_length = $(".check_item:checked").length;
        if (checked_length == $(".check_item").length) {
            //如果全部单选框都选择了，等同于点击全选框
            $("#check_all").prop("checked", true);
        } else {
            $("#check_all").prop("checked", false);
        }
    })
    $("#delEmp_btn").click(function () {
        /*批量删除*/
        // 判断是否有选中
        var length = $(".check_item:checked").length;
        if (length <= 0) {
            alert("目前没有被选择删除的记录");
        } else {
            /*获取所有被选择的记录*/
            var empNames = "";
            var checkIds = "";
            $.each($(".check_item:checked"), function () {
                empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
                checkIds += $(this).parents("tr").find("td:eq(1)").text() + "-";
            });
            empNames = empNames.substring(0, empNames.length - 1);
            checkIds = checkIds.substring(0, checkIds.length - 1);
            if (confirm("确认要删除【" + empNames + "】吗?")) {
                $.ajax({
                    url: "${APP_PATH}/emp/" + checkIds,
                    type: "DELETE",
                    success: function (result) {
                        alert(result.message);
                        //更新页面
                        toPage(currentPage);
                    }
                });
            }
        }
    })
</script>
</body>
</html>
