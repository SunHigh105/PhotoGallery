<%extends file='parent.tpl'%>

<%block name="content"%>
	<%foreach from=$years item=year%>	
		<h1 id="<%$year%>"><%$year%></h1>
		<div class="wrapper">
		<%foreach from=$caption item=row%>
			<%if $row.date_token|substr:0:4 == $year%>
				<figure class="col-3 photoframe" photo-id=<%$row.id%> category=<%$row.category_id%>>
					<img src=<%$IMG_URL%>/<%$row.capture_path%>>
				</figure>
			<%/if%>
		<%/foreach%>
		</div>
	<%/foreach%>
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