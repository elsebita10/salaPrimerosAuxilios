//var userFounded;
//
//
//window.onload = function (){
//	
//	document.getElementById("userSearchText").addEventListener("keyPress", keyIsPress, false);
//	
//}
//
//function keyIsPress(){
//	
//	for (i in userList){
//		if (userList[i].username.includes(document.getElementById("userSearchText").value)){
//			userFounded.add(userList[i]);
//		}
//	}
//}




//When document is ready: this gets fired before body onload 🙂
$(document).ready(function(){
	// Write on keyup event of keyword input element
	$("#userSearchText").keyup(function(){
		// When value of the input is not blank
		if( $(this).val() != "")
		{
			// Show only matching TR, hide rest of them
			$("#usersTable tbody>tr").hide();
			$("#usersTable td:contains-ci('" + $(this).val() + "')").parent("tr").show();
		}
		else
		{
			// When there is no input or clean again, show everything back
			$("#usersTable tbody>tr").show();
		}
	});
});
// jQuery expression for case-insensitive filter
$.extend($.expr[":"], 
{
    "contains-ci": function(elem, i, match, array) 
	{
		return (elem.textContent || elem.innerText || $(elem).text() || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
	}
});
 
 