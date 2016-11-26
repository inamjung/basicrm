<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Risktypes */

$this->title = 'Create Risktypes';
$this->params['breadcrumbs'][] = ['label' => 'Risktypes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="risktypes-create">
<h3><?= Html::encode($this->title) ?></h3>
    <div class="panel panel-success">
        <div class="panel-heading"> รายการความเสี่ยง</div>
        <div class="panel-body">
            <?=
            $this->render('_form', [
                'model' => $model,
            ])
            ?>
        </div>
    </div>
</div>
