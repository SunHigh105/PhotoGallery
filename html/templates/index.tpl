<%include file='header.tpl'%>
	<h1>2019</h1>
	<%foreach from=$objects item=obj%>
		<article class="photo-entry">
			<figure class="photoframe">
				<img src=<%$IMG_URL%>/<%$obj.Key%>>
			</figure>
		</article>
	<%/foreach%>
<%include file='footer.tpl'%>