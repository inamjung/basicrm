<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DepartmentsRiskSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Departments Risks';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="departments-risk-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Departments Risk', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            'nameeng',
            'group_id',
            'total',
            // 'total_Y',
            // 'total_N',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
