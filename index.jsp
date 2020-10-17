<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>weFurnish | Search</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">

</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="/">weFurnish</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                <a class="nav-link" href="#">About</a>
                <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
            <ul class="navbar-nav navbar-right">
                <li><a class="nav-link" href="#">Create Ad <i class="fas fa-plus-square"></i></a></li>
                <li><a class="nav-link" href="#">Login <i class="fas fa-user"></i></a></li>
                <li><a class="nav-link" href="#">Signup <i class="fas fa-user-plus"></i></a></li>
            </ul>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top: 5%;">
        <h1>Search</h1>
        <div class="row">
            <div class="col-md-12">
                <table id="invtbl" class="table table-bordered" cellpadding="0" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>

    <script src="component/jquery/jquery.js" type="text/javascript"></script>
    <script src="component/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="component/jquery.validate.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>


    <script>
        fetchAll();
        
        function fetchAll() {
            $("#invtbl").dataTable().fnDestroy();
            $.ajax({
                url: "products.jsp",
                type: "GET",
                dataType: "JSON",

                success:function(data){
                    $("#invtbl").dataTable({
                        "aaData":data,
                        "scrollX":true,
                        "aoColumns":[
                            { "sTitle":"Product Name", "mData": "name" },
                            { "sTitle":"Product Type", "mData": "type" },
                            { "sTitle":"seller", "mData": "seller" },
                            { "sTitle":"Price", "mData": "price" },
                            {
                                "data": "url",
                                "render": function (data) {
                                    return '<img src="' + data + '" class="avatar" width="200" height="200"/>';
                                }
                            }
                        ]
                    });
                }
            });
        }
    </script>

</body>
</html>