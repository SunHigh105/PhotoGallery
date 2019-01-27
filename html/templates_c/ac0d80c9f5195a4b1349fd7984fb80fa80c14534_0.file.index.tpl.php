<?php
/* Smarty version 3.1.33, created on 2019-01-27 12:45:25
  from '/var/www/html/templates/index.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.33',
  'unifunc' => 'content_5c4da7e52d0b29_83301396',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ac0d80c9f5195a4b1349fd7984fb80fa80c14534' => 
    array (
      0 => '/var/www/html/templates/index.tpl',
      1 => 1548593121,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_5c4da7e52d0b29_83301396 (Smarty_Internal_Template $_smarty_tpl) {
?><html>
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h2>Hello, PhotoGallery!</h2>
		<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['objects']->value, 'obj');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['obj']->value) {
?>
				<img src=<?php echo $_smarty_tpl->tpl_vars['IMG_URL']->value;?>
/<?php echo $_smarty_tpl->tpl_vars['obj']->value['Key'];?>
 style="width:200px">
		<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
	</body>
</html><?php }
}
