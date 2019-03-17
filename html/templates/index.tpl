<%extends file='parent.tpl'%>

<%block name="content"%>	
	<h1>2019</h1>
	<div class="wrapper">
	<%foreach from=$objects item=obj%>
		<figure class="col-3 photoframe">
			<img src=<%$IMG_URL%>/<%$obj.Key%>>
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
				<p>2018/03/24</p>
				<p>目黒川の桜並木
				視界が一面桜に覆われて圧巻だった</p>
			</div>
		</div>
	</div>
<%/block%>