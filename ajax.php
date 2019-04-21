<?php
require 'database.php';

$dbo = new DataObject;

if(isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'){  
    if(isset($_POST['photo_id'])){
        try{
            $sql = 'select date_token, comment from photo where id = :id ;';
            $stmt = $dbo->dbObject()->prepare($sql);
            $stmt->bindValue(':id', $_POST['photo_id']);
            $stmt->execute();
            foreach($stmt->fetchAll() as $row){
                echo json_encode($row);
            }
        }catch(PDOException $e){
            $e->getMessage;
            die();
        }
    }
}