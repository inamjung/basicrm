<?php
$this->title = 'ความเสี่ยงตามหน่วยงานที่แจ้ง';

use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use kartik\grid\GridView;
use yii\data\ArrayDataProvider;
use yii\helpers\Url;
use yii\widgets\Pjax;
use kartik\widgets\Select2;
use yii\widgets\ActiveForm;
use miloschuman\highcharts\Highcharts;
$datas = $dataProvider->getModels();
?>


<?php
$form = ActiveForm::begin(['method' => 'get',
            'action' => Url::to(['report/report1']),]);
?>
<div class='well'>   
    ระหว่างวันที่:
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4">
            <?php
            echo yii\jui\DatePicker::widget([
                'name' => 'date1',
                'value' => $date1,
                'language' => 'th',
                'dateFormat' => 'yyyy-MM-dd',
                'clientOptions' => [
                    'changeMonth' => true,
                    'changeYear' => true,
                ],
                'options' => [
                    'class' => 'form-control'
                ],
            ]);
            ?>
            ถึงวันที่:
            <?php
            echo yii\jui\DatePicker::widget([
                'name' => 'date2',
                'value' => $date2,
                'language' => 'th',
                'dateFormat' => 'yyyy-MM-dd',
                'clientOptions' => [
                    'changeMonth' => true,
                    'changeYear' => true,
                ],
                'options' => [
                    'class' => 'form-control'
                ],
            ]);
            ?>
        </div>              
        <div class="col-xs-2 col-sm-2 col-md-2">
            <button class='btn btn-danger'>ประมวลผล</button>
        </div>
    </div>
    <br>
<?php ActiveForm::end(); ?>
<div class="panel panel-info">
    <div class="panel-heading">
        <i class="glyphicon glyphicon-wrench"></i>
        แผนกที่รายงาน
    </div>
    <div class="panel-body"> 
        <?php Pjax::begin(); ?> 
        <?php
        echo \kartik\grid\GridView::widget([
            'dataProvider' => $dataProvider,
            'formatter' => ['class' => 'yii\i18n\Formatter', 'nullDisplay' => '-'],
            //'filterModel' => $searchModel,
            'responsive' => TRUE,
            'hover' => true,
            'striped' => FALSE,
            'exportConfig' => [
                GridView::EXCEL => []
            ],
            'floatHeader' => FALSE,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],
                [
                    'attribute' => 'name',
                    'label' => 'แผนก'
                ],
                [
                    'attribute' => 'total',
                    'label' => 'จำนวน'],
            ],
        ]);
        ?>
        <?php Pjax::end() ?>
    </div>
</div>
</div>            
<?php
$script = <<< JS
$(function(){
    $("label[title='Show all data']").hide();
});
        
$('#btn_sql').on('click', function(e) {
    
   $('#sql').toggle();
});
JS;
$this->registerJs($script);
?>

<div id="chart1"></div>
<?php
echo Highcharts::widget([
    'options' => [
        'title' => ['text' => 'แผนกที่รายงาน'],
        'xAxis' => [
            'categories' => $name
        ],
        'plotOptions' => [
            'pie' => [
                'cursor' => 'pointer',
            ],
        ],
        'series' => [
            [
                'name' => 'จำนวน',
                'data' => $total,
                'type' => 'column',
            ],
        ]
    ]
]);
?>
</div>
