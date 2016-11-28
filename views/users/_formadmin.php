<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\widgets\FileInput;

/* @var $this yii\web\View */
/* @var $model app\models\Users */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="users-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'username')->textInput(['readonly'=>true,'maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['readonly'=>true,'maxlength' => true]) ?>
    
     <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'department_id')->widget(kartik\widgets\Select2::className(),[
        'data'=>  yii\helpers\ArrayHelper::map(app\models\Departments::find()->all(), 'id', 'name'),
        'options'=>[
            'placeholder'=>'ระบุหน่วยงาน'
        ],
        'pluginOptions'=>[
            'allowClear'=>true
        ]
    ]) ?>    

    <?= $form->field($model, 'position_id')->widget(kartik\widgets\Select2::className(),[
        'data'=>  yii\helpers\ArrayHelper::map(app\models\Positions::find()->all(), 'id', 'name'),
        'options'=>[
            'placeholder'=>'ระบุตำแหน่ง'
        ],
        'pluginOptions'=>[
            'allowClear'=>true
        ]
    ]) ?>

    <?= $form->field($model, 'degree_id')->widget(kartik\widgets\Select2::className(),[
        'data'=>  yii\helpers\ArrayHelper::map(app\models\Degrees::find()->all(), 'id', 'name'),
        'options'=>[
            'placeholder'=>'ระบุประเภท'
        ],
        'pluginOptions'=>[
            'allowClear'=>true
        ]
    ]) ?>

    <?= $form->field($model, 'depname')->widget(kartik\widgets\Select2::className(),[
        'data'=>  yii\helpers\ArrayHelper::map(app\models\Departments::find()->all(), 'name', 'name'),
        'options'=>[
            'placeholder'=>'ยืนยันหน่วยงาน'
        ],
        'pluginOptions'=>[
            'allowClear'=>true
        ]
    ]) ?>
    
    <?= $form->field($model, 'role')->dropDownList([10=>'USER',20=>'ADMIN',30=>'EDITOR',40=>'SUPERADMIN']) ?>
    <div class="row" style="display: none">
        <?= $form->field($model, 'avatar_img')->label('รูปประจำตัว')->fileInput() ?>       
                  
        <?php if ($model->avatar) { ?>
            <?= Html::img('avatars/' . $model->avatar, ['class' => 'img-responsive img-circle', 'width' => '150px;']); ?>
        <?php } ?> 
    </div>
    

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
