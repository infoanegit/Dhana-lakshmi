<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <link rel="stylesheet" href="./assets/CSS/bootstrap.css">
            <style>
                .footer button:focus {
                    font-size: 10px !important;
                    box-shadow: rgb(227,16,16) 0 -2px 5px 1px;
                }
                .appendnotes {
                    display: flex;
                    justify-content: center;
                }
                .h1 {
                    color: rgb(255 202 202);
                }
                .icon {
                    block-size: 1px;
                }
                .footerbtns {
                    font-size: 12px;
                }
                input::placeholder {
                    opacity:0.5;
                    color: rgba(231, 138, 138, 0.976);
                    font-size: 1.2em;
                    font-style: italic;
                }
            </style>
        </head>
        <body>
            <center>
                <h1 class=" h1 text-center">todos</h1>
                <div class="row w-25">
                    <input type="text" name="textnotes" id="notes" class="form-control" placeholder="what needs to be done?">
                </div>
                <div>
                    <div class="notesappend">
                        <div class="row">
                            <div class="col-sm-8 offset-sm-2 tableappend">
                                <div class="addnotes">
                                    <!--- <div class="row appendnotes">
                                        <div class="col-sm-1">
                                            <input type="checkbox" name="textbox" class="form-check-input mt-2" />
                                        </div>
                                        <div class="col-sm-10" style="width: 192px !important;">
                                            <input type="text" name="textbox" class="form-control" placeholder="what needs to be done?" />
                                                <div class="mt-1">Text</div>
                                        </div>
                                        <div class="col-sm-1">
                                            <button> type="button" id="closeicon" class="icon btn-close mt-2" aria-label="Close"></button>
                                        </div>
                                    </div>  --->
                                </div>
                                <div class="footer mt-2">
                                    <div class="row justify-content-center">
                                        <div class="col-sm-2">
                                            <button type="button" class="btn btn-default btn-sm footerbtns" value=""><label class="countitems">0</label> items left</button>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-default btn-sm footerbtns" id="all">All</button>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-default btn-sm footerbtns" id="active" onclick="CheckActive()">Active</button>
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="button" class="btn btn-default btn-sm footerbtns" id="completed">Completed</button>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-default btn-sm footerbtns" id="clearcompleted" style="display:none;">ClearCompleted</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </center>
        </body>
    </html>
</cfoutput>

<script>

$(document).ready(function(){
    $(".footer").hide();
    $.ajax({
        type: "get",
        url: "model.cfc",
        data:{
            method: "getdata"
        },
        success:function(obj){
            $('.addnotes').empty();
            let data = jQuery.parseJSON(obj);
            if(data.length == 0){
                $(".footer").hide();
            }else{
                $(".footer").show();
            }
            for(let i = 0; i < data.length; ++i){
                var status_check = data[i].ISACTIVE;
                var html = '<div class="row appendnotes"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" ' + (status_check == '0' ? 'checked' : '') + '/></div><div class="col-sm-10" style="width: 192px !important;" ><div data-Ntid='+ data[i].ID +'  class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="icon btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                $('.addnotes').append(html);
            }
            $("#notes").val('');
                getOnlyActiveItems();
                setTimeout(function(){
                    var activeItems = sessionStorage.getItem('activeItems');
                    $('.countitems').text(activeItems);
                    // deleteItems();
            });
        }
    });
});

// button show
function buttonshow(keycode){
    if(keycode == '13'){
        $('.footer').css('display', 'block');
    }else{
        $('.footer').css('display', 'none');
    }
}

// enter key press event
$("#notes").keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    var notetext = $("#notes").val();
    var activestate = "i";
    var date = new Date();
    var data1 =" ";
    if(keycode == '13'){
        if(notetext != ""){
            $.ajax({
                type : "post",
                url : "model.cfc",
                data : {
                    method : "insertdata",
                    notes : notetext,
                    isactive : activestate
                },
                success : function(obj){
                    $(".addnotes").empty();
                    $.ajax({
                        type: "get",
                        url: "model.cfc",
                        data: {
                            method: "getdata"
                        },
                        success : function(obj){
                            let data= jQuery.parseJSON(obj);
                            for (let i = 0; i < data.length; i++){
                                var status_check = data[i].ISACTIVE;
                                var html = '<div class="row appendnotes"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" ' + (status_check == '0' ? 'checked' : '') + '/></div><div class="col-sm-10" style="width: 192px !important;" ><div data-Ntid='+ data[i].ID +'  class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="icon btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                                $(".addnotes").append(html);
                            }
                            $("#notes").val();
                            getOnlyActiveItems();
                            buttonshow(keycode);
                            // clearcmpltbtnshow();
                            setTimeout(function(){
                                var activeItems= sessionStorage.getItem('activeItems');
                                $(".countitems").text(activeItems);
                            },1000)
                        }
                    });
                }
            });
        }
    }
});

// all button
$("#all").on('click', function(){
    $.ajax({
        type: "get",
        url: "model.cfc",
        data:{
            method: "getdata"
        },
        success:function(obj){
            $('.addnotes').empty();
            let data = jQuery.parseJSON(obj);
            if(data.length == 0){
                $(".footer").hide();
            }else{
                $(".footer").show();
            }
            for(let i = 0; i < data.length; ++i){
                var status_check = data[i].ISACTIVE;
                var html = '<div class="row appendnotes"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" ' + (status_check == '0' ? 'checked' : '') + '/></div><div class="col-sm-10" style="width: 192px !important;" ><div data-Ntid='+ data[i].ID +' class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="icon btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                $('.addnotes').append(html);
            }
            $("#notes").val('');
            getOnlyActiveItems();
            setTimeout(function(){
                var activeItems = sessionStorage.getItem('activeItems');
                $('.countitems').text(activeItems);
            deleteItems();
            });
        }
    });
});

