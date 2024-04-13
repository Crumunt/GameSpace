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

$response = $client->get("https://api.rawg.io/api/games/10035?key={$apiKey}")->getBody();
$response = json_decode($response);

// var_dump($response->genres);

// $genres = $response->genres;

// foreach($genres as $genre) {
// 	echo "{$genre->name} <br>";
// }

// foreac

for ($i = 0; $i < 20; $i++) {
	$sql = "SELECT * FROM tbl_products WHERE game_category = '' LIMIT 20";
	$data = mysqli_query($conn, $sql);

	while($row = mysqli_fetch_assoc($data)) {
		$id = $row['product_id'];
		$response = $client->get("https://api.rawg.io/api/games/{$id}?key={$apiKey}")->getBody();
		$response = json_decode($response);

		// $desc = str_replace("'", "\'", $response->description);
		// $bg = $response->image_background;
		// $sql = "UPDATE tbl_categories SET description = '$desc',background_image = '$bg'  WHERE id = $id";


		$sql = "UPDATE tbl_products SET game_category = ";

		$array = [];
		foreach($response->genres as $record) {
			array_push($array, $record->name);
		}
		$sArray = serialize($array);
		$sArray2 = str_replace("'", "\'", $sArray);
		$sql .= "'$sArray2' WHERE product_id = $id";

		try {
			mysqli_query($conn, $sql);
		} catch (Exception $e) {
			echo "ERROR: $e";
		}
		echo "{$row['product_name']} DONE <br>";
	}
}
