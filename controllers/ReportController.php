<?php


namespace app\controllers;
use yii\helpers\ArrayHelper;
use yii;
use yii\data\ArrayDataProvider;

class ReportController extends \yii\web\Controller {

    public $enableCsrfValidation = false;

    public function actionIndex() {
        return $this->render('index');
    }
    public function actionReport1($date1 = null, $date2 = null,$name=null,$total=null) {

        if ($date1 == null) {
            $date1 = date('Y-m-d');
            $date2 = date('Y-m-d');           
        }
        $connection = Yii::$app->db;
        $data = $connection->createCommand("
            SELECT d.`name` , COUNT(r.id) total
            FROM riskreports r
            LEFT JOIN departments d on d.id=r.department_id
            WHERE r.date between '$date1' and '$date2'
            GROUP BY d.id
                ")->queryAll();
        
        
       for ($i = 0; $i < sizeof($data); $i++) {           
            $name[] = $data[$i]['name'];
            $total[] = $data[$i]['total']*1;
            
        }
        $dataProvider = new ArrayDataProvider([
                'allModels'=>$data, 
            ]);
        return $this->render('report1',[
                'dataProvider'=>$dataProvider,               
                'date1'=>$date1,
                'date2'=>$date2,
                'total'=>$total,  
                'name'=>$name
            ]);       
    }
}

