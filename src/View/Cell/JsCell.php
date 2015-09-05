<?php
namespace App\View\Cell;

use Cake\View\Cell;

/**
 * Js cell
 */
class JsCell extends Cell
{

    /**
     * List of valid options that can be passed into this
     * cell's constructor.
     *
     * @var array
     */
    protected $_validCellOptions = [];

    /**
     * Default display method.
     *
     * @return void
     */
    public function js($name)
    {
        $this->set('name', $name);
    }
}
