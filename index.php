<?php
use Aws\S3\S3Client;
use Aws\S3\Exception\S3Exception;

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

// Get Pictures from S3
$s3client = S3Client::factory([
	'credentials' => [
			'key' => getenv('AWS_ACCESS_KEY_ID'),
			'secret' => getenv('AWS_SECRET_ACCESS_KEY'),
	],
	'region' => 'ap-northeast-1',
	'version' => 'latest'
]);

try {
	// Get all objects in S3 bucket.
	$result = $s3client->listObjects([
		'Bucket' => getenv('S3_BUCKET_NAME')
	]);
} catch (S3Exception $e) {
	echo $e->getMessage() . PHP_EOL;
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
