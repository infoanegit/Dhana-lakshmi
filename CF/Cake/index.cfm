<cfoutput>
    <!DOCTYPE HTML>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <link rel="stylesheet" href="./assets/CSS/bs.css">
            <style>
                .bg{
                        background-image: url('./assets/IMAGES/minibg2.jpg');
                        background-repeat: no-repeat;
                        background-position: center;
                        background-size: 800px 550px;
                    }
            </style>
        </head>
        <body class="bg">
            <div class="container" id="form">
                <h1 align="center"> <b>Order Your Cake!</b> </h1>
                <form method="POST" class="form" name="myform" enctype="multipart/form-data">
                    <center>
                        <div class="w-50">
                            <img src="./assets/IMAGES/cake3.png" width="33" height="40"><br>
                            <input type="radio" class="cake" id="radio1" name="optradio" value="20">
                            <label class="cake label">Round Cake 6" - serves 8 people($20)</label><br>
                            <input type="radio" class="cake" id="radio1" name="optradio" value="25">
                            <label class="cake label">Round Cake 8" - serves 12 people($25)</label><br>
                            <input type="radio" class="cake" id="radio1" name="optradio" value="35">
                            <label class="cake label" >Round Cake 10" - serves 16 people($35)</label><br>
                            <input type="radio" class="cake" id="radio1" name="optradio" value="75">
                            <label class="cake label">Round Cake 12" - serves 30 people($75)</label><br>                   
                        </div>
                        <div class="select-style mt-3 w-50" >
                            <label class="cake label"><h4>Choose your cake flavour</h4></label><br>
                            <select id="cake_flavour" class="cake mt-1" name="cake_flavour">
                                <option value="0" selected="selected">Select One</option>
                                <option value="6" > vanilla($6) </option>
                                <option value="10" > Red Velvet($10) </option>
                                <option value="10" > Black Forest($10) </option>
                                <option value="15" > Blueberry($15) </option>
                                <option value="17" > Banana($17) </option>
                                <option value="20" > Kit kat($20) </option>
                                <option value="25" > Rasmalai($25) </option> 
                                <option value="30" > Butterscotch($30) </option>
                                <option value="35" > Confetti($35) </option>
                                <option value="40" > Caramel($40) </option>
                                <option value="45" > Cheesecake($45) </option>
                                <option value="50" > Ferrero Rocher($50) </option> 
                                </select>
                        </div>
                        <div class="mt-3 w-50">
                            <input type="checkbox" class="cake" id="check1" name="option1" value="5">
                            <label class="label1">Include Candles($5):</label><br>
                            <img src="./assets/IMAGES/candles.png" width="33" height="40"><br>
                        </div>
                        <div class="w-50">
                            <input type="checkbox" class="cake" id="check2" name="option2" value="20">
                            <label class="label2">Include Inscription($20):</label><br>
                            <input type="text" class="cake" id="cake11"name="inscription"style="display:none">
                        </div>
                        <div class="mt-3 w-50">
                            <label class="label" id="price">Total amount for order:<div><b> $<span>0</span></b></div></label><br>
                        </div>
                    </center>
                </form>
            </div>
        </body>
        <script>
            $(document).ready(function () {
                $("##form").change(function () {
                    var totalPrice = 0,
                    values         = [];
                    $('input[type=radio], ##cake_flavour option:selected, input[type=checkbox], input[type=checkbox]').each(function() {
                        if($(this).is(':checked') ){
                            values.push($(this).val());
                            totalPrice += parseInt($(this).val());
                        }
                    });
                    $("##price span").text(totalPrice);
                });
                $('##check2').change(function () {
                    if ($('##check2').is(':checked') ) {
                        $('##cake11').css('display',"block");
                    } else {
                        $('##cake11').css('display',"none");
                    }
                });
            });
        </script>
    </html>
</cfoutput>

