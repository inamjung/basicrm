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

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Programes', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
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
