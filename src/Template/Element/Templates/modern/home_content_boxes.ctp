<section class="full-section categories-section p-t-10">
    <div class="section-content features-content fadeInDown-animation hide show animated fadeInDown">
        <div class="container">
            <div class="row">
                <?php
                    //$total = $contents['content_boxes']->count();
                    $total = count($content['itens']);
                    if($total==3) {
                        echo '<div class="col-md-3 col-lg-3 c-md-12 c-lg-12"></div>';
                    } if($total==2) {
                        echo '<div class="col-md-3 col-lg-3 c-md-25"></div>';
                    } if($total==1) {
                        echo '<div class="col-sm-3 col-md-3 col-lg-3 c-md-37 c-lg-37"></div>';
                    }
                ?>
                <?php $i = 0; foreach ($content['itens'] as $item): ?>
                    <div class="col-sm-6 col-md-3 col-lg-3">
                        <div class="feature-box">
                            <?php if($item['content']['excerpt']) { ?><a href="<?= $this->Commons->menu_link($item['content']['excerpt']) ?>"><?php } ?>
                                <div class="icon text-center"><img alt="" class="img-responsive es-tr dib" src="<?= ASSETS_UPLOADS.$item['content']['images'] ?>"></div>
                                <h5 class="feature-title text-center"><?= $item['content']['title']?></h5>
                                <p class="feature-description text-center"><?= $item['content']['content'] ?></p>
                            <?php if($item['content']['excerpt']) { ?></a><?php } ?>
                        </div>
                    </div>
                <?php ++$i; endforeach; ?>
            </div>
        </div>
    </div>
</section>