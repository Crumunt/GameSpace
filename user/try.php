<?php

$snapshot_files = glob('../assets/snapshots/*');

$conn = mysqli_connect('localhost', 'root', '', 'gamespace');

$sql = "SELECT * FROM tbl_products WHERE deleted_at IS NULL";

$stmt = mysqli_query($conn, $sql);

$snapshots_in_use = [];

while($row = mysqli_fetch_assoc($stmt)) {
    foreach(unserialize($row['snapshots']) as $image) {
        $snapshots_in_use[] = $image;
    }
}
// print_r($snapshot_files);
$count = 1;
foreach($snapshot_files as $file) {
    $file_name = end(explode('/', $file));
    if(!in_array($file_name, $snapshots_in_use)) {
        echo "this be unlisted $file_name $count<br>";
        $count++;
    }
}

echo count($snapshot_files);

// echo (array_intersect($snapshot_files, $snapshots_in_use)) ? 'they be mixin' : 'they be not';
// var_dump($snapshots_in_use);