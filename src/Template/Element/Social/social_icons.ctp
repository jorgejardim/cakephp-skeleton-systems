<?php
use Cake\Core\Configure;
?>
<ul class="clearfix">
    <?php if(Configure::read('DefaultOptions.social_facebook')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_facebook'); ?>" class="fb-icon ln-tr" target="_blank"><i class="fa fa-facebook"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_twitter')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_twitter'); ?>" class="tw-icon ln-tr" target="_blank"><i class="fa fa-twitter"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_google_plus')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_google_plus'); ?>" class="gp-icon ln-tr" target="_blank"><i class="fa fa-google-plus"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_instagram')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_instagram'); ?>" class="pn-icon ln-tr" target="_blank"><i class="fa fa-instagram"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_flickr')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_flickr'); ?>" class="pn-icon ln-tr" target="_blank"><i class="fa fa-flickr"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_pinterest')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_pinterest'); ?>" class="pn-icon ln-tr" target="_blank"><i class="fa fa-pinterest"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_vimeo')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_vimeo'); ?>" class="vm-icon ln-tr" target="_blank"><i class="fa fa-vimeo-square"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_linkedin')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_linkedin'); ?>" class="in-icon ln-tr" target="_blank"><i class="fa fa-linkedin"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_dribbble')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_dribbble'); ?>" class="yt-icon ln-tr" target="_blank"><i class="fa fa-dribbble"></i></a></li>
    <?php } if(Configure::read('DefaultOptions.social_youtube')) { ?>
        <li><a href="<?= Configure::read('DefaultOptions.social_youtube'); ?>" class="yt-icon ln-tr" target="_blank"><i class="fa fa-youtube-play"></i></a></li>
    <?php } ?>
</ul>



