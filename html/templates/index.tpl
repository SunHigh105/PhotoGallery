<%extends file='parent.tpl'%>

<%block name="content"%>	
	<h1>2019</h1>
	<div class="wrapper">
	<%foreach from=$objects item=obj%>
		<div class="photo-entry">
			<a href="#">
				<figure class="photoframe">
					<img src=<%$IMG_URL%>/<%$obj.Key%>>
				</figure>
			</a>
		</div>
	<%/foreach%>
	</div>
<%/block%>

<%block name="popup"%>
	<div id="popup-bg">
		<span id="close-popup">&times;</span>
		<div class="popup">
			<img src="">
			<div class="caption">
				<p>キャプションだよん</p>
			</div>
		</div>
	</div>
<%/block%>