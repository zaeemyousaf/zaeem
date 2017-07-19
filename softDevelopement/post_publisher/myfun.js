function clearEditor(){
	document.getElementById("editor").innerHTML="";
	}

/*--------------------------publishPost() */
function publishPost(){
	var postScript=document.getElementById("editor").value;
	//if post is empty or just showing basic message: don't publish
	if((postScript != "") && (postScript != "Share your thoughts...")){
	// previous post + new post
	var prePost=document.getElementById("myPosts").innerHTML;
	// add <pre> preformated text tag if needed
	document.getElementById("myPosts").innerHTML=prePost+"<p class='post'>"+postScript+" </p> ";
	}
	document.getElementById("editor").innerHTML="Share your thoughts...";
	//document.getElementById("editor").innerHTML="Share your thoughts...";
	// after publishing set editor to its initial stage
	}

