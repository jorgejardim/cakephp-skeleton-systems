<?php
use Cake\Core\Configure;
?>
<?php if($this->request->session()->check('Auth.User.internal') && $this->request->session()->check('Auth.User.role')!=='user'): ?>
    <div class="navbar navbar-default navbar-top-menu">
        <div class="navbar-inner">
            <div class="container p-l-0 m-l-0 p-r-0 m-r-0" style="width:100%">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-top-menu" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Menu</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div id="nav-top-menu" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li id="top_menu_manage" class="dropdown navbar-brand">
                            <?= __('Manage') ?>:
                        </li>
                        <li id="top_menu_start" class="dropdown">
                            <a href="<?= $this->Url->build('/start') ?>" role="button" aria-expanded="false"><i class="fa fa-play-circle"></i><?= __('Start') ?></a>
                        </li>
                        <?php if(Configure::read('Modules.Site.home')) { ?>
                            <li id="top_menu_inicial_page" class="dropdown">
                                <a href="<?= $this->Url->build('/inicial_page') ?>" role="button" aria-expanded="false"><i class="fa fa-home"></i><?= __('Inicial Page') ?></a>
                            </li>
                        <?php } if(Configure::read('Modules.Site.pages')) { ?>
                            <li id="top_menu_pages" class="dropdown">
                                <a href="<?= $this->Url->build('/pages') ?>" role="button" aria-expanded="false"><i class="fa fa-file-text"></i><?= __('Pages') ?></a>
                            </li>
                        <?php } if(Configure::read('Modules.Site.blog')) { ?>
                            <li id="top_menu_blog" class="dropdown">
                                <a href="<?= $this->Url->build('/blog/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-commenting"></i><?= __('Blog') ?></a>
                            </li>
                        <?php } if(Configure::read('Modules.Site.destinations')) { ?>
                            <li id="top_menu_destinations" class="dropdown">
                                <a href="<?= $this->Url->build('/destinations/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-globe"></i><?= __('Destinations') ?></a>
                            </li>
                        <?php } if(Configure::read('Modules.Site.lectures')) { ?>
                            <li id="top_menu_lectures" class="dropdown">
                                <a href="<?= $this->Url->build('/lectures/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-video-camera"></i><?= __('Lectures') ?></a>
                            </li>
                        <?php } if(Configure::read('Modules.Site.lectures')) { ?>
                            <li id="top_menu_authors" class="dropdown">
                                <a href="<?= $this->Url->build('/authors/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Authors') ?></a>
                            </li>
                        <?php } if(Configure::read('Modules.Site.menus')) { ?>
                            <li id="top_menu_menus" class="dropdown">
                                <a href="<?= $this->Url->build('/menus') ?>" role="button" aria-expanded="false"><i class="fa fa-bars"></i><?= __('Menus') ?></a>
                            </li>
                        <?php } if(Configure::read('Modules.Site.users') && $this->request->session()->check('Auth.User.role')!=='author') { ?>
                            <li id="top_menu_users" class="dropdown">
                                <a href="<?= $this->Url->build('/users') ?>" role="button" aria-expanded="false"><i class="fa fa-users"></i><?= __('Users') ?></a>
                            </li>
                        <?php } ?>
                        <li id="top_menu_contacts" class="dropdown">
                            <a href="<?= $this->Url->build('/contacts/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-envelope"></i><?= __('Messages') ?></a>
                        </li>
                        <?php if(Configure::read('Modules.Site.config') && $this->request->session()->check('Auth.User.role')!=='author') { ?>
                            <li id="top_menu_configurations" class="dropdown">
                                <a href="<?= $this->Url->build('/configurations') ?>" role="button" aria-expanded="false"><i class="fa fa-cog"></i><?= __('Site Config') ?></a>
                            </li>
                        <?php } ?>
                        <li id="top_menu_tools" class="dropdown">
                            <a href="<?= $this->Url->build('/tools/clear_cache') ?>" role="button" aria-expanded="false"><i class="fa fa-recycle"></i><?= __('Limpar Cache') ?></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <?php if ($this->request->controller === 'Pages' && $this->request->action === 'home' && Configure::read('Modules.Site.home')) { ?>
                                <a href="<?= $this->Url->build('/inicial_page') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Edit this Page') ?></a>
                            <?php } if ($this->request->controller === 'Pages' && $this->request->action === 'page' && Configure::read('Modules.Site.pages')) { ?>
                                <a href="<?= $this->Url->build('/pages/edit/'.$content->id) ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Edit this Page') ?></a>

                            <?php } if ($this->request->controller === 'Blog' && $this->request->action === 'index' && Configure::read('Modules.Site.blog')) { ?>
                                <a href="<?= $this->Url->build('/blog/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Manage Posts') ?></a>
                            <?php } if ($this->request->controller === 'Blog' && $this->request->action === 'categories' && Configure::read('Modules.Site.blog')) { ?>
                                <a href="<?= $this->Url->build('/blog/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Manage Posts') ?></a>
                            <?php } if ($this->request->controller === 'Blog' && $this->request->action === 'blog' && Configure::read('Modules.Site.blog')) { ?>
                                <a href="<?= $this->Url->build('/blog/edit/'.$content->id) ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Edit this Post') ?></a>

                            <?php } if ($this->request->controller === 'Lectures' && $this->request->action === 'index' && Configure::read('Modules.Site.lectures')) { ?>
                                <a href="<?= $this->Url->build('/lectures/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Manage Lectures') ?></a>
                            <?php } if ($this->request->controller === 'Lectures' && $this->request->action === 'categories' && Configure::read('Modules.Site.lectures')) { ?>
                                <a href="<?= $this->Url->build('/lectures/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Manage Lectures') ?></a>
                            <?php } if ($this->request->controller === 'Lectures' && $this->request->action === 'lecture' && Configure::read('Modules.Site.lectures')) { ?>
                                <a href="<?= $this->Url->build('/lectures/edit/'.$content->id) ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Edit this Lecture') ?></a>

                            <?php } if ($this->request->controller === 'Destinations' && $this->request->action === 'index' && Configure::read('Modules.Site.destinations')) { ?>
                                <a href="<?= $this->Url->build('/destinations/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Manage Destinations') ?></a>
                            <?php } if ($this->request->controller === 'Destinations' && $this->request->action === 'categories' && Configure::read('Modules.Site.destinations')) { ?>
                                <a href="<?= $this->Url->build('/destinations/listing') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Manage Destinations') ?></a>
                            <?php } if ($this->request->controller === 'Destinations' && $this->request->action === 'lecture' && Configure::read('Modules.Site.destinations')) { ?>
                                <a href="<?= $this->Url->build('/destinations/edit/'.$content->id) ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Edit this Destination') ?></a>

                            <?php } if ($this->request->controller === 'Contacts' && $this->request->action !== 'listing') { ?>
                                <a href="<?= $this->Url->build('/configurations') ?>" role="button" aria-expanded="false"><i class="fa fa-pencil-square"></i><?= __('Manage Contact') ?></a>
                            <?php } ?>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<?php endif ?>