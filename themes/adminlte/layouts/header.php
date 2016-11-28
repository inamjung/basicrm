<?php
use yii\helpers\Html;
use yii\helpers\Url;
/* @var $this \yii\web\View */
/* @var $content string */
?>

<header class="main-header">

    <?= Html::a('<span class="logo-mini"><img style="height:40px; margih-top:12px:" src="./img/rm.png"></span><span class="logo-lg">' . Yii::$app->name . '</span>', Yii::$app->homeUrl, ['class' => 'logo']) ?>

    <nav class="navbar navbar-static-top" role="navigation">

        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">

            <ul class="nav navbar-nav">
                <?php if(Yii::$app->user->isGuest){ ?>        
            <li><a href="<?php echo Url::to(['/user/registration/register']); ?>">
                    <i class="glyphicon glyphicon-user"></i>
                    <span> สมัครใช้งาน</span> 
                    <small class="label pull-right bg-blue"></small></a>
            </li>    
                <?php } ?>

                
            </ul>
        </div>
    </nav>
</header>
