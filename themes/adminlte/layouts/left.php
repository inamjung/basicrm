<?php
    use yii\helpers\Url;
    use yii\bootstrap\Nav;
?>




<aside class="main-sidebar">

    <section class="sidebar">

        <!-- Sidebar user panel -->
<!--        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
            </div>
            <div class="pull-left info">
                <p>Alexander Pierce</p>

                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>-->
        
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
                    
                </ul>
        </ul> 

    </section>

</aside>
