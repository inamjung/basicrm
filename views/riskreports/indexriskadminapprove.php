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

<!--    <h1><?= Html::encode($this->title) ?></h1>-->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

<!--    <p>
        <?= Html::a('Create Riskreports', ['create'], ['class' => 'btn btn-success']) ?>
    </p>-->
    <div class="panel panel-primary">
        <div class="panel-heading"> รายการความเสี่ยงที่รายงานมาใหม่</div>
        <div class="panel-body">
            <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'formatter'=>['class'=>'yii\i18n\Formatter','nullDisplay'=>'-'],
        'hover'=>true ,
        'striped'=>false,        
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'date',
//            [
//                'attribute'=>'clinic_id',
//                'value'=>'riskclinic.name'
//            ],
//            [
//                'attribute'=> 'programe_id',
//                'value'=>'riskprograme.name'
//            ],
//            [
//                'attribute'=>'risktype_id',
//                'value'=>'riskrisktype.name'
//            ],           
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

           [
                'class' => 'yii\grid\ActionColumn',
                'options'=>['style'=>'width:120px;'],
                'template'=>'<div class="btn-group btn-group-sm" role="group" aria-label="...">{update}</div>',
                'buttons'=>[
//                    'view'=>function($url,$model,$key){
//                        return Html::a('<i class="glyphicon glyphicon-eye-open"></i>',$url,['class'=>'btn btn-default']);
//                    }, 
                     'update'=>function($url,$model,$key){
                        return Html::a('APPROVE', ['riskreports/updateadmin', 'id' => $model->id], ['class' => 'btn btn-warning']);
                    }, 
//                    'delete'=>function($url,$model,$key){
//                         return Html::a('<i class="glyphicon glyphicon-trash"></i>', $url,[
//                                'title' => Yii::t('yii', 'Delete'),
//                                'data-confirm' => Yii::t('yii', 'คุณต้องการลบไฟล์นี้?'),
//                                'data-method' => 'post',
//                                'data-pjax' => '0',
//                                'class'=>'btn btn-default'
//                                ]);
//                    }
                ]
            ],
        ],
    ]); ?>
        </div>
    </div>    
</div>
