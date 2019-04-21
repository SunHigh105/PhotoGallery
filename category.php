<?php
require 'vendor/autoload.php';
require 'database.php';
require 'smarty.php';

// Load .env file
$dotenv = Dotenv\Dotenv::create(__DIR__);
$dotenv->load();

$dbo = new DataObject;
$smarty = new My_Smarty;

// Display Category
$category = $dbo->category();

// Display Caption
$caption = $dbo->photoByCategory((int)$_GET['category_id']);

foreach($category as $row){
    if($row['id'] == $_GET['category_id']){
        $this_category = $row;
        break;
    }
}

if(!$this_category){
    header('Location: index.php');
    exit;
}

$IMG_URL = 'https://s3-ap-northeast-1.amazonaws.com/'.getenv('S3_BUCKET_NAME');

// Setting date range
$years = [];
foreach($caption as $row){
	$year = substr($row['date_token'], 0, 4);
	if(!in_array($year, $years)){
		$years[] = $year;
	}
}

// Display params
$param = [
    'category' => $category,
    'this_category' => $this_category,
	'caption' => $caption,
	'IMG_URL' => $IMG_URL,
	'years' => $years
];

$smarty->view($param, 'category.tpl');
