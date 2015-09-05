<?php
use Cake\Core\Configure;
?>
<!doctype html>
<html lang="pt_BR">
<head>
  <?= $this->Html->charset() ?>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />
  <meta name="description" content="<?= Configure::read('App.description'); ?>">
  <meta name="author" content="<?= Configure::read('App.author'); ?>">
  <title><?= Configure::read('App.name'); ?></title>
  <?php
    echo $this->Html->meta('icon');
    echo $this->Html->css([ASSETS_CSS.'vendor/bootstrap/bootstrap.min.css',
                           // ASSETS_CSS.'admin/bootstrap.min.css',
                           // ASSETS_CSS.'admin/plugins/jquery-ui/jquery-ui.min.css',
                           ASSETS_CSS.'admin/style.css',
                           ASSETS_CSS.'admin/themes.css',
                           ASSETS_CSS.'general.css' ]);
    echo $this->fetch('css');
    echo $this->fetch('script');
  ?>
  <link rel="apple-touch-icon-precomposed" href="<?= $this->Url->build(ASSETS_IMG.'/admin/apple-touch-icon-precomposed.png') ?>" />
</head>
<body class="<?= strtolower($this->request->params['controller']).' '.$this->request->params['action'] ?> theme-satblue" data-mobile-sidebar="button">
  <div id="navigation">
    <div class="container-fluid">
      <div class="nav-brand">
        <div class="pull-left">
          <a href="#" class="mobile-sidebar-toggle" data-toggle="tooltip" data-placement="bottom" title="Menu">
            <i class="fa fa-bars"></i>
          </a>
          <a class="hidden-xs" href="<?= $this->Url->build('/') ?>" id="brand"><i class="fa fa-university"></i> <?= Configure::read('App.name'); ?></a>
        </div>
        <div class="pull-right">
          <a href="#" class="toggle-nav" data-toggle="tooltip" data-placement="bottom" title="<?= __('Show/Hide Menu') ?>">
            <i class="fa fa-bars"></i>
          </a>
        </div>
        <div class="clearfix"></div>
      </div>
      <ul class='main-nav'>
        <li>
          <a href="<?= $this->Url->build('/') ?>">
            <span>Início</span>
          </a>
        </li>
      </ul>
      <div class="user">
        <div class="dropdown">
          <a href="#" class='dropdown-toggle' data-toggle="dropdown">
            <span class="hidden-xs"><?= $this->request->session()->read('Auth.User.name'); ?></span>
            <img height="27" width="27" src="<?php echo $this->request->session()->check('Auth.User.avatar')?ASSETS_UPLOADS.'avatars/'.$this->request->session()->read('Auth.User.avatar'):$this->Url->build(ASSETS_IMG.'avatar.jpg'); ?>">
          </a>
          <ul class="dropdown-menu pull-right">
            <li>
              <?= $this->Html->link(__('Profile'), '/me') ?>
            </li>
            <li>
              <?= $this->Html->link(__('Logout'), '/logout') ?>
            </li>
          </ul>
        </div>
        <div class="dropdown config-menu">
          <a href="#" class='dropdown-toggle' data-toggle="dropdown">
            <i class="fa fa-cog"></i>
          </a>
          <ul class="dropdown-menu pull-right">
            <li><?= $this->Html->link(__('Users'), '/users') ?></li>
            <li><?= $this->Html->link(__('Roles'), '/roles') ?></li>
            <li><?= $this->Html->link(__('Clear Cache'), '/tools/clear_cache') ?></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div id="brand-mobile" class="hidden-sm hidden-md hidden-lg">
    <div class="container-fluid text-center">
      <a class="dib no-float" href="<?= $this->Url->build('/') ?>" id="brand"><i class="fa fa-university"></i> <?= Configure::read('App.name'); ?></a>
    </div>
  </div>
  <div class="container-fluid nav-show" id="content">
    <div id="left">
        <div class="subnav">
            <ul class="subnav-menu">
                <li><a href="<?= $this->Url->build('/') ?>"><i class="fa fa-folder"></i> <?= __('Principal') ?></a></li>
                <li><a href="<?= $this->Url->build(['controller' => 'tests', 'action' => 'index']) ?>"><i class="fa fa-folder"></i> <?= __('Tests') ?></a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="container-fluid">
          <?= $this->fetch('content') ?>
        </div>
    </div>
  </div>
  <script type='text/javascript'>
      /* <![CDATA[ */
      var URL = {"base":"<?= $this->Url->build('/') ?>","uploads":"<?php echo ASSETS_UPLOADS; ?>"};
      /* ]]> */
  </script>
  <?php
    echo $this->Html->script([// ASSETS_JS.'admin/jquery.min.js',
                              ASSETS_JS.'vendor/jquery/jquery-1.11.3.min.js',
                              ASSETS_JS.'vendor/bootstrap/bootstrap.min.js',
                              ASSETS_JS.'vendor/jquery/jquery.cookie.min.js',
                              ASSETS_JS.'vendor/jquery/jquery.validate.min.js',
                              ASSETS_JS.'vendor/jquery/jquery.maskedinput-1.4.0.min.js',
                              ASSETS_JS.'vendor/jquery/jquery-autonumeric/autoNumeric.min.js',
                              ASSETS_JS.'admin/plugins/nicescroll/jquery.nicescroll.min.js',
                              ASSETS_JS.'admin/plugins/touchwipe/touchwipe.min.js',
                              // ASSETS_JS.'admin/plugins/jquery-ui/jquery-ui.js',
                              // ASSETS_JS.'admin/plugins/slimscroll/jquery.slimscroll.min.js',
                              // ASSETS_JS.'admin/bootstrap.min.js',
                              // ASSETS_JS.'admin/plugins/form/jquery.form.min.js',
                              // ASSETS_JS.'admin/plugins/validation/jquery.validate.min.js',
                              // ASSETS_JS.'admin/plugins/validation/additional-methods.min.js',
                              // ASSETS_JS.'admin/plugins/validation/extension_brazil.js',
                              // ASSETS_JS.'admin/plugins/validation/localization/messages_'.Locale::getDefault().'.min.js',
                              // ASSETS_JS.'admin/eakroko.min.js',
                              ASSETS_JS.'admin/application.min.js',
                              // ASSETS_JS.'admin/demonstration.min.js'
    ]);
    echo $this->fetch('scriptBottom');
    echo $this->Html->script([ASSETS_JS.'form.js',
                              ASSETS_JS.'common.js' ]);
  ?>
  <!--[if lte IE 9]>
    <?php echo $this->Html->script(ASSETS_JS.'admin/plugins/placeholder/jquery.placeholder.min.js'); ?>
    <script>
      $(document).ready(function() {
        $('input, textarea').placeholder();
      });
    </script>
  <![endif]-->
</body>
</html>