<%@page import="java.util.Arrays"%>
<%@page import="com.ems.model.Schedule" %>
<%@page import="com.ems.model.Employee" %>
<%@page import="com.ems.model.RestaurantManager" %>
<%@page import="com.ems.dao.ManagerDAO" %>
<%@page import="com.ems.dao.ManagerDAOImpl" %>
<%@page import="com.ems.dao.EmployeeScheduleDAO" %>
<%@page import="com.ems.dao.EmployeeScheduleDAOImpl" %>
<%@page import="com.ems.dao.EmployeeDAO" %>
<%@page import="com.ems.dao.EmployeeDAOImpl" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern, accounts, invoice, html5, responsive, CRM, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Schedule</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.png">
    <link rel="stylesheet" href="bootstrap.min.css">
    <link rel="stylesheet" href="font-awesome.min.css">
    <link rel="stylesheet" href="line-awesome.min.css">
    <link rel="stylesheet" href="select2.min.css">
    <link rel="stylesheet" href="bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="bootstrap-tagsinput/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="css/create-schedule.css">
    <script>
        function validateForm() {
            var checkboxes = document.getElementsByClassName('list-employee');
            var isChecked = false;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isChecked = true;
                    break;
                }
            }
            if (!isChecked) {
                alert("Please select at least one employee.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="main-wrapper">
        <nav>
            <div class="page-title-box-1"> 
                <h3>REZEKY TOMYAM</h3>
            </div>
            <ul>
                <li><a href="main_manager.jsp">Home</a></li>
                <li><a href="report_update.jsp">Report</a></li>
                <li><a href="manage_schedule_main.jsp">Schedule</a></li>
                <li><a href="welcome.html">Log Out</a></li>
            </ul>
        </nav>
        <main>
            <section class="employee-schedule">
                <%
                    
                    RestaurantManager manager = (RestaurantManager) session.getAttribute("managerLog");
                    ManagerDAO managerDAO = new ManagerDAOImpl();
                    int branchID = managerDAO.getRestaurantManagerBranchId(manager);
                    
                    EmployeeDAO employeeDAO = new EmployeeDAOImpl();
                    Employee[] employees = employeeDAO.getAllEmployeeByBranch(branchID);
                    
                    EmployeeScheduleDAO employeeScheduleDAO = new EmployeeScheduleDAOImpl();
                    
                    
                %>
                <form action="manage_schedule.do" method="post" onsubmit="return validateForm()">
                    <label for="">Date Begin:-</label>
                    <input type="date" name="scheduleDate"  required> <br> <br>
                    <label for="">Start Shift:-</label>
                    <input type="time" name="startShift"  required> <br> <br>
                    <label for="">End Shift</label>
                    <input type="time" name="endShift"  required> <br> <br>

                    <p>Select Employee:-</p>
                    <ul>
                        <%
                            for (Employee employee : employees) {
                                if (employee.getEmployeeStatus()) { // Check if EmployeeStatus is true
                        %>
                        <li>
                            <input type="checkbox" name="list-employee" class="list-employee" value="<%=employee.getEmployeeID()%>" >
                            <label for=""><%=employee.getEmployeeID()%> <%=employee.getEmployeeName()%></label>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>

                    <br>
                    <input type="hidden" name="action" value="createSchedule">
                    <input name="save" type="submit" value="Create">
                </form>
                <a href="manage_schedule_main.jsp" class="back-link">Back</a><br><br>
            </section>
        </main>
    </div>
</body>
</html>