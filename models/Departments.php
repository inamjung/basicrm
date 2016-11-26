<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "departments".
 *
 * @property integer $id
 * @property string $name
 * @property string $nameeng
 * @property integer $group_id
 * @property integer $total
 * @property integer $total_Y
 * @property integer $total_N
 */
class Departments extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'departments';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['group_id', 'total', 'total_Y', 'total_N'], 'integer'],
            [['name'], 'string', 'max' => 80],
            [['nameeng'], 'string', 'max' => 10],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'หน่วยงาน',
            'nameeng' => 'แผนก',
            'group_id' => 'กลุ่มงาน',
            'total' => 'Total',
            'total_Y' => 'Total  Y',
            'total_N' => 'Total  N',
        ];
    }
}
