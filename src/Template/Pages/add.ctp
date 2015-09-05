<section class="main-page">
    <div class="container">
        <div class="page-title pull-md-left">
            <h3><?= __('Add {0}', [__('Page')]) ?></h3>
        </div>
        <div class="page-actions pull-md-right">
            <div class="btn-group" role="group">
                <a href="<?= $this->Url->build(['action' => 'index']) ?>" class="btn btn-page-action"><i class="fa fa-list"></i> <?= __('List'); ?></a>
            </div>
        </div>
        <div class="visible-xs-block visible-sm-block"><br /></div>
        <div class="clearfix"></div>
        <div class="entry-no-box">
            <?= $this->Flash->render() ?>
            <?= $this->Form->create($content, ['class' => 'validate', 'type' => 'file']); ?>
                <fieldset>
                    <div class="col-md-8 main-content p-l-0">
                        <div class="entry">
                            <?php
                                echo $this->Form->input('locale', ['value' => \Locale::getDefault(), 'type' => 'hidden']);
                                echo $this->Form->input('type', ['value' => 'page', 'type' => 'hidden']);
                                echo $this->Form->input('title', ['label' => __('Title'), 'class' => 'required', 'required' => 'required', 'type' => 'text']);
                                echo $this->Form->input('content', ['label' => __('Content'), 'class' => 'text-editor-summernote']);
                            ?>
                        </div>
                    </div>
                    <div class="col-sm-4 sidebar p-r-0 m-t-0">
                        <div class="entry">
                            <div class="title-sep">Publicar</div>
                            <?php
                                echo $this->Form->input('status', ['label' => __('Status'), 'options' => [
                                        1 => __('Published'),
                                        0 => __('Draft'),
                                        2 => __('Pending Review'),
                                    ]]);
                            ?>
                            <div class="text-right">
                                <?= $this->Form->button(__('Save'), ['class' => 'btn btn-large btn-default']) ?>
                            </div>
                        </div>
                        <br>
                        <div class="entry">
                            <div class="title-sep">Imagem Destacada</div>
                            <?php
                                echo $this->Form->input('image', ['label' => false, 'type' => 'file']);
                            ?>
                        </div>
                    </div>
                    <br />
                <div class="clearfix"></div>
                </fieldset>
            <?= $this->Form->end() ?>
        </div>
    </div>
</section>
<?php
    $this->Html->script([
            ASSETS_JS.'vendor/summernote/summernote.min.js',
            ASSETS_JS.'vendor/summernote/summernote-pt-BR.js'
        ], ['block' => 'scriptBottom']);
    $this->Html->css([
            ASSETS_JS.'vendor/summernote/summernote.css'
        ], ['block' => 'css']);
?>