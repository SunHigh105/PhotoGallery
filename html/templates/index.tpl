<%extends file='parent.tpl'%>

<%block name="content"%>	
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
<%/block%>

<%block name="popup"%>
	<div id="popup-bg">
		<span id="close-popup">&times;</span>
		<div class="popup">
			<img src="https://s3-ap-northeast-1.amazonaws.com/straysheep-photogallery/IMG_3466.jpg">
		</div>
	</div>
<%/block%>