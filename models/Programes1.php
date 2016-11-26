<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "programes".
 *
 * @property integer $id
 * @property string $name
 * @property integer $clinic_id
 */
class Programes extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'programes';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'clinic_id'], 'required'],
            [['clinic_id'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'clinic_id' => 'Clinic ID',
        ];
    }
    
    public function getProgrameclinic(){
        return $this->hasOne(Clinics::className(),['id'=>'clinic_id']);
    }
}
