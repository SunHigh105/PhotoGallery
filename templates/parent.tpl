<%* Smarty *%>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%if $index|@count <= 1%>
            <title><%$index[0]%> | Photo Gallery</title>
        <%else%>
            <title>Photo Gallery</title>
        <%/if%>
        <link rel="shortcut icon" href="img/favicon.ico">
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
                <div id="logo"><a href="/">Photo Gallery</a></div>
                <div id="pulldown">
                    <input id="nav-input" type="checkbox" class="nav-unshown">
                    <label id="nav-open" for="nav-input"><span></span></label>
                    <label class="nav-unshown" id="nav-close" for="nav-input"></label>
                    <div id="nav-content">
                        <ul class="menu-first-level">
                            <li>
                                <span>Category</span>
                                <ul class="menu-second-level category">
                                    <%foreach from=$category item=row%>
                                        <a href="index.php?category=<%$row.id%>"><li><%$row.name%></li></a>
                                    <%/foreach%>
                                </ul>
                            </li>
                                
                            <li>
                                <span>Backnumber</span>
                                <ul class="menu-second-level backnumber">
                                    <%foreach from=$years item=year%>
                                        <a href="index.php?year=<%$year%>"><li><%$year%></li></a>
                                    <%/foreach%>
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