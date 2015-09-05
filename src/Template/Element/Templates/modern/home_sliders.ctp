<?php
use Cake\Core\Configure;
?>
<div class="tp-banner-container" height="<?= Configure::read('DefaultOptions.slider_home_height') ?>">
    <div class="tp-banner">
        <ul>
            <?php $i = 0; foreach ($content['itens'] as $item): ?>
                <li data-transition="random" data-slotamount="7" data-masterspeed="1500" <?= $item['content']['excerpt']?'data-link="'.$this->Commons->menu_link($item['content']['excerpt']).'"':'' ?>>
                    <img src="<?= ASSETS_UPLOADS.$item['content']['images'] ?>" alt="slidebg<?= $i ?>" data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
                    <?php if($item['content']['title']) { ?>
                        <div class="tp-caption sft skewtoleft tp-resizeme start white"
                            data-y="<?= 34*Configure::read('DefaultOptions.slider_home_height')/100?>"
                            data-x="center"
                            data-hoffset="0"
                            data-start="300"
                            data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                            data-speed="500"
                            data-easing="Power3.easeInOut"
                            data-endspeed="300"
                            style="z-index: 2">
                            <h2 class="slide-title"><?= $item['content']['title'] ?></h2>
                        </div>
                    <?php } if($item['content']['content']) { ?>
                        <div class="tp-caption black randomrotate skewtoleft tp-resizeme start"
                            data-x="center"
                            data-hoffset="0"
                            data-y="<?= 39*Configure::read('DefaultOptions.slider_home_height')/100?>"
                            data-speed="500"
                            data-start="1300"
                            data-easing="Power3.easeInOut"
                            data-splitin="none"
                            data-splitout="none"
                            data-elementdelay="0.1"
                            data-endelementdelay="0.1"
                            data-endspeed="500" style="z-index: 99; white-space: pre-line;">
                            <p class="slide-description"><?= $item['content']['content'] ?></p>
                        </div>
                    <?php } ?>
                </li>
            <?php ++$i; endforeach; ?>
        </ul>
    </div>
</div>
<div class="clearfix"></div>