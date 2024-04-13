<?php
class Dbh {
	private $dbh;
	protected function connect() {
		try {
			$servername = 'localhost';
			$username = 'root';
			$password = '';
			$db_name = 'gamespace';

			$this->dbh = new PDO("mysql:host=$servername;dbname=$db_name", $username, $password);
			return $this->dbh;
		} catch (Exception $e) {
			echo "ERROR: $e";
		}
	}

}