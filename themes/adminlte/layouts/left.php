<?php
    use yii\helpers\Url;
    use yii\bootstrap\Nav;
    use yii\helpers\Html;
?>
<aside class="main-sidebar">

    <section class="sidebar">
        <?php if(!Yii::$app->user->isGuest){ ?> 
        <div class="pull-left image">
                <?= Html::img('avatars/' . Yii::$app->user->identity->avatar,
                        ['class' => 'img-circle', 'width' => '80px;'])
                ?>                

            </div>
        <?php } ?>
        <br>
        
        <?=
        Nav::widget(
                [
                    'encodeLabels' => false,
                    'options' => ['class' => 'sidebar-menu'],
                    'items' => [
                        '<li class="header"></li>',
                        Yii::$app->user->isGuest ?
                                ['label' => '<i class="glyphicon glyphicon-log-in"></i> เข้าสู่ระบบ', 'url' => ['/user/security/login']] :
                                ['label' => 'ผู้ใช้งาน (' . Yii::$app->user->identity->username . ')', 'items' => [
                                ['label' => 'ข้อมูลส่วนตัว', 'url' => ['/users/indexuser']],

                                ['label' => 'Logout', 'url' => ['/user/security/logout'], 'linkOptions' => ['data-method' => 'post']],
                            ]],
                    ],
                ]
        );
        ?>
        
        <ul class="sidebar-menu">
            <li class="treeview"> 
                <a href="#">
                    <i class="glyphicon glyphicon-cog"></i> <span>ตั้งค่าระบบ</span>
                    <i class="fa pull-right fa-angle-down"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?php echo Url::to(['clinics/index'])?>">
                        <i class="fa fa-circle text-green"></i> 
                        <span> คลินิก</span> 
                        <small class="label pull-right bg-blue"></small>
                        </a>
                    </li>
                    <li><a href="<?php echo Url::to(['programes/index'])?>">
                        <i class="fa fa-circle text-red"></i> 
                        <span> โปรแกรม</span> 
                        <small class="label pull-right bg-blue"></small>
                        </a>
                    </li>
                    <li><a href="<?php echo Url::to(['risktypes/index'])?>">
                        <i class="fa fa-circle text-blue"></i> 
                        <span> รายการ</span> 
                        <small class="label pull-right bg-blue"></small>
                        </a>
                    </li>
                </ul>
        </ul> 
        
        <ul class="sidebar-menu">
            <li class="treeview active"> 
                <a href="#">
                    <i class="glyphicon glyphicon-cog"></i> <span>ความเสี่ยงAdmin</span>
                    <i class="fa pull-right fa-angle-down"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?php echo Url::to(['riskreports/indexriskadminapprove'])?>">
                        <i class="fa fa-circle text-red"></i> 
                        <span> ความเสี่ยงมาใหม่</span> 
                        <small class="label pull-right bg-blue"></small>
                        </a>
                    </li>
                    <li><a href="<?php echo Url::to(['riskreports/index'])?>">
                        <i class="fa fa-circle text-green"></i> 
                        <span> รายงานความเสี่ยง</span> 
                        <small class="label pull-right bg-blue"></small>
                        </a>
                    </li>
                    
                </ul>
        </ul> 
<ul class="sidebar-menu">
            <li class="treeview active"> 
                <a href="#">
                    <i class="glyphicon glyphicon-cog"></i> <span>ความเสี่ยงUser</span>
                    <i class="fa pull-right fa-angle-down"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="<?php echo Url::to(['riskreports/createuser'])?>">
                        <i class="fa fa-circle text-green"></i> 
                        <span> เขียนรายงานความเสี่ยง</span> 
                        <small class="label pull-right bg-blue"></small>
                        </a>
                    </li>
                    
                    <li><a href="<?php echo Url::to(['riskreports/indexriskuser'])?>">
                        <i class="fa fa-circle text-green"></i> 
                        <span> ความเสี่ยงของฝ่ายเขียน</span> 
                        <small class="label pull-right bg-blue"></small>
                        </a>
                    </li>
                    <li><a href="<?php echo Url::to(['riskreports/indexriskdepuser'])?>">
                        <i class="fa fa-circle text-yellow"></i> 
                        <span> เกิดที่ฝ่าย</span> 
                        <small class="label pull-right bg-blue"></small>
                        </a>
                    </li>
                    
                </ul>
        </ul> 

    </section>

</aside>
