<%extends file='parent.tpl'%>

<%block name="content"%>	
	<h1>2019</h1>
	<div class="wrapper">
	<%foreach from=$caption item=row%>
		<figure class="col-3 photoframe" photo-id=<%$row.id%> category=<%$row.category_id%>>
			<img src=<%$IMG_URL%>/<%$row.capture_path%>>
		</figure>
	<%/foreach%>
	</div>
<%/block%>

<%block name="popup"%>
	<div id="popup-bg">
		<span id="close-popup">&times;</span>
		<div class="popup">
			<img src="">
			<div class="caption">
				<p class="date-token"></p>
				<p class="comment"></p>
			</div>
		</div>
	</div>
<%/block%>