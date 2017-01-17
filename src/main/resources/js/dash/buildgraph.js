//document.getElementById("cont").innerHTML ='<object type="text/html" data="' + data[i].build_URL + '/consoleText" ></object>';


$(document)
		.ready(
				function() {
					$.get('buildgraph', drawChart);
					$.get('buildtable', build);
					$.get('buildIDs', buildIDs);
					$.get('getbuilds', getbuilds);
					$.get('pielinejobs', pielinejobs);

					function pielinejobs(data) {
						var output = "";
						var status = "";
						var activity = "";
						output += ' <table class="table table-bordered table-striped" width="600px">';
						output += '<thead>';
						output += '<tr>';
						output += '  <th>Activity</th>';
						output += '  <th>Status</th>';
						
						output += '</tr>';
						output += '</thead>';
						output += '<tbody>';
						for ( var i in data) {
							if(data[i].job_name=="Tera_Adopt_UAT")
								{
								
								activity = "Deploying in UAT";
								}
							else 
								if(data[i].job_name=="Tera_Adopt_prod")
								{
								activity = "Deploying in prod";
								}
								else 
									if(data[i].job_name=="Tera_Adopt_preprod")
									{
									activity = "Deploying in preprod";
									}	
							
									else 
										if(data[i].job_name=="Acceptance_Testing")
										{
										activity = "Acceptance Testing";
										}
										else 
											if(data[i].job_name=="Preproduction_Testing")
											{
											activity = "Preproduction Testing";									
						}
						else if(data[i].job_name=="Sanity_Testing")
							{
							activity = "Sanity Testing";									
		}
					
						
							
							output += '  <tr>';
							output += '<td> '+activity+' </td>';

							if (data[i].status == "success") {
								output += '<td style="color:green"><a href="'+data[i].build_URL+'consoleText" target="_blank">'
										+ data[i].status + ' </a></td>';

							} else {
								output += '<td style="color:orange"><a href="'+data[i].build_URL+'consoleText" target="_blank">'
										+ data[i].status + '</a></td>';

							}
							output += '</tr>';

						}

						output += '</tbody>';
						output += ' </table>';
						var status = "";
						for ( var j in data) {
							
							if (data[j].pipeline_status == "failed") {
								$("#runningjob").hide();								
								status += '<center><p><font face="verdana" color="red" size="5">Pipeline Failed</font></p></center>';
							} 
							else if (data[j].pipeline_status == "success"){								
								$("#runningjob").hide();					
								status += '<center><p><font face="verdana" color="green" size="5"> Pipeline completed successfully</font></p></center>';
							}

						}
						/*for(var k in data)
							{
							if(data[k].status=="running")
							//document.getElementById("cont").innerHTML ='<object type="text/html" data="' + data[k].build_URL + '/consoleText" ></object>';
								 $("#cont").attr("src",  data[k].build_URL + 'consoleText');
							
							}*/
						 $("#cont").attr("src",  data[0].build_URL + 'consoleText');
						document.getElementById("RunningTab").innerHTML = output;
						document.getElementById("pipeline").innerHTML = status;
						
					

					}

					function buildIDs(data) {
						var output = "";
						var msg = "are you sure ?";
						output += '<font color="blue" size="3">Select a build ID to trigger the pipeline</font>';
						output += '<select id="buildIDstable" name="buildid"  class="form-control" data-style="btn-primary"  style="width:200px;"  onChange="taskHistory()" >';
						output += '<option selected disabled> Build Id</option>';
						/*for ( var i in data) {
							output += '<option value='
									+ data[i].build_details.name + ' > '
									+ data[i].build_details.name + '</option>';
						}*/
						for ( var i in data) {
							output += '<option value='
									+ data[i]+ ' > '
									+ data[i]+ '</option>';
						}
						
						
						
						
						
						
						
						
						
						output += '</select>'
						// output += '<input type="submit" id="subPromotion"
						// name="startBuild" value="Build" class="btn
						// btn-primary" onClick="return confirm(\'' + "Are you
						// sure you want to deploy the selected build ?" +
						// '\')">';

						output += '</tbody>';

						document.getElementById("buildIdsTable").innerHTML = output;
					}

					// ------
					// -------
					// ------
					// -----
					// -------
					function getbuilds(data) {
						var output = "";
						output += '<font color="red">Recently Deployed Builds</font>';
						output += ' <table class="table table-bordered table-striped" align="right" width="1200">';
						
						output += '<thead>';
						output += '<tr>';
						output += '  <th>Build Number</th>';
						output += '  <th>Environment</th>';
						output += '<th>status</th>'
						//output += '<th>Tasks List</th>';
						
						output += '</tr>';
						output += '</thead>';
						output += '<tbody>';
						for ( var i in data) {
							output += '  <tr>';
							output += '<td>' + data[i].buildDisplayName
									+ '</td>';
							output += '<td>' + data[i].deployedEnvironment
									+ '</td>';
							
							output += '<td> Ready to deploy</td>';
							/*if (data[i].deploymentStatus == true) {
								output += '<td><a target="_blank" href="' + data[i].build_url+ 'consoleText "> success</a><a href="' + data[i].build_url+ 'consoleText " download><span class="glyphicon glyphicon-download-alt"></span></a></td>';
							} else {
								output += '<td><a target="_blank" href="' + data[i].build_url+ 'consoleText "> Failed</a><a href="' + data[i].build_url+ 'consoleText " download><span class="glyphicon glyphicon-download-alt"></span></a></td>';
								//output +='<td><a href="' + data[i].build_url+ 'consoleText " download>Download</a></td>';
							}*/
						//	output += '<form id="form-id action="taskHistory">';
						/*	output +=	'<td><a href="#" onclick="">tasks in '+data[i].buildDisplayName+'</a> 	</td>';*/
							//output += '<td><a> tasks in '+data[i].buildDisplayName+'</a></td>';
						//	output += '</form>';
							output += '</tr>';
						}

						output += '</tbody>';
						output += ' </table>';

						document.getElementById("predeploys").innerHTML = output;

					}

					// ------
					// -------
					// ------
					// -----
					// -------

					function build(data) {
						var output = "";
						output += ' <table class="table table-bordered table-striped">';
						output += '<thead>';
						output += '<tr>';
						output += '  <th>Build Number</th>';
						output += '  <th>Build Status</th>';
						output += '  <th>Build Start Date</th>';
						output += '  <th>Build Duration</th>';
						output += '</tr>';
						output += '</thead>';
						output += '<tbody>';
						for ( var i in data) {
							output += '  <tr>';
							output += '<td><a href="' + data[i].url + '">'
									+ data[i].buildDisplayName + '</td>';
							/*output += '<td>' + data[i].status + '</td>';*/							
							if(data[i].status == true){
								output += '<td>Success</td>';
							}
							else{
								output += '<td>Failure</td>';
							}						
							
							var date = new Date(data[i].startDate);
							var month = date.getMonth() + 1;

							output += '<td>' + date.getDate() + '-' + month
									+ '-' + date.getFullYear() + '</td>';
							output += '<td>' + data[i].duration + '</td>';
							output += '</tr>';
						}

						output += '</tbody>';
						output += ' </table>';

						document.getElementById("buildtable").innerHTML = output;

					}
					;

					function drawChart(response) {
						var datearray = [];
						var passedarray = [];
						var failedarray = [];
						for ( var i in response) {
							datearray.push(response[i].startDate);
							passedarray.push(Number(response[i].passedCount));
							failedarray.push(Number(response[i].failedCount));
						}

						var barChartData = {
							labels : datearray,
							datasets : [ {
								label : 'Passed',
								backgroundColor : "green",
								data : passedarray
							}, {
								label : 'Failed',
								backgroundColor : "red",
								data : failedarray
							} ]

						};
						draw()
						function draw() {
							var ctx = document.getElementById("canvas")
									.getContext("2d");
							window.myBar = new Chart(
									ctx,
									{
										type : 'bar',
										data : barChartData,
										options : {
											// Elements options apply to all of
											// the options unless overridden in
											// a dataset
											// In this case, we are setting the
											// border of each bar to be 2px wide
											// and green
											elements : {
												rectangle : {
													borderWidth : 2,
													borderColor : 'rgba(255,255,255,0)',
													borderSkipped : 'bottom'
												}
											},

											responsive : true,
											legend : {
												position : 'bottom',
											},
											scales : {
												xAxes : [ {
													gridLines : {
														color : "rgba(255,255,255,0)"
													}
												} ],
											}
										}
									});

						}
						;
					}

				})

function taskHistory() {
	$("#score").show();
	var bid = $('#buildIDstable').val();

	$
			.ajax({
				type : "POST",
				url : "taskHistory.do",
				dataType : "json",
				data : {
					name : bid
				},
				success : function(data) {
					if (data) {
						output = "<br><p style='color:purple font-size:25px;'>Tasks in this release:</p>";
						for ( var i in data) {
							output += "<p style='color:green'>"
									+ data[i].task_name + ":"
									+ data[i].task_parent_name + "</p>";

						}
						document.getElementById("score").innerHTML = output;
					}
				},
				error : function() {
					alert('not worked.');
				}

			})

}
