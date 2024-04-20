<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Petuga $petuga
 */
?>

<?php
    $this->assign('title', __('Add Petuga'));
    $this->Breadcrumbs->add([
        ['title' => __('Home'), 'url' => '/'],
        ['title' => __('List Petugas'), 'url' => ['action' => 'index']],
        ['title' => __('Add')],
    ]);

    $option = [];
    $level = $this->Identity->get('level');
    if ($level == 'admin') {
        $option = ['admin' => 'Admin', 'petugas' => 'Petugas', 'masyarakat' => 'Masyarakat'];
    }elseif ($level == 'petugas'){
        $option = ['petugas' => 'Petugas', 'masyarakat' => 'Masyarakat'];
    }else {
        $option = ['masyarakat' => 'Masyarakat'];
    }
?>

<div class="card card-primary card-outline">
    <?= $this->Form->create($petuga, ['valueSources' => ['query', 'context'], 'type' => 'file']) ?>
    <div class="card-body">
        <?= $this->Form->control('nik') ?>
        <?= $this->Form->control('nama') ?>
        <?= $this->Form->control('username') ?>
        <?= $this->Form->control('images', ['label' => 'Foto Profil', 'type' => 'file']) ?>
        <?= $this->Form->control('password') ?>
        <?= $this->Form->control('telp') ?>
        <?= $this->Form->control('level', ['options' => $option, 'class' => 'form-control']) ?>
    </div>
    <div class="card-footer d-flex">
        <div class="ml-auto">
            <?= $this->Form->button(__('Save'), ['class' => 'btn btn-primary']) ?>
            <?= $this->Html->link(__('Cancel'), ['action' => 'index'], ['class' => 'btn btn-default']) ?>
        </div>
    </div>
    <?= $this->Form->end() ?>
</div>