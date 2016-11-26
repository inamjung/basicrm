<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RisktypesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Risktypes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="risktypes-index">

<!--    <h1><?= Html::encode($this->title) ?></h1>-->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('<i class="glyphicon glyphicon-plus"></i> เพิ่มข้อมูล', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
     <div class="panel panel-primary">
        <div class="panel-heading"> รายการความเสี่ยง</div>
        <div class="panel-body">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'hover'=>true,  
        'striped'=>FALSE, 
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            //'id',
            'name',
            //'programe_id',
            [
                'attribute'=>'programe_id',
                'value'=>'risktypeprograme.name',
            ],
            

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
 </div>
    </div> 
</div>
