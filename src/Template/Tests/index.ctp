        <div class="page-header">
            <div class="pull-sm-left">
                <h1><?= __('Tests') ?></h1>
            </div>
            <div class="page-actions pull-sm-right">
                <nav role="navigation" class="navbar navbar-default navbar-page-actions">
                    <div class="navbar-header">
                        <button type="button" data-target="#navbarCollapseActionsPage" data-toggle="collapse" class="navbar-toggle">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div id="navbarCollapseActionsPage" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="<?= $this->Url->build(['action' => 'add', '?' => @$this->request->query]) ?>" class="btn-page-action"><i class="fa fa-plus-circle"></i> <?= __('Add New {0}', [__('Tests')]); ?></a></li>
                        </ul>
                    </div>
                </nav>
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
                    <?= $this->Html->link(__('List {0}', [__('Tests')]), ['action' => 'index', '?' => @$this->request->query]); ?>
                </li>
            </ul>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="box">
                    <div class="box-content">
                        <?= $this->Flash->render() ?>
                        <?= $this->Form->create(null, ['type' => 'get', 'class' => 'table-filter pull-right']); ?>
                            <div class="dib">
                                <?php echo $this->Form->input('search', ['placeholder' => __('Search'), 'value' => @$this->request->query['search'], 'div' => false, 'label' => false]); ?>
                            </div>
                            <div class="dib">
                                <div class="btn-group">
                                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                        <i class="fa fa-cog"></i>
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-right">
                                        <li>
                                            <?= $this->Html->link(__('Export to PDF'), ['action' => 'pdf']); ?>
                                        </li>
                                        <li>
                                            <?= $this->Html->link(__('Export to Excel'), ['action' => 'index', '?' => @$this->request->query]); ?>
                                        </li>
                                        <li>
                                            <?= $this->Html->link(__('Page Blank'), ['action' => 'blank', '?' => @$this->request->query]); ?>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        <?= $this->Form->end() ?>
                        <div class="clearfix"></div>
                        <div class="table-responsive">
                            <table class="table table-hover table-nomargin table-striped table-bordered">
                                <?php if($tests->count()) { ?>
                                    <thead>
                                        <tr>
                                            <th><?= $this->Paginator->sort('id', __('Id')); ?></th>
                                            <th><?= $this->Paginator->sort('name', __('Name')); ?></th>
                                            <th><?= $this->Paginator->sort('slug', __('Slug')); ?></th>
                                            <th><?= $this->Paginator->sort('locale', __('Locale')); ?></th>
                                            <th><?= $this->Paginator->sort('date', __('Date')); ?></th>
                                            <th><?= $this->Paginator->sort('calendar', __('Calendar')); ?></th>
                                            <th><?= $this->Paginator->sort('hour', __('Hour')); ?></th>
                                            <th class="actions"><?= __('Actions'); ?></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($tests as $test): ?>
                                            <tr>
                                                <td><?= $this->Number->format($test->id) ?></td>
                                                <td><?= h($test->name) ?></td>
                                                <td><?= h($test->slug) ?></td>
                                                <td><?= h($test->locale) ?></td>
                                                <td><?= h($test->date) ?></td>
                                                <td><?= h($test->calendar) ?></td>
                                                <td><?= h($test->hour) ?></td>
                                                <td class="actions">
                                                    <?= $this->Html->link('<i class="fa fa-eye"></i>', ['action' => 'view', $test->id, '?' => @$this->request->query], ['title' => __('View'), 'class' => 'btn btn-blue btn-listing btn-small', 'escape' => false, 'data-toggle'=>'tooltip', 'data-placement'=>'top']) ?>
                                                    <?= $this->Html->link('<i class="fa fa-edit"></i>', ['action' => 'edit', $test->id, '?' => @$this->request->query], ['title' => __('Edit'), 'class' => 'btn btn-dark-blue btn-listing btn-small', 'escape' => false, 'data-toggle'=>'tooltip', 'data-placement'=>'top']) ?>
                                                    <?= $this->Form->postLink('<i class="fa fa-trash-o"></i>', ['action' => 'delete', $test->id, '?' => @$this->request->query], ['confirm' => __('Are you sure you want to delete # {0}?', $test->id), 'title' => __('Delete'), 'class' => 'btn btn-red btn-listing btn-small', 'escape' => false, 'data-toggle'=>'tooltip', 'data-placement'=>'top']) ?>
                                                </td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                <?php } else { ?>
                                    <tbody>
                                        <tr>
                                            <td class="text-center nopadding">
                                                <div class="alert alert-warning m0"><?= __('No results found') ?></div>
                                            </td>
                                        </tr>
                                    </tbody>
                                <?php } ?>
                            </table>
                        </div>
                        <?php if($this->Paginator->param('count') > 1) { ?>
                            <div class="paginator">
                                <div class="pull-left">
                                    <ul class="pagination">
                                        <?= $this->Paginator->prev('< ' . __('previous')) ?>
                                        <?= $this->Paginator->numbers() ?>
                                        <?= $this->Paginator->next(__('next') . ' >') ?>
                                    </ul>
                                </div>
                                <div class="pull-right pagination-count">
                                    <p><?= $this->Paginator->param('current').' '.__('of').' '.$this->Paginator->param('count') ?></p>
                                </div>
                                <div class="cleaxrfix"></div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>