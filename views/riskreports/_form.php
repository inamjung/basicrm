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
//use app\models\User;


/* @var $this yii\web\View */
/* @var $model app\models\Riskreports */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="riskreports-form">

    <?php $form = ActiveForm::begin(); ?>
    
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
        ]
]);?>
    

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

    <?= $form->field($model, 'name')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>  
    <?php //echo $form->field($model, 'namecode')->inline()->radioList(app\models\Riskreports::itemAlias('namecode')) ?>
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

    <?= $form->field($model, 'sufferer')->inline()->radioList(app\models\Riskreports::itemAlias('sufferer')) ?>

    <?= $form->field($model, 'edit')->inline()->radioList(app\models\Riskreports::itemAlias('edit')) ?>

    <?= $form->field($model, 'user_id_report')->textInput(['maxlength' => true]) ?>
           

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
     <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'edit_begin')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'money')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'moneydetail')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'how')->inline()->radioList(app\models\Riskreports::itemAlias('how')) ?>

    <?= $form->field($model, 'review')->widget(CheckboxX::className(),[
        'pluginOptions'=>[
            'threeState'=>FALSE
        ]
    ]) ?>

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

    <?= $form->field($model, 'reviewdetail')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'reviewteam')->textInput(['maxlength' => true]) ?>

   

    <?= $form->field($model, 'review_in')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'review_by')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'review_dateline')->widget(
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

    <?= $form->field($model, 'qateam')->textInput(['maxlength' => true]) ?>

    
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
