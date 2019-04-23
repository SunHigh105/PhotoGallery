<?php
class DataObject{
    public function dbObject(){
        $pdo = new PDO(
            'pgsql:dbname=photogallery host=photogallery_db_1 port=5432',
            'pguser',
            'heavyMellow',
            [
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            ]
        );
        return $pdo;
    }
    //カテゴリ
    public function category($id){
        try{
            $sql = 'select name from category where id = :id';
            $stmt = $this->dbObject()->prepare($sql);
            $stmt->bindValue(':id', $id);
            $stmt->execute();
            return $stmt->fetchColumn();
        }catch(PDOException $e){
            $e->getMessage;
            die();
        }
    }

    public function allCategory(){
        try{
            $sql = 'select * from category';
            $stmt = $this->dbObject()->query($sql);
            $result = [];
            foreach($stmt->fetchAll() as $row){
                $result[] = $row;
            }
            return $result;
        }catch(PDOException $e){
            $e->getMessage;
            die();
        }
    }
    
    public function photo(){
        try{
            $sql = 'select id, date_token, capture_path, category_id from photo order by date_token desc';
            $stmt = $this->dbObject()->query($sql);
            $result = [];
            foreach($stmt->fetchAll() as $row){
                $result[] = $row;
            }
            return $result;
        }catch(PDOException $e){
            $e->getMessage;
            die();
        }
    }

    public function photoByCategory($category_id){
        try{
            $sql = 'select id, date_token, capture_path, category_id from photo where category_id = :id order by date_token desc;';
            $stmt = $this->dbObject()->prepare($sql);
            $stmt->bindValue(':id', $category_id);
            $stmt->execute();
            $result = [];
            foreach($stmt->fetchAll() as $row){
                $result[] = $row;
            }
            return $result;
        }catch(PDOException $e){
            $e->getMessage;
            die();
        }
    }

    public function photoByYear($year){
        try{
            $sql = 'select id, date_token, capture_path, category_id from photo where date_token between :start and :last order by date_token desc;';
            $stmt = $this->dbObject()->prepare($sql);
            $stmt->bindValue(':start', $year.'-01-01');
            $stmt->bindValue(':last', $year.'-12-31');
            $stmt->execute();
            $result = [];
            foreach($stmt->fetchAll() as $row){
                $result[] = $row;
            }
            return $result;
        }catch(PDOException $e){
            $e->getMessage;
            die();
        }
    }

    public function allYear(){
        $photos = $this->photo();

        $result = [];
        foreach($photos as $row){
            $year = substr($row['date_token'], 0, 4);
            if(!in_array($year, $result)){
                $result[] = $year;
            }
        }
        return $result;
    }
}
?>
