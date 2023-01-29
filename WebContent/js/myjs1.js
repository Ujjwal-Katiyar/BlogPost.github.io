$(document).ready(function(){
	
	
	
	
	})
	

function doLike(pid,uid)
{
	var i_name="#like-tog-"+pid;
	console.log("first"+i_name);
	const likedata= {
	uid:uid,
	pid:pid,
	operation:"like"
	}
	$.ajax({
	
			url:"LikeServlet",
			data:likedata ,
			success: function(data,textStatus,jqXHR)
			{
			
				var count_class="#like-button-"+pid;
				$(count_class).html(data);
				var classname=$(i_name).attr("class");
				console.log(classname);
				if(classname=="btn btn-primary")
				{
				     $(i_name).removeClass();
				     $(i_name).addClass("btn btn-danger");
				    
				}
				else
				{
			
				if(classname=="btn btn-danger")
				{
				$(i_name).removeClass();
				    $(i_name).addClass("btn btn-primary");
				    
				}
				}
				
			
           
			},
			error: function(jqXHR,textStatus,errorThrown)
			{
			
					
			}
	
	
	})
	



}