<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ProgramesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Programes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="programes-index">

<!--    <h1><?= Html::encode($this->title) ?></h1>-->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('<i class="glyphicon glyphicon-plus"></i> เพิ่มข้อมูล', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <div class="panel panel-info">
        <div class="panel-heading"> รายการโปรแกรม</div>
        <div class="panel-body">
            <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'hover'=>true,  
        'striped'=>FALSE,        
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

//            'id',
            'name',
           // 'clinic_id',
            //'programeclinic.name',
            [
                'attribute'=>'clinic_id',
                'value'=>'programeclinic.name',
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
        </div>
    </div> 
</div>
