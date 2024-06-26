<!DOCTYPE html>
<html>
<head>
    <title>Employee Tracking System</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<div class="container">
    <h2>Employee Tracking System</h2>
    <div class="buttons">
        <button id="createBtn">Create</button>
    </div>
    <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search for names..">
    <table class="crud-table" id="employeesTable">
        <thead>
            <tr>
                <th>ID Number</th>
                <th>Full Name</th>
                <th>Age</th>
                <th>Address</th>
                <th>Phone Number</th>
                <th>Course</th>
                <th>Date of Graduation</th>
                <th>Job Name</th>
                <th>Job Industry</th>
                <th>Salary</th>
                <th>Date Hired</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <!-- Dynamic Content Here -->
        </tbody>
    </table>
</div>

<!-- Create Modal -->
<div id="createModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Create Record</h2>
        <form id="createForm">
            <label for="emp_id">ID Number:</label><br>
            <input type="text" id="emp_id" name="emp_id"><br>
            <label for="full_name">Full Name:</label><br>
            <input type="text" id="full_name" name="full_name"><br>
            <label for="age">Age:</label><br>
            <input type="text" id="age" name="age"><br>
            <label for="address">Address:</label><br>
            <input type="text" id="address" name="address"><br>
            <label for="cp_no">Contact Number:</label><br>
            <input type="text" id="cp_no" name="cp_no"><br>
            <label for="course">Course:</label><br>
            <input type="text" id="course" name="course"><br>
            <label for="date_grad">Date of Graduation:</label><br>
            <input type="date" id="date_grad" name="date_grad"><br>
            <label for="job_name">Job Name:</label><br>
            <input type="text" id="job_name" name="job_name"><br>
            <label for="job_industry">Job Industry:</label><br>
            <input type="text" id="job_industry" name="job_industry"><br>
            <label for="salary">Salary:</label><br>
            <input type="text" id="salary" name="salary"><br>
            <label for="date_hired">Date Hired:</label><br>
            <input type="date" id="date_hired" name="date_hired"><br><br>
            <button type="button" onclick="createRecord()">Create</button>
        </form>
    </div>
</div>

<!-- Update Modal -->
<div id="updateModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Update Record</h2>
        <form id="updateForm">
            <input type="hidden" id="update_id" name="emp_id">
            <label for="update_full_name">Full Name:</label><br>
            <input type="text" id="update_full_name" name="full_name"><br>
            <label for="update_age">Age:</label><br>
            <input type="text" id="update_age" name="age"><br>
            <label for="update_address">Address:</label><br>
            <input type="text" id="update_address" name="address"><br>
            <label for="update_cp_no">Contact Number:</label><br>
            <input type="text" id="update_cp_no" name="cp_no"><br>
            <label for="update_course">Course:</label><br>
            <input type="text" id="update_course" name="course"><br>
            <label for="update_date_grad">Date of Graduation:</label><br>
            <input type="date" id="update_date_grad" name="date_grad"><br>
            <label for="update_job_name">Job Name:</label><br>
            <input type="text" id="update_job_name" name="job_name"><br>
            <label for="update_job_industry">Job Industry:</label><br>
            <input type="text" id="update_job_industry" name="job_industry"><br>
            <label for="update_salary">Salary:</label><br>
            <input type="text" id="update_salary" name="salary"><br>
            <label for="update_date_hired">Date Hired:</label><br>
            <input type="date" id="update_date_hired" name="date_hired"><br><br>
            <button type="button" onclick="updateRecord()">Update</button>
        </form>
    </div>
</div>

<script src="js/script.js"></script>
</body>
</html>
