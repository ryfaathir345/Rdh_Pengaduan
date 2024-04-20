<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Petuga $petuga
 */
?>

<?php
    $this->assign('title', __('Edit Petuga'));
    $this->Breadcrumbs->add([
        ['title' => __('Home'), 'url' => '/'],
        ['title' => __('List Petugas'), 'url' => ['action' => 'index']],
        ['title' => __('View'), 'url' => ['action' => 'view', $petuga->id]],
        ['title' => __('Edit')],
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
    <?= $this->Form->create($petuga, ['type' => 'file']) ?>
    <div class="card-body">
        <?= $this->Form->control('nik') ?>
        <?= $this->Form->control('nama') ?>
        <?= $this->Form->control('username') ?>
        <?= $this->Html->image('user/'.$petuga->foto,['height'=>'100px']) ?>
        <?= $this->Form->control('foto', ['type' => 'hidden']) ?>
        <?= $this->Form->control('images', ['type' => 'file']) ?>
        <?= $this->Form->control('password') ?>
        <?= $this->Form->control('telp') ?>
        <?= $this->Form->control('level', ['options' => $option, 'class' => 'form-control']) ?>
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
            <?= $this->Form->button(__('Save'), ['class' => 'btn btn-primary']) ?>
            <?= $this->Html->link(__('Cancel'), ['action' => 'view', $petuga->id], ['class' => 'btn btn-default']) ?>
        </div>
    </div>
    <?= $this->Form->end() ?>
</div>