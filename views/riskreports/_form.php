<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
use yii\bootstrap\ActiveForm;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use yii\models\Clinics;
use yii\models\Programes;
use yii\models\Risktypes;
use kartik\depdrop\DepDrop;
use kartik\checkbox\CheckboxX;
use yii\helpers\Url;
use dosamigos\datepicker\DatePicker;


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

    <?= $form->field($model, 'user_id_report')->textInput() ?>

    <?= $form->field($model, 'department_id')->textInput() ?>

    <?= $form->field($model, 'department_id_risk')->textInput() ?>

    <?= $form->field($model, 'edit_begin')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'money')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'moneydetail')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'how')->inline()->radioList(app\models\Riskreports::itemAlias('how')) ?>

    <?= $form->field($model, 'review')->widget(CheckboxX::className(),[
        'pluginOptions'=>[
            'threeState'=>FALSE
        ]
    ]) ?>

    <?= $form->field($model, 'reviewdate')->textInput() ?>

    <?= $form->field($model, 'reviewdetail')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'reviewteam')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'approve')->textInput() ?>

    <?= $form->field($model, 'qaapprove')->textInput() ?>

    <?= $form->field($model, 'review_in')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'review_by')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'review_dateline')->textInput() ?>

    <?= $form->field($model, 'qateam')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'username')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'covenant')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'docs')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'ref')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'complete')->textInput() ?>

    <?= $form->field($model, 'createDate')->textInput() ?>

    <?= $form->field($model, 'updateDate')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
