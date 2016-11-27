<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RiskreportsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Riskreports';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="riskreports-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Riskreports', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'formatter'=>['class'=>'yii\i18n\Formatter','nullDisplay'=>'-'],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

           // 'id',
            'date',
            'clinic_id',
            'programe_id',
            'risktype_id',
            'name:ntext',
            // 'description:ntext',
            'namecode',
            // 'sufferer',
            // 'edit',
            // 'user_id_report',
            
            [
                'attribute'=>'department_id',
                'value'=>'riskdepartment.name'
            ],
             [
                'attribute'=>'department_id_risk',
                'value'=>'riskdepartmentrisk.name'
            ],
            [
            'class' => 'kartik\grid\BooleanColumn',
            'attribute' => 'review',            
            ], 
             [
            'class' => 'kartik\grid\BooleanColumn',
            'attribute' => 'approve',            
            ],
            // 'edit_begin:ntext',
            // 'money',
            // 'moneydetail',
            // 'how',           
            // 'reviewdate',
            // 'reviewdetail:ntext',
            // 'reviewteam',            
            // 'qaapprove',
            // 'review_in',
            // 'review_by',
            // 'review_dateline',
            // 'qateam',
            // 'username',
            // 'covenant',
            // 'docs:ntext',
            // 'ref',
            // 'complete',
            // 'createDate',
            // 'updateDate',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
