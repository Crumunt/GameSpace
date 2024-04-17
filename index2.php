<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</head>
<?php

try {
	$conn = mysqli_connect('localhost', 'root', '', 'gamespace');
} catch (Exception $e) {
	echo "Error: " . $e;
}
require 'vendor/autoload.php';
$apiKey = '7a5a0dfaf00c440d8e0d9c6d41bb7840';
try {
	$client = new GuzzleHttp\Client();
} catch (Exception $e) {
	echo $e;
}

// $response = $client->get("https://api.rawg.io/api/games/10035?key={$apiKey}")->getBody();
// $response = json_decode($response);

// var_dump($response->developers);

// $genres = $response->genres;

// foreach ($response->developers as $developer) {
// 	echo "{$developer->name} <br>";
// }

$sql = "SELECT * FROM tbl_products";
$data = mysqli_query($conn, $sql);

while ($row = mysqli_fetch_assoc($data)) {

	// echo $row['product_name'];

	$product_id = $row['id'];

	echo "<h1>{$row['product_name']}</h1>";
	echo "$product_id <br>";
	foreach (unserialize($row['product_platforms']) as $category) {
		$cSQL = "SELECT id FROM tbl_platforms WHERE platform_name = '{$category}'";
		$cID = mysqli_query($conn, $cSQL);
		$id = mysqli_fetch_assoc($cID);
		$caID = $id['id'];
		echo $caID . "<br>";
		$sSql = "INSERT INTO tbl_product_platforms (`product_id`, `platform_id`) VALUES ($product_id, $caID)";

		try {
			mysqli_query($conn, $sSql);
			// $stmt = mysqli_prepare($conn, "INSERT INTO tbl_product_platforms (product_id, platform_id) VALUES (?, ?)");
			// mysqli_stmt_bind_param($stmt, "ii", $product_id, $caID);
			// mysqli_stmt_execute($stmt);
		} catch (Exception $e) {
			echo "ERROR: $e";
		}
	}
}

// $row = mysqli_fetch_assoc($data);
// // unserialize($row['game_category']);
// foreach(unserialize($row['game_category']) as $category) {
// 	echo "$category <br>";
// }

// foreac

// $count = 1;
// for ($i = 0; $i < 200; $i++) {

// 	$sql = "SELECT * FROM tbl_products LIMIT 1";
// 	$data = mysqli_query($conn, $sql);


// 	while ($row = mysqli_fetch_assoc($data)) {
// 		$id = $row['product_name'];
// 		// $response = $client->get("https://api.rawg.io/api/games/{$id}?key={$apiKey}")->getBody();
// 		// $response = json_decode($response);

// 		// $desc = str_replace("'", "\'", $response->description);
// 		// $bg = $response->image_background;
// 		// $sql = "UPDATE tbl_categories SET description = '$desc',background_image = '$bg'  WHERE id = $id";


// 		$sql = "UPDATE tbl_products SET id = {$count} WHERE product_name = '{$id}'";

// 		// $array = [];
// 		// foreach ($response->developers as $record) {
// 		// 	array_push($array, $record->name);
// 		// }
// 		// $sArray = serialize($array);
// 		// $sArray2 = str_replace("'", "\'", $sArray);
// 		// $sql .= "'$sArray2' WHERE id = $id";

// 		try {
// 			mysqli_query($conn, $sql);
// 		} catch (Exception $e) {
// 			echo "ERROR: $e";
// 			exit();
// 		}
// 		echo "{$row['id']} DONE <br>";
// 		$count++;
// 	}
// }
