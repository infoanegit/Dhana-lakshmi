$(() =>{
    var prevElem= null;

     function swapColors(elem){
         var temp=$(prevElem).attr("color");
         $(prevElem).attr("color",$(elem).attr("color"));
         $(elem).attr("color",temp);

         $(elem).toggleClass($(prevElem).attr("color")+ " " + $(elem).attr("color"));
         $(prevElem).toggleClass($(elem).attr("color")+ " " + $(prevElem).attr("color"));
     }
     
     $("div").click((e)=> {
         var elem = e.target;
         if(prevElem != null){
             if($(prevElem).attr("color")!=$(elem).attr("color")){
                 swapColors(elem);
                 e.stopPropagation();
                 prevElem=null;
             }
         } 
         else{
             prevElem=e.target;
         }
     });
 });