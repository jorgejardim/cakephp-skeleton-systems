<div class="page-header">
    <div class="pull-sm-left">
        <h1><?= __('Clear Cache') ?></h1>
    </div>
    <div class="visible-xs-block visible-sm-block"><br /></div>
    <div class="clearfix"></div>
</div>
<div class="breadcrumbs">
    <ul>
        <li>
            <a href="<?= $this->Url->build('/') ?>"><?= __('Home') ?></a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <?= $this->Html->link(__('Clear Cache'), ['controller' => 'tools', 'action' => 'clear_cache', '?' => @$this->request->query]); ?>
        </li>
    </ul>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="box">
            <div class="box-content">
                <h2 class="bold text-center"><?= $result?'OK!':'' ?></h2>
                <p class="text-center"><?= __('Cleaning Cache successfully accomplished!') ?></p>
                <br>
                <div class="col-sm-6 col-sm-offset-3 text-center">
                    <hr />
                    <i>
                        O cache é uma cópia de muitos dos elementos, que ficam a disposição do sistema para acesso rápido, sem que seja preciso consultar as configurações ou banco de dados a cada nova solicitação.
                        Com o cache o carregamento das suas páginas devem ficar bem mais rápidas.
                    </i>
                    <br><br>
                    <i>
                        Algumas vezes, será preciso limpar o cache armazenado, para que ele seja reconstruído, caso não queira esperar que ele se atualize automaticamente.
                    </i>
                </div>
                <div class="clearfix"></div>
                <br><br><br>
                <br><br><br>
            </div>
        </div>
    </div>
</div>