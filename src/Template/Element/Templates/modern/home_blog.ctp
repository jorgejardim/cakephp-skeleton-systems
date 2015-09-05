<section class="full-section categories-section p-t-30 p-b-20">
    <div class="section-content categories-content fadeInDown-animation hide show animated fadeInDown m-t-0">
        <div class="container">
            <h6 class="head-title m-b-10"><a href="<?= $this->Url->build('/blog/c/'.$content['item_category']['slug'], true); ?>"><?= $content['item_title'] ?></a></h6>
            <div class="row">
                <?php
                  echo $this->cell('Listing::blog', ['category_id' => $content['item_id']]);
                ?>
            </div>
        </div>
    </div>
</section>