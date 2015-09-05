<%
use Cake\Utility\Inflector;
$fields = collection($fields)
        ->filter(function($field) use ($schema) {
    return $schema->columnType($field) !== 'binary';
});
%>
<section class="main-page">
    <div class="container">
        <div class="page-title pull-md-left">
            <h3><?= __('<%= Inflector::humanize($action) %> {0}', [__('<%= $singularHumanName %>')]) ?></h3>
        </div>
        <div class="page-actions pull-md-right">
            <div class="btn-group" role="group">
                <% if (strpos($action, 'add') === false): %>
<?= $this->Form->postLink('<i class="fa fa-trash-o"></i> ' . __('Delete'), ['action' => 'delete', $<%= $singularVar %>-><%= $primaryKey[0] %>], ['confirm' => __('Are you sure you want to delete?'), 'escape' => false, 'class' => 'btn btn-page-action btn-page-action-delete']) ?>
                <a href="<?= $this->Url->build(['action' => 'view', $<%= $singularVar %>-><%= $primaryKey[0] %>]) ?>" class="btn btn-page-action"><i class="fa fa-eye"></i> <?= __('View'); ?></a>
                <a href="<?= $this->Url->build(['action' => 'add']) ?>" class="btn btn-page-action"><i class="fa fa-plus-circle"></i> <?= __('New'); ?></a>
                <% endif; %>
<a href="<?= $this->Url->build(['action' => 'index']) ?>" class="btn btn-page-action"><i class="fa fa-list"></i> <?= __('List'); ?></a>
            </div>
        </div>
        <div class="visible-xs-block visible-sm-block"><br /></div>
        <div class="clearfix"></div>
        <div class="entry">
            <?= $this->Flash->render() ?>
            <?= $this->Form->create($<%= $singularVar %>, ['class' => 'validate']); ?>
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <fieldset>
                        <?php
              <%
              foreach ($fields as $field) {
                  if (in_array($field, $primaryKey)) {
                      continue;
                  }
                  if (isset($keyFields[$field])) {
              %>
              echo $this->Form->input('<%= $field %>', ['options' => $<%= $keyFields[$field] %>]);
              <%
                      continue;
                  }
                  if (!in_array($field, ['created', 'modified', 'updated'])) {
              %>
              echo $this->Form->input('<%= $field %>', ['label' => __('<%= Inflector::humanize($field) %>')]);
              <%
                  }
              }
              if (!empty($associations['BelongsToMany'])) {
                  foreach ($associations['BelongsToMany'] as $assocName => $assocData) {
                      %>
              echo $this->Form->input('<%= $assocData['property'] %>._ids', ['options' => $<%= $assocData['variable'] %>]);
                      <%
                  }
              }
          %>
          ?>
                        <div class="clearfix"></div>
                    </fieldset>
                    <br />
                    <div class="text-right">
                        <?= $this->Form->button(__('Submit'), ['class' => 'btn btn-large btn-default']) ?>
                    </div>
                </div>
                <div class="col-md-3"></div>
                <div class="clearfix"></div>
            <?= $this->Form->end() ?>
        </div>
    </div>
</section>