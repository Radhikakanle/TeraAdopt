$(document).ready(function() {
	$('#projectstatus').hide();
	/*$.get('codeQualityProject',function codequality(data){
		alert(JSON.stringify(data))
	});*/
/*	$.get('allProjSprintDetails',function sprints(sprintsinfo){
		var projects=Object.keys(sprintsinfo);
		
		var projcomp=[];var barclr=[];
		var totalissues=0,compissues=0,releasecomp=0;
		for(var i in projects){
			var project=projects[i];
			var releases=Object.keys(sprintsinfo[project]);
			var releasecomp=[];
			for(var j in releases){
				var release=releases[j];
				var sprintsperrelease=Object.keys(sprintsinfo[project][release]);
				var sprintcomp=[];
				for(var k in sprintsperrelease){
					var sprint=sprintsperrelease[k];
					totalissues=sprintsinfo[project][release][sprint].InProgressIssues.length + sprintsinfo[project][release][sprint].NotStratedIssues.length + sprintsinfo[project][release][sprint].completedIssues.length;
					compissues=sprintsinfo[project][release][sprint].completedIssues.length;
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
			
			for(var i in projcomp){
				var value=projcomp[i];
				if(value == 100)
					barclr[i]="#33cc33";
				else if(value == 0)
					barclr[i]="#ff704d";
				else
					barclr[i]="#ffff80";
			}
			$('#projectstatus').show();
			
			var ctx = document.getElementById("projectstatus").getContext("2d");
			var cdata={
					labels: projects,
					datasets: [{
								label: "Completion Percentage",
								data: projcomp,
								backgroundColor: barclr
						}]};
			
			var projectStatusChart=new Chart(ctx, {
				   type: 'bar',
				   data: cdata,
				   options: {
				       responsive: true,
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
	});*/

	$.get('codeQualityProject',ccp);
	function ccp(data){
		var projects=Object.keys(data);
		lengthcheck(0);
		
		function lengthcheck(length){
			var output="";
			if(projects.length > length && projects.length > length+5 && projects.length < 100){
				output +='<table class="table table-bordered" id="testtrendtable" style="font-size: 12px">';
				output += '<thead>';
				output += '<tr>';
				output += '<th>Project Name</th>';
				output += '<th>Status</th>';
				output += '</tr>';
				output += '</thead>';
				output += '<tbody>';
				for(var i=length; i<length+5; i++){
					var project=projects[i];
					output += '<tr class="tableRow" data-toggle="tooltip" data-project="'+project+'" data-critical="'+data[project].criticalIssues+'" data-major="'+data[project].majorIssues+'" data-blocker="'+data[project].blockerlIssues+'">';
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
				output += ' </table>';
				
				document.getElementById("projectstatustable").innerHTML = output;
				
				var txt='<a id="nextdiv" data-value="'+length+'" style="float: right; font-size:16px">Next >></a>';
				$('#projectstatustable').append(txt);
			
				if(length !=0){
					var txt1='<a id="prevdiv" data-value="'+length+'" style="float: left; font-size:16px"><< Previous</a>';
					$('#projectstatustable').append(txt1);
				}
			}
			
			else if(projects.length > length && projects.length <= length+5){
				output +='<table class="table table-bordered" id="testtrendtable" style="font-size: 12px">';
				output += '<thead>';
				output += '<tr>';
				output += '<th>Project Name</th>';
				output += '<th>Status</th>';
				output += '</tr>';
				output += '</thead>';
				output += '<tbody>';
				for(var i=length; i<projects.length; i++){
					var project=projects[i];
					output += '<tr class="tableRow" data-toggle="tooltip" data-project="'+project+'" data-critical="'+data[project].criticalIssues+'" data-major="'+data[project].majorIssues+'" data-blocker="'+data[project].blockerlIssues+'">';
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
				output += ' </table>';
				
				document.getElementById("projectstatustable").innerHTML = output;
				
				if(length !=0){
					var txt1='<a id="prevdiv" data-value="'+length+'" style="float: left; font-size:16px"><< Previous</a>';
					$('#projectstatustable').append(txt1);
				}
			}
			
		}
		
		$(document).on('click', '#nextdiv', function(){
			var length=$('#nextdiv').data("value");
			$('#projectstatustable').empty();		
			/*var childDiv = document.createElement('div');
			childDiv.setAttribute("id","projectstatustable");
			$('#projectstatuschart').append(childDiv);
			$('#projectstatustable').css("height" , "265px");*/
			lengthcheck(length+5);
		});
		
		$(document).on('click', '#prevdiv', function(){
			var length=$('#prevdiv').data("value");
			$('#projectstatustable').empty();
			lengthcheck(length-5);
		});
		
		
	/*	$('[data-toggle="tooltip"]').each(function(e){
			$(this).tooltip({
				title: '<h4>Test 1</h4><p><b style="color:red">Critical Issues</b>:133<br><b style="color:yellow">Major Issues</b>:710<br><b style="color:blue">Blocker Issues</b>:12</p>',
		        html:true,
		        placement: 'bottom',
		        container: 'body'
			});
		});*/
		
		$('body').on('mouseenter','.tableRow',function(){
			var critical=$(this).data("critical");
			var major=$(this).data("major");
			var blocker=$(this).data("blocker");
			
			if(critical=="undefined")
				critical=0;
			if(major=="undefined")
				major=0;
			if(blocker=="undefined")
				blocker=0;
			
			$(this).tooltip({
				title: '<h5>'+$(this).data("project")+'</h5><p><b style="color:red">Critical Issues</b>:'+critical+'<br><b style="color:yellow">Major Issues</b>:'+major+'<br><b style="color:blue">Blocker Issues</b>:'+blocker+'</p>',
		        html:true,
		        placement: 'bottom',
		        container: 'body',
		        trigger: 'hover'
			}).tooltip('show');
		});
		
	}	
	   
});