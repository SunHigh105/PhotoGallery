<%extends file='parent.tpl'%>

<%block name="content"%>
	<%foreach from=$index item=row%>
		<div class="index">	
			<h1 id="<%$row%>"><%$row%></h1>
			<p class="posts"></p>
		</div>
		<div class="wrapper">
		<%if $index|@count >= 2 %>
			<%foreach from=$photos item=photo%>
				<%if $photo.date_token|substr:0:4 == $row%>
					<figure class="col-3 photoframe" photo-id=<%$photo.id%> category=<%$photo.category_id%>>
						<div><img src=<%$IMG_URL%>/<%$photo.capture_path%>></div>
					</figure>
				<%/if%>
			<%/foreach%>
		<%else%>
			<%foreach from=$photos item=photo%>
				<figure class="col-3 photoframe" photo-id=<%$photo.id%> category=<%$photo.category_id%>>
					<div><img src=<%$IMG_URL%>/<%$photo.capture_path%>></div>
				</figure>
			<%/foreach%>
		<%/if%>
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