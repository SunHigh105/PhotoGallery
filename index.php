<?php
require 'vendor/autoload.php';
require 'database.php';
require 'smarty.php';

// Load .env file
$dotenv = Dotenv\Dotenv::create(__DIR__);
$dotenv->load();

$dbo = new DataObject;
$smarty = new My_Smarty;

// Display Pulldown
$category = $dbo->allCategory();
$years = $dbo->allYear();

// Display Photo & Setting index
$index = [];

if(isset($_GET['category'])){
	// Category
	$photos = $dbo->photoByCategory((int)$_GET['category']);
	$index[] = $dbo->category((int)$_GET['category']);
}else if(isset($_GET['year'])){
	// Year
	$photos = $dbo->photoByYear((int)$_GET['year']);
	$index[] = $_GET['year'];
}else{
	// Default
	$photos = $dbo->photo();
	$index = $years;
}

$IMG_URL = 'https://s3-ap-northeast-1.amazonaws.com/'.getenv('S3_BUCKET_NAME');


// Display params
$param = [
	'category' => $category,
	'years' => $years,
	'photos' => $photos,
	'index' => $index,
	'IMG_URL' => $IMG_URL,	
];

$smarty->view($param, 'index.tpl');

?>
