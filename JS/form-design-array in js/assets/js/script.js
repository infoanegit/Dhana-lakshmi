$(document).ready(function(){
		$("form").on('submit',function(){
			var arrays=$('#arrays').val();
			var arrayposition=$('#arrayposition').val();
			var replace=$('#replace').val();
			var array=arrays.split(',');
			let size= array.length;
			let arrays0=array.splice(arrayposition-1,1,replace);
			console.log(array);

			if(arrays==""){
				console.log(arrays);
				alert("Enter the array");
				return false;
			}
			// else if(size>5){
			// 	alert("Accept only 5 position arrays");
			// 	return false;
			// }
			else if(arrayposition==""){
				alert("Please Enter the array position");
				return false;
			}
			else if(/[^0-9]|^0+(?!$)/g.test(arrayposition)){
				alert("Only numeric value allowed in position");
				return false;
			}
			else if(replace==""){
				alert("Please Enter the replace element");
				return false;
			}
			else {
				$("#originalarray").val(arrays);
				$("#result").val(array);    
				return false; 
			}
	    });
});