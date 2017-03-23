$(document).ready(function() {
	$('#openissues').hide();
		$.get('openIssues', openIssues);
		function openIssues(data){
			var projects=Object.keys(data);
			var issues=[];
			for(var i in projects){
				issues[i]=data[projects[i]].length;				
			}
			var colorsArray=randomColorGenerator(projects.length);
			var cdata = {
					labels: projects,
					datasets: [{
						data: issues,
						backgroundColor: colorsArray
						}]
			};
			
			function randomColorGenerator(length){
				var colors=[];
				for(var i=0; i<length; i++){
					colors[i]='#' + (Math.random().toString(16) + '0000000').slice(2, 8);
				}
				return colors;
			}
			
			var ctx = document.getElementById("openissues").getContext("2d");
			$('#openissues').show();
			var openIssuesChart = new Chart(ctx,{
			    type: 'horizontalBar',
			    data: cdata,
			    options: {
			        responsive: true,
			        tooltips:{
				    	 callbacks:{
				    		 label: function(tooltipItem, data){
				    			 var value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
				    			 return "No. Of Open Issues : "+value;
				    		 }
				    	 }  
				     },
			        legend: {
		                display:false,
			        	position: 'bottom',
		            },
		            scales: {
                        xAxes: [{
                            display: true,
                            ticks: {  
                                beginAtZero: true,              
                            }
                        }]
                    }
			    },
			    animation:{
			    	animateScale: true
			    }
			});
			
			$("#openissues").click(
				function(evt){
					var activePoints = openIssuesChart.getElementsAtEvent(evt);	
					var project=cdata.labels[activePoints[0]["_index"]];
					var projectissues=data[project];
					
					var output = ""
			   			output +='<table class="table table-bordered" id="issuestable">';
						output += '<thead>';
						output += '<tr>';
						output += '<th>Issue ID</th>';
						output += '<th>Summary</th>';
						output += '</tr>';
						output += '</thead>';
						output += '<tbody>';
						for(var i in projectissues){
							output += '<tr>';
							output += '<td>'+ projectissues[i].id+'</td>';
							output += '<td>'+ projectissues[i].fields.summary +'</td>';
							output += '</tr>';
						}
						output += '</tbody>';
						output += ' </table>';
						$('#modaltitle').text(project+" - Open Issues");
						$('#IssuesModal').modal('show');
						document.getElementById("issuestablearea").innerHTML = output;
			});
		}
});