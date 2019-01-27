<?php
use Aws\S3\S3Client;
use Aws\S3\Exception\S3Exception;

require 'vendor/autoload.php';

$smarty = new Smarty();

$smarty->template_dir = './templates/';
$smarty->compile_dir  = './templates_c/';

// Load .env file
$dotenv = Dotenv\Dotenv::create(__DIR__);
$dotenv->load();

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
$smarty->assign([
	'IMG_URL' => $IMG_URL,
	'objects' => $result['Contents']
]);

$smarty->display('index.tpl');

?>
