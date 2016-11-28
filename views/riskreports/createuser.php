<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Riskreports */

$this->title = 'Create Riskreports';
$this->params['breadcrumbs'][] = ['label' => 'Riskreports', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="riskreports-create">

    <div class="panel panel-success">
        <div class="panel-heading"> เขียนความเสี่ยง</div>
        <div class="panel-body">
            <?=
            $this->render('_formuser', [
                'model' => $model,
                'programe' => [],
                'risktype' => [],
                'userrisk' => [],
            ])
            ?>
        </div>
    </div>
</div>
