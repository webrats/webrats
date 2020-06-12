




	function insertLike ( uid, pid) {
	
	let fdata ={
			uid :uid,
			pid :pid		
	}
	
	$.ajax({
		url : "likedServlet",
		data :fdata,
		success : function(data,textStatus,jqXHR) {
			
			if(data.trim() == "done"){
				swal("Good job!", "You Like!", "success");
			}
			else{
				swal("AHH!", "You already Like!", "warning");
			}
		},
		
		error : function(jqXHR,textStatus,errorThrown) {
			//error
			console.log(data);
			
		} 
	})
}