//changed isactive 0
$(".addnotes").on("click",".chooseNotes", function () {
    // clearcmpltbtnshow();
    var ntId = $(this).attr('data-Ntid');
    if(this.checked){
        ischecked = 0;
    }else{
        ischecked = 1;
    }
    $.ajax({
        type: "post",
        url: "model.cfc",
        data:{
            method: "updateData",
            id: ntId,
            isactive: ischecked
        },
        success:function(obj){
            getOnlyActiveItems();
            setTimeout(function () {
                var activeItems = sessionStorage.getItem('activeItems');
                $('.activeCount').text(activeItems);
            },1000)
        }
    });
});

//checkIsActive 0
$("#completed").on("click", function() {
    clearcmplbtnshow()
    $.ajax({
        type: "get",
        url: "model.cfc",
        data:{
            method: "getdata",
            isactive: 0
        },
        success:function(obj){
            $('.addnotes').empty();
            let data = jQuery.parseJSON(obj);
            for(let i = 0; i < data.length; ++i){
                var status_check = data[i].ISACTIVE;
                var html = '<div class="row appendnotes"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" ' + (status_check == '0' ? 'checked' : '') + '/></div><div class="col-sm-10" style="width: 192px !important;" ><div data-Ntid='+ data[i].ID +' class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="icon btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                $('.addnotes').append(html);
                clearcmplbtnshow();
            }
            getOnlyActiveItems();
            setTimeout(function(){
                var activeItems = sessionStorage.getItem('activeItems');
                $('.activeCount').text(activeItems);
            deleteItems();
            },1000)
        }
    });
});

//checkIsActive 1
function CheckActive() {
    $.ajax({
        type: "get",
        url: "model.cfc",
        data:{
            method: "getdata",
            isactive: 1
        },
        success:function(obj){
            $('.addnotes').empty();
            let data = jQuery.parseJSON(obj);
            for(let i = 0; i < data.length; ++i){
                var status_check = data[i].ISACTIVE;
                var html = '<div class="row appendnotes"><div class="col-sm-1"><input type="checkbox" name="textbox" data-isactive='+ data[i].isactive +' data-Ntid='+ data[i].ID +' class="form-check-input mt-2 chooseNotes" value="'+ data[i].ID +'" ' + (status_check == '0' ? 'checked' : '') + '/></div><div class="col-sm-10" style="width: 192px !important;" ><div data-Ntid='+ data[i].ID +' class="mt-1 editEvents">'+ data[i].NOTES +'</div></div><div class="col-sm-1"><button type="button" id="closeicon" class="icon btn-close mt-2" aria-label="Close" value="'+ data[i].ID +'"></button></div></div>';
                $('.addnotes').append(html);
            }
            getOnlyActiveItems();
            setTimeout(function(){
                var activeItems = sessionStorage.getItem('activeItems');
                $('.activeCount').text(activeItems);
            deleteItems();
            },1000)
        }
    });
}

//clear complete btn click event
$("#clearcompleted").on("click", function() {
    $.ajax({
        type: "get",
        url: "model.cfc",
        data: {
            method: "deleteData",
            isactive: 0
        },
        success:function(obj){
            $("#clearcompleted").css("display","none");
            CheckActive();
            clearbuttonDatas();
        }
    })
});

//closeicon click
$('.addnotes').on('click','#closeicon',function () {
    var ntId= $(this).val();
    $.ajax({
        type: "get",
        url: "model.cfc",
        data: {
            method: "deleteNotes",
            id: ntId
        },
        success:function(obj){
            CheckActive();
            getOnlyActiveItems();
            clearbuttonDatas();
        }
    });
});

//getActiveCount
function getOnlyActiveItems() {
    $.ajax({
        type: "get",
        url: "model.cfc",
        data: {
            method: "getActiveCount",
            isactive: 1
        },
        success:function(obj){
            let data = jQuery.parseJSON(obj);
            sessionStorage.setItem("activeItems",data.length);
        }
    })
}

//clearbutton
function clearbuttonDatas() {
    $.ajax({
        type: "get",
        url: "model.cfc",
        data: {
            method: "getActiveCount",
            isactive: 1
        },
        success:function(obj) {
            let data = jQuery.parseJSON(obj);
            if (data.length == 0){
                var keycode = 0;
                buttonshow(keycode);
            }else{
                sessionStorage.setItem("activeItems",data.length);
            }
        }
    });
}
function deleteItems(){
    sessionStorage.clear();
}

//clearcompleted button show or hide
function clearcmplbtnshow() {
    if($("input[type=checkbox]:checked").length > 0){
        $("#clearcompleted").css("display","block");
    }else{
        $("#clearcompleted").css("display","none");
    }
};

//doubleclick
$(function (){
    $(".addnotes").on("dblclick", ".editEvents", function(e){
        var ntId = $(this).attr("data-Ntid");
        e.stopPropagation();
        var currentElement = $(this);
        var value = $(this).html();
        updateVal(currentElement,value,ntId);
    });
});
function updateVal(currentElement,value,ntId) {
    $(currentElement).html('<input class="val" type="text" value="' + value + '" />');
    $(currentElement).focus();
    $(currentElement).keyup(function (event){
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode == 13){
            var changetext = $(".val").val();
            $(currentElement).html($(".val").val());
            //updatedata
            $.ajax({
                type: "post",
                url: "model.cfc",
                data: {
                    method: "updateData",
                    id: ntId,
                    notes: changetext
                },
                success:function(obj1){
                    CheckActive();
                }
            });
        }
    });
}

</script>