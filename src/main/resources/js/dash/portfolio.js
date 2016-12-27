$(document).ready(function() {
	$('#portfoliochart2').hide();
	$('#portfoliochart3').hide();
	$('#portfoliochart4').hide();
	$('#portfolio').hide();
	$('#releasestatus').hide(); 
	$.get('allProjSprintDetails',function sprints(sprintsinfo){
	$.get('allProjectsState', allprojects);
		function allprojects(data){
			
			/*$.get('projectlist'), function listOfProjects(projectsList){
				for(var i in projectsList){
					for(var j in sprintsinfo){
						
					}
				}
			}*/				
			
			var allProjectsdata=data;
			var allprojects=Object.keys(data);
			var nst=0,cmp=0,inp=0;
			for(var i in allprojects){
				if(data[allprojects[i]].projectStatus == "InProgress")
					inp++;
				else if(data[allprojects[i]].projectStatus == "Not Started")
					nst++;
				else if(data[allprojects[i]].projectStatus == "Completed")
					cmp++;
			}
			var ctx = document.getElementById("portfolio").getContext("2d");
			var cdata = {
					labels: [
					         "Completed",
					         "InProgress",
					         "Not Started"
					         ],
					datasets: [{
						           data: [cmp, inp, nst],
						           backgroundColor: ["#33cc33","#ffff80","#6666ff"],
						           hoverBackgroundColor: ["#248f24","#ffff33","#3333ff"]
						       }]};
			$('#portfolio').show();
			var portfolioChart = new Chart(ctx,{
				type: 'pie',
				data: cdata,
				options: {
					elements: {
						arc: {
							borderColor: 'rgba(255,255,255,0)'
						}
					},
					responsive: true,
					legend: {
						position: 'bottom',
					}
				}
			});
			
			$("#portfolio").click(
				function(evt){
					var activePoints = portfolioChart.getElementsAtEvent(evt);	
					var status=cdata.labels[activePoints[0]["_index"]];
					var bgc=cdata.datasets[0].backgroundColor[activePoints[0]["_index"]];
					var projperstatus=[];
					
					for(var i in allprojects){
						if(data[allprojects[i]].projectStatus == status){
							projperstatus.push(allprojects[i]);
						}
					}
					$('#portfoliochart').hide();
					$('#portfoliochart2').show();
					$('#portfoliochart2 h2').text(status +" Projects");
					var glyph1='<a id="pcanchor1"><span style="float: right;" class="glyphicon glyphicon-remove-sign"></span></a>';
			   		$('#portfoliochart2 h2').append(glyph1);
					//$('#portfolio2').show();
					var projcomp=[];
					var totalissues=0,compissues=0,releasecomp=0;
						
					for(var i in projperstatus){
						var proj=projperstatus[i];
						var releases=Object.keys(sprintsinfo[proj]);
						var releasecomp=[];
						for(var j in releases){
							var rel=releases[j];
							var sprintperrelease=Object.keys(sprintsinfo[proj][rel]);
							var sprintcomp=[];
							for(var k in sprintperrelease){
								var spr=sprintperrelease[k];
								totalissues=sprintsinfo[proj][rel][spr].InProgressIssues.length + sprintsinfo[proj][rel][spr].NotStratedIssues.length + sprintsinfo[proj][rel][spr].completedIssues.length;
								compissues=sprintsinfo[proj][rel][spr].completedIssues.length;
								sprintcomp[k]=+(compissues/totalissues*100).toFixed(2);
							}
							var stotal=0;
							$.each(sprintcomp,function(){
								stotal +=this;
							});
							releasecomp[j]=+(stotal/sprintcomp.length).toFixed(2);
						}
						var rtotal=0;
						$.each(releasecomp,function(){
							rtotal +=this;
						});
						var singleprojcomp=+(rtotal/releasecomp.length).toFixed(2);
						if(isNaN(singleprojcomp))
							projcomp[i]=0;
						else
							projcomp[i]=singleprojcomp;
					}
						
					var canvas=document.getElementById("portfolio2");
					var ctx2 = canvas.getContext("2d");
					
					var cdata2={
						labels: projperstatus,
						datasets: [{
									label: "Completion Percentage",
									data: projcomp,
									backgroundColor: bgc
								}]};
					var projectsperStatusChart=new Chart(ctx2, {
						   type: 'bar',
						   data: cdata2,
						   options: {
						       responsive: true,
						       legend: {
			                       position: 'bottom',
			                   },
			                   scales: {
			                       yAxes: [{
			                           display: true,
			                           ticks: {
			                               //suggestedMin: 0,   
			                               beginAtZero: true,
			                               suggestedMax: 100
			                           }
			                       }]
			                   }
						   }
					});
					
					$('#pcanchor1').click(function(){
						$('#portfolio2').remove();
						var canvas = document.createElement("canvas");
						canvas.setAttribute("id","portfolio2");
						$('#portfoliochart2').append(canvas);
						$('#portfoliochart2').hide();
						$('#portfoliochart').show();
						$('#projectstatuschart').show();
						$('#releasestatuschart').show();
						$('#openissuesdiv').show();
					});
					
					$("#portfolio2").click(
						function(evt){
							var activePoints2 = projectsperStatusChart.getElementsAtEvent(evt);
							var project=cdata2.labels[activePoints2[0]["_index"]];
							var releasesofproject=Object.keys(sprintsinfo[project]);
							var sprintperrelease=[];
							var sprintslength=[];
							var bgc2=[];
							var sprintsinp=[];
							var sprintscmp=[];
							var sprintsnst=[];
							
							//$('#portfolio2').hide();
							$('#portfoliochart2').hide();
							$('#portfoliochart3').show();
							$('#portfoliochart3 h2').text("Releases of Project - " +project );
							
							var rglyph1='<a id="remover1"><span style="float: right; padding-left: 20px;" class="glyphicon glyphicon-remove-sign"></span></a>';
							var glyph2='<a id="pcanchor2"><span style="float: right;" class="glyphicon glyphicon-arrow-left"></span></a>';
					   		$('#portfoliochart3 h2').append(rglyph1,glyph2);							
							
							//$('#portfolio3').show();
							for(var i in releasesofproject){
								var rel=releasesofproject[i];
								sprintperrelease[i]=Object.keys(sprintsinfo[project][rel]);
								var sprcom=0,sprinp=0;sprnst=0;
								for(var j in sprintperrelease[i]){
									var sprint=sprintperrelease[i][j];
									var sprintstatus=sprintsinfo[project][rel][sprint].sprintState;
									if(sprintstatus == "CLOSED")
										sprcom++;
									else if(sprintstatus == "ACTIVE")
										sprinp++;
									else if(sprintstatus == "FUTURE")
										sprnst++;		
								}
								sprintsinp[i]=sprinp;
								sprintscmp[i]=sprcom;
								sprintsnst[i]=sprnst;
								/*sprintslength[i]=sprintperrelease[i].length;
								var statusofrelease=data[project]["releases"][rel]["status"];
								if(statusofrelease)
									bgc2[i]="#33cc33";
								else
									bgc2[i]="#ffff80";*/
								}
							
							var ctx3 = document.getElementById("portfolio3").getContext("2d");
							var cdata3={
									labels: releasesofproject,
									datasets:[{
										label: "Sprints To Be Done",
										data: sprintsnst,
										backgroundColor: "#6666ff",
										borderWidth: 3
									}, {
										label: "Sprints In Progress",
										data: sprintsinp,
										backgroundColor: "#ffff80",
										borderWidth: 3
									},{
										label: "Completed Sprints",
										data: sprintscmp,
										backgroundColor: "#33cc33",
										borderWidth: 3
									}									
									]};
							var releasesperProjectChart=new Chart(ctx3, {
								   type: 'bar',
								   data: cdata3,
								   options: {
								       responsive: true,
								       legend: {
					                       position: 'bottom',
					                   },
					                   scales: {
					                	   xAxes:[{
					                		   stacked: true
					                	   }],
					                       yAxes: [{
					                           display: true,
					                           ticks: {
					                               //suggestedMin: 0,   
					                               beginAtZero: true   
					                           },
					                           stacked: true
					                       }]
					                   }
								   }
							});
							
							$('#pcanchor2').click(function(){
								$('#portfolio3').remove();
								var canvas = document.createElement("canvas");
								canvas.setAttribute("id","portfolio3");
								$('#portfoliochart3').append(canvas);
								$('#portfoliochart3').hide();
								$('#portfoliochart2').show();
							});
							$("#remover1").click(function(){
								$('#portfolio3').remove();
								var canvas = document.createElement("canvas");
								canvas.setAttribute("id","portfolio3");
								$('#portfoliochart3').append(canvas);
								$('#portfolio2').remove();
								var canvas2 = document.createElement("canvas");
								canvas2.setAttribute("id","portfolio2");
								$('#portfoliochart2').append(canvas2);
								$('#portfoliochart3').hide();
								$('#portfoliochart').show();
								$('#projectstatuschart').show();
								$('#releasestatuschart').show();
								$('#openissuesdiv').show();
							});
							
							$("#portfolio3").click(
								function(evt){
									var activePoints3 = releasesperProjectChart.getElementsAtEvent(evt);
									var release=cdata3.labels[activePoints3[0]["_index"]];
									var sprintsperrelease=Object.keys(sprintsinfo[project][release]);
									var p3totalissues=0,p3compissues=0;
									var p3sprintcomp=[];
									var barclr=[];
									
									//$('#portfolio3').hide();
									$('#portfoliochart3').hide();
									$('#portfoliochart4').show();
									$('#portfoliochart4 h2').text("Sprints of Release - " +release+" (Project - "+project+")" );
									//$('#portfolio4').show();
									
									var rglyph2='<a id="remover2"><span style="float: right; padding-left: 20px;" class="glyphicon glyphicon-remove-sign"></span></a>';
									var glyph3='<a id="pcanchor3"><span style="float: right;" class="glyphicon glyphicon-arrow-left"></span></a>';
							   		$('#portfoliochart4 h2').append(rglyph2,glyph3);
									
									for(var i in sprintsperrelease){
										var p3sprint=sprintsperrelease[i];
										p3totalissues=sprintsinfo[project][release][p3sprint].InProgressIssues.length + sprintsinfo[project][release][p3sprint].NotStratedIssues.length + sprintsinfo[project][release][p3sprint].completedIssues.length;
										p3compissues=sprintsinfo[project][release][p3sprint].completedIssues.length;
										p3sprintcomp[i]=+(p3compissues/p3totalissues*100).toFixed(2);
									}
									
									for(var i in p3sprintcomp){
										var value=p3sprintcomp[i];
										if(value == 100)
											barclr[i]="#33cc33";
										else if(value == 0)
											barclr[i]="#6666ff";
										else
											barclr[i]="#ffff80";
									}
									
									var ctx4 = document.getElementById("portfolio4").getContext("2d");
									var cdata4={
											labels: sprintsperrelease,
											datasets: [{
														label: "Completion Percentage",
														data: p3sprintcomp,
														backgroundColor: barclr
													}]};
									var sprintsperProjectChart = new Chart(ctx4, {
										type: 'horizontalBar',
									    data: cdata4,
									    options: {									    	
									        responsive: true,
									        legend: {
						                        position: 'bottom',
						                        labels:{
							                    	   generateLabels: function(chart){
							                    		   var labels=[{"text": "Completed" , "fillStyle": "#33cc33"},{"text": "In Progress" , "fillStyle": "#ffff80"},{"text": "Not Started" , "fillStyle": "#6666ff"}];
							                    		   return labels;
							                    	   }
							                       }
						                    },
						                    scales: {
						                        xAxes: [{
						                            display: true,
						                            ticks: {  
						                                beginAtZero: true,
						                                suggestedMax: 100   
						                            }
						                        }]
						                    }
									    }
									});
									
									$('#pcanchor3').click(function(){
										$('#portfolio4').remove();
										var canvas = document.createElement("canvas");
										canvas.setAttribute("id","portfolio4");
										$('#portfoliochart4').append(canvas);
										$('#portfoliochart4').hide();
										$('#portfoliochart3').show();
									});
									$('#remover2').click(function(){
										$('#portfolio4').remove();
										var canvas = document.createElement("canvas");
										canvas.setAttribute("id","portfolio4");
										$('#portfoliochart4').append(canvas);
										$('#portfolio3').remove();
										var canvas2 = document.createElement("canvas");
										canvas2.setAttribute("id","portfolio3");
										$('#portfoliochart3').append(canvas2);
										$('#portfolio2').remove();
										var canvas3 = document.createElement("canvas");
										canvas3.setAttribute("id","portfolio2");
										$('#portfoliochart2').append(canvas3);
										$('#portfoliochart4').hide();
										$('#portfoliochart').show();
										$('#projectstatuschart').show();
										$('#releasestatuschart').show();
										$('#openissuesdiv').show();
									});
									
									$("#portfolio4").click(
										function(evt){
											var activePoints4 = sprintsperProjectChart.getElementsAtEvent(evt);
											/*var ac=sprintsperProjectChart.lastTooltipActive;*/							
											try{
												var sprint=cdata4.labels[activePoints4[0]["_index"]];
											}
											catch(e){
												console.log(e);
											}
											
											if(sprint == undefined){
												/*var helpers=Chart.helpers;	
												var eventPosition = helpers.getRelativePosition(evt, sprintsperProjectChart.chart);
												alert(JSON.stringify(eventPosition))
												var mouseX = eventPosition.x;
												var mouseY = eventPosition.y;
												var aPoints = [];
												helpers.each(sprintsperProjectChart.scales.xAxes.ticks, function (label, index) {
													alert("heer")
													for (var i = this.getValueCount() - 1; i >= 0; i--) {
														alert(i)
													}
												},sprintsperProjectChart.scale);*/			
												var base=this.scales.endPoint;
												alert(base)
											}
											
											var output = "";
											output +='<table class="table table-bordered" id="issuestable">';
											output += '<thead>';
											output += '<tr>';
											output += '<th>Issue Name</th>';
											output += '<th>Description</th>';
											output += '<th>Status</th>';
											output += '<th>Assigned To</th>';
											output += '</tr>';
											output += '</thead>';
											output += '<tbody>';
											
											var inpissues=sprintsinfo[project][release][sprint]["InProgressIssues"];
											for(var i in inpissues){
												var issue=inpissues[i];
												output += '<tr>';
												output += '<td>'+issue.issueName+'</td>';
												output += '<td>'+issue.issueSummary+'</td>';
												output += '<td>'+issue.issueStatus+'</td>';
												output += '<td>'+issue.issueAssign+'</td>';
												output += '</tr>';
											}
											
											var nstissues=sprintsinfo[project][release][sprint]["NotStratedIssues"];
											for(var i in nstissues){
												var issue=nstissues[i];
												output += '<tr>';
												output += '<td>'+issue.issueName+'</td>';
												output += '<td>'+issue.issueSummary+'</td>';
												output += '<td>'+issue.issueStatus+'</td>';
												output += '<td>'+issue.issueAssign+'</td>';
												output += '</tr>';
											}
											
											var cmpissues=sprintsinfo[project][release][sprint]["completedIssues"];
											for(var i in cmpissues){
												var issue=cmpissues[i];
												output += '<tr>';
												output += '<td>'+issue.issueName+'</td>';
												output += '<td>'+issue.issueSummary+'</td>';
												output += '<td>'+issue.issueStatus+'</td>';
												output += '<td>'+issue.issueAssign+'</td>';
												output += '</tr>';
											}
											
											output += '</tbody>';
											output += ' </table>';
											$('#modaltitle').text(sprint+" - Issues");
											$('#IssuesModal').modal('show');
											document.getElementById("issuestablearea").innerHTML = output;
									});
									
							});
							
						});
					
				}); 
			releaseStatusCharts(sprintsinfo,allProjectsdata);
		}
		
	});	
	
	
	
	/*$(function(){
		$('#releasestatus').hide();
		$.get('allProjSprintDetails',function sprints(sprintsinfo){
		$.get('allProjectsState', allprojects);*/
		function releaseStatusCharts(sprintsinfo,allProjectsdata){
			var projectsinfo=allProjectsdata;
			var projects=Object.keys(sprintsinfo);
			var releases=[];
			var sprints=[];
			var sprintscount=[];
			var relbgc=[];
			$('#releasestatus').show();
			for(var i in projects){
				var project=projects[i];
				releases[i]=Object.keys(sprintsinfo[project]);
				var projectsinfoproj=projectsinfo[project];
				var count=[];
				var bgc=[];
				
				for(var j in releases[i]){
					var statusofrelease=false;
					var release=releases[i][j];
					//alert(project+" "+releases[i]+" "+release)
					var projectsinforel=projectsinfoproj.releases[release];
					
					var statusofrelease=projectsinforel.status;
					
					if(statusofrelease)
						bgc[j]="#33cc33";
					else
						bgc[j]="#ffff80";
					
					sprints[j]=Object.keys(sprintsinfo[project][release]);
					count[j]=sprints[j].length;
				}
				sprintscount[i]=count;
				relbgc[i]=bgc;
			}
		
			var max=0;
			for(var i in sprintscount){
				max=sprintscount[i].length;
				for(var j in sprintscount){
					if(max >= sprintscount[j].length)
						max=max;
					else
						max=sprintscount[j].length;
				}
			}

			var cdatasets=[];
			for(var i=0; i<max; i++){
				var dataset={"label":[],"data":[],"backgroundColor":[]};
				cdatasets.push(dataset);
			}
			
			for(var i in cdatasets){
				var dataset=cdatasets[i];
				for(var j in sprintscount){
					dataset["data"].push(sprintscount[j][i]);
					dataset["backgroundColor"].push(relbgc[j][i]);
					dataset["label"].push(releases[j][i])
				}
				cdatasets[i]=dataset;
			}
			
			var ctx = document.getElementById("releasestatus").getContext("2d");
			var cdata={
					labels: projects,
					datasets:cdatasets
					};
			
			
			var releaseStatusChart=new Chart(ctx, {
				   type: 'bar',
				   data: cdata,
				   options: {
				       responsive: true,
				       tooltips:{
				    	 callbacks:{
				    		 beforeLabel: function(tooltipItem, data){
				    			 var datasetLabel = data.datasets[tooltipItem.datasetIndex].label[tooltipItem.index];
				    			 return "Release : "+datasetLabel;
				    		 },
				    		 label: function(tooltipItem, data){
				    			 var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
				    			 return "No. Of Sprints :"+value;
				    		 }
				    	 }  
				       },
				       legend: {
	                    position: 'bottom',
	                    labels:{
	                 	   generateLabels: function(chart){
	                 		   var labels=[{"text": "Completed" , "fillStyle": "#33cc33"},{"text": "In Progress" , "fillStyle": "#ffff80"}, {"text": "Not Started" , "fillStyle": "#6666ff"}];
	                 		   return labels;
	                 	   }
	                    }
				       },
				       scales: {
				    	   yAxes: [{
				    		   display: true,
				    		   ticks: {
	                            //suggestedMin: 0,   
	                            beginAtZero: true   
				    		   }
				    	   }],
	                       xAxes:[{
	                    	   scaleLabel: {
	                    	        display: true,
	                    	        labelString: 'Projects'
	                    	   }
	                       }]
				       }
				   }
			});
		}
		});

$.get('codeQualityProject',function ccp(data){
	var projects=Object.keys(data);
	var output="";
	output +='<table class="table table-striped table-bordered table-hover" id="simpledatatable">';
	output += '<thead>';
	output += '<tr>';
	output += '<th>Project Name</th>';
	output += '<th>Status</th>';
	output += '</tr>';
	output += '</thead>';
	output += '<tbody>';
	for(var i in projects){
		var project=projects[i];
		output += '<tr data-toggle="tooltip" data-project="'+project+'" data-critical="'+data[project].criticalIssues+'" data-major="'+data[project].majorIssues+'" data-blocker="'+data[project].blockerlIssues+'">';
		output += '<td><b>' + project +'</b></td>';
		if(data[project].projectStatus == "amber")
			output += '<td class="warning">Good</td>';
		else if(data[project].projectStatus == "red")
			output += '<td class="danger">Poor</td>';
		else if(data[project].projectStatus == "green")
			output += '<td class="success">Fair</td>';
		else
			output += '<td class="info"> - - -   Not Yet Analysed   - - - </td>';
		
		output += '</tr>';
	}
	output += '</tbody>';
	output += '</table>';
	document.getElementById("projectstatustable").innerHTML = output;
});


/*	});
});*/

