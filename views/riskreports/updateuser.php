<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Riskreports */

$this->title = 'รายการ ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Riskreports', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="riskreports-update">

<!--    <h1><?= Html::encode($this->title) ?></h1>-->
    <div class="panel panel-warning">
        <div class="panel-heading"> แก้ไขรายการความเสี่ยง</div>
        <div class="panel-body">
            <?=
            $this->render('_formuser', [
                'model' => $model,
                'programe' => $programe,
                'risktype' => $risktype,
                'userrisk' => $userrisk,
            ])
            ?>
        </div>
    </div>
</div>
