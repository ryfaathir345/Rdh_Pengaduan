<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Petuga $petuga
 */
?>

<?php
$this->assign('title', __('Petuga'));
$this->Breadcrumbs->add([
    ['title' => __('Home'), 'url' => '/'],
    ['title' => __('List Petugas'), 'url' => ['action' => 'index']],
    ['title' => __('View')],
]);
?>

<div class="view card card-primary card-outline">
    <div class="card-header d-sm-flex">
        <h2 class="card-title"><?= h($petuga->nama) ?></h2>
    </div>
    <div class="card-body table-responsive p-0">
        <table class="table table-hover text-nowrap">
            <tr>
                <th><?= __('Nik') ?></th>
                <td><?= h($petuga->nik) ?></td>
            </tr>
            <tr>
                <th><?= __('Nama') ?></th>
                <td><?= h($petuga->nama) ?></td>
            </tr>
            <tr>
                <th><?= __('Username') ?></th>
                <td><?= h($petuga->username) ?></td>
            </tr>
            <tr>
                <th><?= __('Telp') ?></th>
                <td><?= h($petuga->telp) ?></td>
            </tr>
            <tr>
                <th><?= __('Level') ?></th>
                <td><?= h($petuga->level) ?></td>
            </tr>
            <tr>
                <th><?= __('Id') ?></th>
                <td><?= $this->Number->format($petuga->id) ?></td>
            </tr>
        </table>
    </div>
    <div class="card-footer d-flex">
        <div class="mr-auto">
            <?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $petuga->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $petuga->id), 'class' => 'btn btn-danger']
            ) ?>
        </div>
        <div class="ml-auto">
            <?= $this->Html->link(__('Edit'), ['action' => 'edit', $petuga->id], ['class' => 'btn btn-secondary']) ?>
            <?= $this->Html->link(__('Cancel'), ['action' => 'index'], ['class' => 'btn btn-default']) ?>
            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editFotoModal">Edit Foto</button>
        </div>
    </div>
</div>

<div class="modal fade" id="editFotoModal" tabindex="-1" aria-labelledby="editFotoModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editFotoModalLabel">Edit Foto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <?= $this->Form->create($petuga, [ 'url' => ['controller' => 'users', 'action' => 'editFoto', $petuga->id], 'enctype' => 'multipart/form-data']) ?>
                    <fieldset>
                        <legend><?= __('Edit Foto') ?></legend>
                        <?php
                            echo "<div class='mb-3'><label class='form-label'>Foto</label></div>";
                            echo $this->Form->file('foto', ['class' => 'form-control', 'required']);
                        ?>
                    </fieldset>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <?= $this->Form->button(('Save changes'), ['class' => 'btn btn-primary']) ?>
                <?= $this->Form->end() ?>
            </div>
        </div>
    </div>
</div>

