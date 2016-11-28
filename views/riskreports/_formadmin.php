<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use yii\models\Clinics;
use yii\models\Programes;
use yii\models\Risktypes;
use kartik\widgets\DepDrop;
use kartik\checkbox\CheckboxX;
use yii\helpers\Url;
use dosamigos\datepicker\DatePicker;


/* @var $this yii\web\View */
/* @var $model app\models\Riskreports */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="riskreports-form">

    <?php $form = ActiveForm::begin(); ?>
    <div class="row">       
                <div class="col-xs-2 col-sm-2 col-md-2">
                    <?= $form->field($model, 'approve')->widget(CheckboxX::className(),[
                        'pluginOptions'=>[
                        'threeState'=>FALSE
                        ]
                    ]) ?>
                </div>
            </div>
    <div class="row">
        <div class="col-xs-3 col-sm-3 col-md-3">
            <?= $form->field($model, 'date')->widget(
    DatePicker::className(), [
        // inline too, not bad
        'language'=>'th',
         'inline' => FALSE, 
         // modify template for custom rendering       
        'clientOptions' => [
            'autoclose' => true,
            'format' => 'yyyy-mm-dd',
            'todayHighlight'=>true
        ],
        'options'=>[
            'disabled'=>true
        ]
]);?>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4">
            <?=
            $form->field($model, 'clinic_id')->widget(Select2::className(), [
                'data' =>  ArrayHelper::map(app\models\Clinics::find()->all(), 'id', 'name'),
                        'options' => [
                        'placeholder' => '<--คลิกเลือกประเภทคลินิก-->'],                        
                        'pluginOptions' =>
                        [
                            'allowClear' => true
                        ],
                    ]);
            ?>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-8">
            <?=
            $form->field($model, 'programe_id')->widget(DepDrop::className(), [
                        'data' => [$programe],
                        'options' => ['placeholder' => '<--คลิกเลือกหรือพิมพ์ชื่อโปรแกรม-->'],
                        'type' => DepDrop::TYPE_SELECT2,
                        'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                        'pluginOptions' => [
                            'depends' => ['riskreports-clinic_id'],            
                            'url' => yii\helpers\Url::to(['/riskreports/get-programe']),
                            'loadingText' => 'Loading1...',
                        ],
                    ]);
            ?>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <?=
            $form->field($model, 'risktype_id')->widget(DepDrop::className(), [
                        'data' => [$risktype],
                        'options' => ['placeholder' => '<--คลิกเลือกหรือพิมพ์รายการความเสี่ยง-->',
                            //'disabled'=>true, 
                            ],                        
                        'type' => DepDrop::TYPE_SELECT2,
                        'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                        'pluginOptions' => [
                            'depends' => ['riskreports-clinic_id', 'riskreports-programe_id'],            
                            'url' => yii\helpers\Url::to(['/riskreports/get-risktype']),
                            'loadingText' => 'Loading2...',
                        ],
                    ]);
            ?>
        </div>
       
    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
            <?= $form->field($model, 'name')->textarea(['rows' => 6,'readonly'=>true]) ?> 
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
            <?= $form->field($model, 'description')->textarea(['rows' => 6,'readonly'=>true]) ?> 
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <?= $form->field($model, 'namecode')->widget(Select2::className(), [
                'data' =>  ArrayHelper::map(\app\models\Levels::find()->all(), 'namecode', 'name'),
                        'options' => [
                        'placeholder' => '<--คลิกเลือกประเภทระดับความเสี่ยง->'],                        
                        'pluginOptions' =>
                        [
                            'allowClear' => true
                        ],
                    ]);
            ?>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4">
            <?= $form->field($model, 'department_id')->widget(Select2::className(), [
                        'data' =>  ArrayHelper::map(\app\models\Departments::find()->all(), 'id', 'name'),
                        'options' => [
                        'placeholder' => '<--คลิกเลือกหน่วยงานที่รายงาน-->'],                        
                        'pluginOptions' =>
                        [
                            'allowClear' => true
                        ],
                    ]);
            ?>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-4">
           <?=
            $form->field($model, 'user_id_report')->widget(DepDrop::className(), [
                        'data' => [$userrisk],
                        'options' => ['placeholder' => '<--คลิกเลือกผู้รายงาน-->'],
                        'type' => DepDrop::TYPE_SELECT2,
                        'select2Options' => ['pluginOptions' => ['allowClear' => true]],
                        'pluginOptions' => [
                            'depends' => ['riskreports-department_id'],            
                            'url' => yii\helpers\Url::to(['/riskreports/get-user']),
                            'loadingText' => 'Loading1...',
                        ],
                    ]);
            ?> 
        </div>        
        <div class="col-xs-4 col-sm-4 col-md-4">
            <?= $form->field($model, 'department_id_risk')->widget(Select2::className(), [
                        'data' =>  ArrayHelper::map(app\models\DepartmentsRisk::find()->all(), 'id', 'name'),
                        'options' => [
                        'placeholder' => '<--คลิกเลือกพื้นที่เกิดเหตุ-->'],                        
                        'pluginOptions' =>
                        [
                            'allowClear' => true
                        ],
                    ]);
            ?>  
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 col-sm-5 col-md-5">
            <?= $form->field($model, 'sufferer')->inline()->radioList(app\models\Riskreports::itemAlias('sufferer')) ?>
        </div>
         <div class="col-xs-2 col-sm-2 col-md-2">
            <?= $form->field($model, 'edit')->inline()->radioList(app\models\Riskreports::itemAlias('edit')) ?>           
        </div>
        <div class="col-xs-5 col-sm-5 col-md-5">
            <?= $form->field($model, 'edit_begin')->textarea(['rows' => 6,'readonly'=>true]) ?>
        </div>
    </div>
     <div class="row">       
        <div class="col-xs-5 col-sm-5 col-md-5">
           <?= $form->field($model, 'how')->inline()->radioList(app\models\Riskreports::itemAlias('how')) ?>
        </div>         
         <div class="col-xs-2 col-sm-2 col-md-2">    
           <?= $form->field($model, 'money')->textInput(['maxlength' => true]) ?>
        </div>
        <div class="col-xs-5 col-sm-5 col-md-5">
            <?= $form->field($model, 'moneydetail')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <hr>
     <div class="panel panel-danger">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <h4><i class="glyphicon glyphicon-plus"></i> คลิกบันทึกในส่วนนี้ ถ้ามีการทบทวน</h4>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="accordion-body collapse" role="tabpanel" aria-labelledby="headingOne">
        <div class="panel-body">
            <div class="row">       
                <div class="col-xs-2 col-sm-2 col-md-2">
                    <?= $form->field($model, 'review')->widget(CheckboxX::className(),[
                        'pluginOptions'=>[
                        'threeState'=>FALSE
                        ]
                    ]) ?>
                </div>
            </div>    
                <div class="row">       
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <?= $form->field($model, 'reviewdate')->widget(
                            DatePicker::className(), [
                                // inline too, not bad
                                'language'=>'th',
                                 'inline' => FALSE, 
                                 // modify template for custom rendering       
                                'clientOptions' => [
                                    'autoclose' => true,
                                    'format' => 'yyyy-mm-dd',
                                    'todayHighlight'=>true
                                        ]
                    ]);?>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6">
                         <?= $form->field($model, 'reviewdetail')->textarea(['rows' => 6]) ?>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                       <?= $form->field($model, 'reviewteam')->textInput(['maxlength' => true]) ?> 
                    </div>
                </div>    
        </div>
    </div>
    </div>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-ok"></i> บันทึก' : ' <i class="glyphicon glyphicon-ok"></i>บันทึกการแก้ไข', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
