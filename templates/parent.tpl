<%* Smarty *%>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Photo Gallery</title>
        <link rel="stylesheet" type="text/css" href="css/style.css?<%time()%>">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="js/main.js?<%time()%>"></script>
	</head>
	<body>
        <div id = "loader-bg">
            <div id="loader">
                <img src="img/loading.gif">
            </div>
        </div> 
        <header class="site-header">
            <div id="header-inner">
                <div id="logo">Photo Gallery</div>
                <div id="pulldown">
                    <input id="nav-input" type="checkbox" class="nav-unshown">
                    <label id="nav-open" for="nav-input"><span></span></label>
                    <label class="nav-unshown" id="nav-close" for="nav-input"></label>
                    <div id="nav-content">
                        <ul class="menu-first-level">
                            <li>
                                <span>Category</span>
                                <ul class="menu-second-level">
                                <%foreach from=$category item=row%>
                                    <li><%$row.name%></li>
                                <%/foreach%>
                                </ul>
                            </li>
                                
                            <li>
                                <span>Backnumber</span>
                                <ul class="menu-second-level">
                                    <li>2019</li>
                                    <li>2018</li>
                                    <li>2017</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <div class="page-bg">
            <div class="container">
            <%block "content"%><%/block%>
            </div>
        </div>
        <%block "popup"%><%/block%>
    </body>
    <footer>
        <p>©️2019 Ayaka Hidaka</p>
    </footer>
</html>