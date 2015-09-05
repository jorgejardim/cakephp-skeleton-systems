<section class="main-page">
    <div class="container">
        <?php if (isset($content->id)): ?>
            <div class="page-title">
                <h3><?= $content->title ?></h3>
            </div>
            <div class="entry">
                <div class="col-sm-10 col-sm-offset-1 p-b-30 content-page">
                    <?php if($content->images) { ?>
                        <div class="col-sm-6">
                            <img class="img-responsive img-thumbnail" alt="" src="<?= ASSETS_UPLOADS.$content->images ?>" draggable="false">
                        </div>
                        <div class="col-sm-6">
                            <?= $content->content ?>
                        </div>
                    <?php } else { ?>
                        <?= $content->content ?>
                    <?php } ?>
                </div>
                <div class="clearfix"></div>
            </div>
        <?php endif ?>
    </div>
</section>