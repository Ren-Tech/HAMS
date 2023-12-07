<?php include 'topbar.php' ?>
<?php include 'navbar.php' ?>

<?php
//insert report
if(isset($_POST['btnSave'])){
	$subject = $_POST['subject'];
	$schedule = $_POST['schedule'];
	

	$insert_data = mysqli_query($conn, "INSERT INTO student_subject (subject,schedule) 
	VALUES ('$subject','$schedule')");

	if($insert_data){
		header('Location:student subject.php?message=successadd');
	}else{
		echo "Failed to Save User Details" .mysqli_connect_errno();
	}
}
?>

<?php
// update report
if(isset($_POST['btnUpdate'])){
	$id = $_POST['id'];
	$subject = $_POST['subject'];
	$schedule = $_POST['schedule'];
	

	mysqli_query($conn, "UPDATE student_subject SET name= subject='$subject', section_strand='$section_strand', grade_level='$grade_level', schedule='$schedule', grade_level='$grade_level' WHERE user_id=$id");
	header('location: student subject.php?message=successupdate');	
}
?>


<?php
//delete report
if(isset($_GET['delete'])){
	$id = $_GET['delete'];
	mysqli_query($conn, "DELETE FROM student_subject WHERE id=$id");
	header('location: student subject.php?message=successdelete');
}
?>


<!DOCTYPE html>
<html>
<head>
	<meta charset= "UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Users</title>
	<link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" 
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	 integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<style type="text/css">
	
		body{
		color:#566787;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
		font-size: 13px;
	}
	.table-wrapper{
		background: #fff;
		padding: 10px 15px;
		margin: 30px;
		border-radius: 3px;
		box-shadow: 0 1px 1px rgba(0,0,0,.05);
	}.table-title{
		padding-bottom: 15px;
		background: (linear-gradient(to right), #808080, #56A5EC);
		color: #000000;
		padding: 16px 30px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
	}
	.table-title h2{
		margin: 5px 0 0;
		font-size: 24px;
	}
	.delete{
		color: red;
	}
	</style>
  </head>
<body>
	<div class="container" style="margin-top: 15px">
		<a href="#addNewReportModal" class="btn btn-success btn-lg" data-toggle="modal"><span>Add Subject</span></a>
	</div>
	<div class="container">
		<!-- GET MESSAGE IF SUCCESS NA!-->
		<?php if(isset($_GET['message'])): ?>
			<div class="alert alert-success text-center" role="alert" id="alert">
				<?php 
				if($_GET['message'] == "successadd"){
					echo "Successfully Added Report";
				}elseif($_GET['message'] == "successupdate"){
					echo "Successfully Updated Report";	
				}elseif ($_GET['message'] == "successdelete") {
					echo "Successfully Deleted Report";
				}
				?>
			</div>
		<?php endif ?>	
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2><b>Student Subject</b></h2>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th> ID</th>
						<th> Subject</th>
						<th> Schedule</th>
						<th> Action</th>
					</tr>
				</thead>
				<?php
					$select_data = mysqli_query($conn, "SELECT * FROM student_subject");
					while($user= mysqli_fetch_array($select_data)){
				?>
				<tbody>
					<tr>
						<td class="id"><?php echo $user['id']?></td>
						<td class="subject"><?php echo $user['subject']?></td>
						<td class="schedule"><?php echo $user['schedule']?></td>
						<td>
							<a href="#"class="edit" id="btnEditmodal"name="btnEditmodal" data-toggle="modal"
							><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="student subject.php?delete=<?php echo $user ['id']?>"class="delete" onclick="return confirm ('Are you sure you want to delete this user?')" name="btnDelete"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i
							></a>
						</td>
					</tr>
				</tbody>
				<?php } ?>
			</table>
		</div>
	</div>

	<!-- add new report modal-->
	<div id="addNewReportModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" action="#">
					<div class="modal-header">
						<h4 class="modal-title">Add Subject</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</
						button>
						</div>
					<div class="modal-body">
					<div class="form-group">
							<label>Subject</label>
							<textarea name="subject" class="form-control" required></textarea>
						</div>
						<div class="form-group">
							<label>Schedule</label>
							<textarea name="schedule" class="form-control" required></textarea>
						</div>
					</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-default" data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-success" name="btnSave">Save</button>
						</div>
					</form> 
				</div>      
			</div>
		</div>
	<!-- edit Report modal-->
	<div id="editReportModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" action="#">
					<div class="modal-header">
						<h4 class="modal-title">Edit subject</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">Close</button>
						</div>
					<div class="modal-body">
					<div class="form-group">
							<label>Subject</label>
							<input type="text" id="subject" name="subject" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Section and Strand</label>
							<input type="hidden" id="id" name="id" class="form-control" required>
							<input type="text" id="section_strand" name="section_strand" class="form-control" required>
						</div>
                        <div class="form-group">
							<label>Grade Level</label>
							<input type="hidden" id="id" name="id" class="form-control" required>
							<input type="text" id="grade_level" name="grade_level" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Schedule</label>
							<textarea name="schedule" id="schedule"  class="form-control" required></textarea>
						</div>
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-success" name="btnUpdate">Update</button>
						</div>
					<form> 
				</div>      
			</div>
		</div>
		
		<script type="text/javascript">
			setTimeout(function(){
				document.getElementById("alert").style.display = "none";
			},3000);
		</script>

		<script type="text/javascript">
			$('.edit').click(function(){
			    var $row = $(this).closest('tr');
			    var id = $row.find('.id').text();
				var subject = $row.find('.subject').text();
				var section_strand = $row.find('.section_strand').text();
			    var grade_level $row.find('.grade_level').text();
                var schedule = $row.find('.schedule').text();


			    $('#id').val(id);
				$('#subject').val(subject);
				$('#section_strand').val(section_strand);
			    $('#grade_level').val(grade_level);
                $('#schedule').val(schedule);

			    $('#editReportModal').modal('show');
		    });
	</script>
</body>
</html>