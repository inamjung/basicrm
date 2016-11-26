<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Risktypes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="risktypes-form">

    <?php $form = ActiveForm::begin(); ?>

    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6">
            <?=
            $form->field($model, 'programe_id')->widget(kartik\select2\Select2::className(), [
                'data' => \yii\helpers\ArrayHelper::map(app\models\Programes::find()->all(), 'id', 'name'),
                'options' => [
                    'placeholder' => '-- เลือก--'
                ],
                'pluginOptions' => [
                    'allowClear' => true
                ]
            ])
            ?>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
<?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
        </div>
    </div>

    <div class="form-group">
    <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

<?php ActiveForm::end(); ?>

</div>
