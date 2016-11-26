<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Programes */

$this->title = 'รายการ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Programes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="programes-update">

    <h4><?= Html::encode($this->title) ?></h4>

    <div class="panel panel-warning">
        <div class="panel-heading"> แก้ไขรายการโปรแกรมความเสี่ยง</div>
        <div class="panel-body">
            <?=
            $this->render('_form', [
                'model' => $model,
            ])
            ?>
        </div>
    </div>

</div>
