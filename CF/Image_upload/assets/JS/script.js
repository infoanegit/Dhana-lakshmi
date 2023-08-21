$(document).ready(function(){
 		/* this function will call when onchange event fired */
        $("#picture").on("change",function(){
			$("#file_error").html("");
			$(".uploadimage").css("border-color","#F0F0F0");
			/* current this object refer to input element */
            var $input = $(this);

 			/* collect list of files choosen */
            var files = $input[0].files;
 			var filename = files[0].name;

      		/* getting file extenstion eg- .jpg,.png, etc */
            var extension = filename.substr(filename.lastIndexOf("."));
            var allowedExtensionsRegx = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

 			/* testing extension with regular expression */
            var isAllowed = allowedExtensionsRegx.test(extension);
			var file_size = $('#picture')[0].files[0].size;
			if(file_size>1000000) {
				$("#file_error").html("<p style='color:red'>*File size is greater than 1mb*</p>");
				$(".uploadimage").css("border-color","red");
				return false;
				} 
 			if(isAllowed){
                alert("File type is valid for the upload");
            }else{
                alert("Invalid File Type.");
                return false; 
            }
		});
});