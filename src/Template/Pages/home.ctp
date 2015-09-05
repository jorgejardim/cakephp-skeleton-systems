<div class="page-header">
    <div class="pull-sm-left">
        <h1><?= __('Home') ?></h1>
    </div>
    <div class="visible-xs-block visible-sm-block"><br /></div>
    <div class="clearfix"></div>
</div>
<div class="breadcrumbs">
    <ul>
        <li>
            <a href="<?= $this->Url->build('/') ?>"><?= __('Home') ?></a>
        </li>
    </ul>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="box">
            <div class="box-content">
                <?= $this->Flash->render('auth') ?>
                Olá!
            </div>
        </div>
    </div>
</div>