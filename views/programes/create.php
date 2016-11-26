<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Programes */

$this->title = 'เพิ่มข้อมูล';
$this->params['breadcrumbs'][] = ['label' => 'Programes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="programes-create">

    <h3><?= Html::encode($this->title) ?></h3>
    <div class="panel panel-success">
        <div class="panel-heading"> รายการโปรแกรมความเสี่ยง</div>
        <div class="panel-body">
            <?=
            $this->render('_form', [
                'model' => $model,
            ])
            ?>
        </div>
    </div>
</div>
