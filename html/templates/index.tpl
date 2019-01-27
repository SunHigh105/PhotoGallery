{* Smarty *}
<html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h2>Hello, PhotoGallery!</h2>
		{foreach from=$objects item=obj}
				<img src={$IMG_URL}/{$obj.Key} style="width:200px">
		{/foreach}
	</body>
</html>