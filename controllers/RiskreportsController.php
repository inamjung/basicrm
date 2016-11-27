<?php

namespace app\controllers;

use Yii;
use app\models\Riskreports;
use app\models\RiskreportsSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\Json;
use yii\helpers\Url;
use yii\models\Clinics;
use yii\models\Programes;
use yii\models\Risktypes;
use kartik\widgets\DepDrop;
use yii\helpers\ArrayHelper;
use yii\helpers\BaseFileHelper;
use yii\helpers\html;

/**
 * RiskreportsController implements the CRUD actions for Riskreports model.
 */
class RiskreportsController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Riskreports models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new RiskreportsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    
    public function actionIndexriskuser()
    {
        $searchModel = new RiskreportsSearch();
        $searchModel->department_id = Yii::$app->user->identity->depname;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('indexriskuser', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Riskreports model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Riskreports model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Riskreports();

        if ($model->load(Yii::$app->request->post())) {
            
            $model->createDate = date('Y-m-d');
            $model->save();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }
    
    public function actionCreateuser()
    {
        $model = new Riskreports();

        if ($model->load(Yii::$app->request->post())) {
            
            $model->createDate = date('Y-m-d');
            $model->username = Yii::$app->user->identity->username;
            $model->save();
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('createuser', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Riskreports model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $programe = ArrayHelper::map($this->getPrograme($model->clinic_id),'id','name');
        $risktype = ArrayHelper::map($this->getRisktype($model->programe_id),'id','name');
        
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'programe'=>$programe,
                'risktype'=>$risktype,
            ]);
        }
    }

    /**
     * Deletes an existing Riskreports model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Riskreports model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Riskreports the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Riskreports::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function actionGetPrograme(){
        $out = [];
        if (isset($_POST['depdrop_parents'])){
            $parents = $_POST['depdrop_parents'];
            if ($parents != NULL){
                $clinic_id = $parents[0];
                $out = $this->getPrograme($clinic_id);
                echo Json::encode(['output'=>$out, 'selected'=>'']);
                return;
            }
        }
        echo Json::encode(['output'=>'', 'selected'=>'']);
    }    
    public function actionGetRisktype(){
        $out = [];
        if (isset($_POST['depdrop_parents'])){
            $ids = $_POST['depdrop_parents'];
            $clinic_id = empty($ids[0]) ? NULL : $ids[0];
            $programe_id = empty($ids[1]) ? NULL : $ids[1];
            if ($clinic_id !=NULL){
                $data = $this->getRisktype($programe_id);
                echo Json::encode(['output'=>$data, 'selected'=>'']);
                return;
            }
        }
        echo Json::encode(['output'=>'', 'selected'=>'']);
    }     
    protected function getPrograme($id){
        $datas = \app\models\Programes::find()->where(['clinic_id'=>$id])->all();
        return $this->MapData($datas,'id','name');
    }
    
    protected function getRisktype($id){
        $datas = \app\models\Risktypes::find()->where(['programe_id'=>$id])->orderBy('name ASC')->all();
        return $this->MapData($datas,'id','name');
    }

public function actionGetUser(){
        $out = [];
        if (isset($_POST['depdrop_parents'])){
            $parents = $_POST['depdrop_parents'];
            if ($parents != NULL){
                $department_id = $parents[0];
                $out = $this->getUser($department_id);
                echo Json::encode(['output'=>$out, 'selected'=>'']);
                return;
            }
        }
        echo Json::encode(['output'=>'', 'selected'=>'']);
    }    
    
    protected function getUser($id){
        $datas = \app\models\Users::find()->where(['department_id'=>$id])->all();
        return $this->MapData($datas,'id','name');
    }
    
    protected function MapData($datas,$fieldID,$fieldName){
        $obj = [];
        foreach ($datas as $key => $value){
            array_push($obj, ['id'=>$value->{$fieldID},'name'=>$value->{$fieldName}]);
        }
        return $obj;
    }
}
