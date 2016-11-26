<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\DepartmentsRisk */

$this->title = 'Create Departments Risk';
$this->params['breadcrumbs'][] = ['label' => 'Departments Risks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="departments-risk-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
