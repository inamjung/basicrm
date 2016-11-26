<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Programes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="programes-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-4">
            <?= $form->field($model, 'clinic_id')->widget(kartik\select2\Select2::className(),[
        'data'=> \yii\helpers\ArrayHelper::map(app\models\Clinics::find()->all(), 'id', 'name'),
        'options'=>[
            'placeholder'=>'-- เลือก--'
        ],
        'pluginOptions'=>[
            'allowClear'=>true
        ]
    ]) ?>
        </div>
        <div class="col-xs-8 col-sm-8 col-md-8">
            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '<i class="glyphicon glyphicon-ok"></i> บันทึก' : ' <i class="glyphicon glyphicon-edit"></i> บันทึก', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
