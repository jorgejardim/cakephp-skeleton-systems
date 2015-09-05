<?php
use Cake\Core\Configure;
?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <?= $this->Html->charset() ?>
        <title><?= Configure::read('DefaultOptions.site_name'); ?></title>
        <meta name="description" content="<?= Configure::read('DefaultOptions.site_description'); ?>">
        <meta name="author" content="jorgejardim.com.br">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
        <?= Configure::read('DefaultOptions.google_metatag'); ?>
        <?php
            echo $this->Html->css([ASSETS_CSS.'vendor/bootstrap/bootstrap.min.css',
                                   ASSETS_JS.'vendor/jquery/jquery-hopscotch/css/hopscotch-0.1.1.min.css',
                                   ASSETS_CSS.'general.css',
                                   ASSETS_CSS.'modern/style.css',
                                   ASSETS_CSS.'modern/responsive.css',
                                   ASSETS_CSS.'modern/skin/'.(Configure::check('DefaultOptions.template_skin_colors')?Configure::read('DefaultOptions.template_skin_colors'):'default').'.css' ]);
            echo $this->fetch('css');
            echo $this->fetch('script');
        ?>
        <link rel="shortcut icon" href="<?= ASSETS_UPLOADS ?><?= Configure::read('DefaultOptions.favicon'); ?>">
        <!--[if lt IE 9]>
            <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script>window.html5 || document.write('<script src="<?= ASSETS_JS ?>vendor/html/html5shiv.js"><\/script>')</script>
        <![endif]-->
    </head>
    <body class="<?= strtolower($this->request->params['controller']).' '.$this->request->params['action'].' '.Configure::read('Template.layout.'.Configure::read('DefaultOptions.template_layout').'.body_class').' '.@$dark ?>" style="<?= Configure::read('DefaultOptions.template_background')?'background: transparent url(\''.ASSETS_IMG.'patterns/'.Configure::read('DefaultOptions.template_background').'\') repeat scroll 0% 0%;':'' ?>">
        <div id="entire" class="<?= Configure::read('Template.layout.'.Configure::read('DefaultOptions.template_layout').'.content_class') ?>">
            <div class="loader"></div>
            <?php echo $this->element('Menu/top_menu'); ?>
            <div class="top-bar clearfix">
                <div class="container">
                    <div class="fl top-social-icons">
                        <?php echo $this->element('Social/social_icons', [], ['cache' => ['key' => 'social_icons', 'config' => 'year_'.$this->request->session()->read('Domain.id')]]); ?>
                    </div>
                    <div class="fr top-contact p-t-9">
                        <?= Configure::read('DefaultOptions.header_text'); ?>
                    </div>
                </div>
            </div>
            <header class="alt">
                <div class="container">
                    <div class="logo-container fl clearfix">
                        <a href="<?= $this->Url->build('/') ?>" class="ib">
                            <img src="<?= ASSETS_UPLOADS ?><?= Configure::read('DefaultOptions.site_logo'); ?>" class="fl" alt="<?= Configure::read('DefaultOptions.site_name'); ?>">
                        </a>
                    </div>
                    <nav class="main-navigation fr">
                        <ul class="clearfix">
                            <?php
                              echo $this->cell('Menus::menu', ['place' => 'menu-header'], [
                                  'cache' => ['config' => 'year_'.$this->request->session()->read('Domain.id'), 'key' => 'app_menu_header_'.$this->request->session()->read('Domain.id')]
                              ])->render('menu');
                            ?>
                            <li class="parent-item login">
                                <?php if($this->request->session()->check('Auth.User.id')) { ?>
                                    <a href="#" class="ln-tr"><span class="grad-btn"><i class="fa fa-user m-r-5"></i> <?= $this->request->session()->read('Auth.User.name'); ?></a>
                                    <ul class="submenu right">
                                        <li class="sub-item"><a href="<?= $this->Url->build('/me') ?>" class="ln-tr"><?= __('Profile') ?></a></li>
                                        <li class="sub-item"><a href="<?= $this->Url->build('/logout') ?>" class="ln-tr"><?= __('Logout') ?></a></li>
                                    </ul>
                                <?php } else { ?>
                                    <a href="<?= $this->Url->build('/login') ?>" class="ln-tr"><span class="grad-btn">Login</span></a>
                                <?php } ?>
                            </li>
                        </ul>
                    </nav>
                    <div class="mobile-navigation fr">
                        <a href="#" class="mobile-btn"><span></span></a>
                        <div class="mobile-container"></div>
                    </div>
                </div>
            </header>

            <?= $this->fetch('content') ?>

            <div class="clearfix"></div>

            <footer id="footer">
                <div id="bottom">
                    <div class="container">
                        <div class="fl copyright">
                            <?= Configure::read('DefaultOptions.footer_text'); ?>
                        </div>
                        <div class="fr footer-social-icons">
                            <?php echo $this->element('Social/social_icons', [], ['cache' => ['key' => 'social_icons', 'config' => 'year_'.$this->request->session()->read('Domain.id')]]); ?>
                        </div>
                    </div>
                </div>
            </footer>
        </div>

        <script type='text/javascript'>
            /* <![CDATA[ */
            var URL = {"base":"<?= $this->Url->build('/') ?>","uploads":"<?php echo ASSETS_UPLOADS; ?>"};
            var LOCALE = '<?= Locale::getDefault() ?>';
            /* ]]> */
        </script>
        <?php
          echo $this->Html->script([ASSETS_JS.'vendor/jquery/jquery-1.11.3.min.js',
                                    ASSETS_JS.'vendor/bootstrap/bootstrap.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery.cookie.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery.easydropdown.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery.flexslider-min.js',
                                    ASSETS_JS.'vendor/jquery/jquery.themepunch.tools.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery.themepunch.revolution.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery.viewportchecker.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery.validate.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery.maskedinput-1.4.0.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery-autonumeric/autoNumeric.min.js',
                                    ASSETS_JS.'vendor/jquery/jquery-hopscotch/js/hopscotch-0.1.1.min.js' ]);
          echo $this->fetch('scriptBottom');
          echo $this->Html->script([ASSETS_JS.'modern/scripts.js',
                                    ASSETS_JS.'form.js',
                                    ASSETS_JS.'common.js' ]);
          echo Configure::read('DefaultOptions.google_analytics');
        ?>
    </body>
</html>