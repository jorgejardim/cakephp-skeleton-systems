<section class="main-page">
    <div class="container">
        <div class="page-title pull-md-left">
            <h3><?= __('List {0}', [__('Contents')]) ?></h3>
        </div>
        <div class="page-actions pull-md-right">
            <div class="btn-group" role="group">
                <a href="<?= $this->Url->build(['action' => 'add']) ?>" class="btn btn-page-action"><i class="fa fa-plus-circle"></i> <?= __('Add New {0}', __('Page')); ?></a>
            </div>
        </div>
        <div class="visible-xs-block visible-sm-block"><br /></div>
        <div class="clearfix"></div>
        <div class="entry">
            <?= $this->Flash->render() ?>
            <table class="table table-hover table-nomargin table-striped table-bordered">
                <thead>
                    <tr>
                        <th><?= $this->Paginator->sort('name', __('Title')); ?></th>
                        <th><?= $this->Paginator->sort('status', __('Status')); ?></th>
                        <th class="actions"><?= __('Actions'); ?></th>
                    </tr>
                </thead>
                <tbody>
                    <?php if($contents->count()) { ?>
                        <?php
                            $status = [1 => __('Published'), 0 => __('Draft'), 2 => __('Pending Review')];
                            $colors = [1 => '#06F', 0 => '#FF0', 2 => '#F90'];
                        ?>
                        <?php foreach ($contents as $content): ?>
                        <tr>
                            <td><?= h($content->title) ?></td>
                            <td style="color:<?= $colors[$content->status] ?>"><?= $status[$content->status] ?></td>
                            <td class="actions" nowrap="nowrap">
                                <?= $this->Html->link('<i class="fa fa-eye"></i>', $this->Commons->menu_link($content->slug), ['title' => __('View'), 'class' => 'btn btn-blue btn-listing btn-small', 'escape' => false, 'data-toggle'=>'tooltip', 'data-placement'=>'top']) ?>
                                <?= $this->Html->link('<i class="fa fa-edit"></i>', ['action' => 'edit', $content->id], ['title' => __('Edit'), 'class' => 'btn btn-dark-blue btn-listing btn-small', 'escape' => false, 'data-toggle'=>'tooltip', 'data-placement'=>'top']) ?>
                                <?= $this->Form->postLink('<i class="fa fa-trash-o"></i>', ['action' => 'delete', $content->id], ['confirm' => __('Are you sure you want to delete # {0}?', $content->id), 'title' => __('Delete'), 'class' => 'btn btn-red btn-listing btn-small', 'escape' => false, 'data-toggle'=>'tooltip', 'data-placement'=>'top']) ?>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                    <?php } else { ?>
                            <tr>
                                <td class="text-center bg-beige" colspan="3"><?= __('No registration done') ?></td>
                            </tr>
                    <?php } ?>
                </tbody>
            </table>
            <div class="paginator">
                <div class="pagination fl">
                    <?= $this->Paginator->numbers(['class' => "clearfix", 'prev' => true, 'next' => true]) ?>
                </div>
                <div class="fr pagination-count">
                    <p><?= $this->Paginator->counter(); ?></p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</section>