<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\DepartmentsRisk */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Departments Risks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="departments-risk-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'name',
            'nameeng',
            'group_id',
            'total',
            'total_Y',
            'total_N',
        ],
    ]) ?>

</div>
