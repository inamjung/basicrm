<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Risktypes */

$this->title = 'รายการ: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Risktypes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="risktypes-update">
<div class="panel panel-danger">
        <div class="panel-heading"> แก้ไขรายการความเสี่ยง</div>
        <div class="panel-body">
            <?=
            $this->render('_form', [
                'model' => $model,
            ])
            ?>
        </div>
    </div>
</div>
