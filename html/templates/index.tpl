<%include file='header.tpl'%>
	<h1>2019</h1>
	<div class="wrapper">
	<%foreach from=$objects item=obj%>
		<div class="photo-entry">
			<figure class="photoframe">
				<img src=<%$IMG_URL%>/<%$obj.Key%>>
			</figure>
		</div>
	<%/foreach%>
	</div>
<%include file='footer.tpl'%>