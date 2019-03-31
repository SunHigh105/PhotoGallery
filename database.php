<html>
	<head>
        <meta charset="utf-8">
    </head>
    <body>
    <?php
    try{
        $pdo = new PDO(
            'pgsql:dbname=photogallery host=localhost port=5432',
            'root',
            ''
        );
        $sql = 'select * from category;';
        foreach($pdo->query($sql) as $row){
            var_dump($row);
        }

    }catch(PDOException $e){
        print($e->getMessage);
        die();
    }
    ?>
    </body>
</html>