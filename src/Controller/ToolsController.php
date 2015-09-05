<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\Cache\Cache;
use Cake\Event\Event;

class ToolsController extends AppController
{
    public function beforeFilter(Event $event)
    {
        parent::beforeFilter($event);
        $this->Auth->allow(['clear_cache']);
    }

    /**
     * Clear cache.
     *
     * @return void
     */
    public function clear_cache()
    {
        $result = Cache::clear(false);
        $this->set('result', $result);
        $this->set('_serialize', ['result']);
    }
}