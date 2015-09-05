<section class="full-section categories-section latest-courses-section p-t-30 p-b-60">
    <div class="section-content latest-courses-content fadeInDown-animation m-t-0">
        <div class="container">
            <h6 class="head-title m-b-10"><a href="<?= $this->Url->build('/destinos/c/'.$content['item_category']['slug'], true); ?>"><?= $content['item_title'] ?></a></h6>
            <div class="row">
                <div id="courses-slider" class="flexslider courses-slider">
                    <ul class="slides">
                        <?php
                          echo $this->cell('Listing::destinations', ['category_id' => $content['item_id']]);
                        ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</section>