<?php
namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * MenusFixture
 *
 */
class MenusFixture extends TestFixture
{

    /**
     * Table name
     *
     * @var string
     */
    public $table = 'menus';

    /**
     * Fields
     *
     * @var array
     */
    // @codingStandardsIgnoreStart
    public $fields = [
        'id' => ['type' => 'integer', 'length' => 11, 'unsigned' => true, 'null' => false, 'default' => null, 'comment' => '', 'autoIncrement' => true, 'precision' => null],
        'domain_id' => ['type' => 'integer', 'length' => 11, 'unsigned' => true, 'null' => false, 'default' => null, 'comment' => '', 'precision' => null, 'autoIncrement' => null],
        'parent_id' => ['type' => 'integer', 'length' => 11, 'unsigned' => true, 'null' => true, 'default' => null, 'comment' => '', 'precision' => null, 'autoIncrement' => null],
        'lft' => ['type' => 'integer', 'length' => 11, 'unsigned' => false, 'null' => true, 'default' => null, 'comment' => '', 'precision' => null, 'autoIncrement' => null],
        'rght' => ['type' => 'integer', 'length' => 11, 'unsigned' => false, 'null' => true, 'default' => null, 'comment' => '', 'precision' => null, 'autoIncrement' => null],
        'title' => ['type' => 'string', 'length' => 100, 'null' => false, 'default' => null, 'comment' => '', 'precision' => null, 'fixed' => null],
        'slug' => ['type' => 'string', 'length' => 100, 'null' => false, 'default' => null, 'comment' => '', 'precision' => null, 'fixed' => null],
        'link' => ['type' => 'string', 'length' => 255, 'null' => true, 'default' => null, 'comment' => '', 'precision' => null, 'fixed' => null],
        'position' => ['type' => 'string', 'length' => 50, 'null' => true, 'default' => null, 'comment' => 'top, header, sidebar_left, sidebar_right, footer, bottom, ...', 'precision' => null, 'fixed' => null],
        'target' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => null, 'comment' => 'self, iframe, blank, ...', 'precision' => null, 'fixed' => null],
        'type' => ['type' => 'string', 'length' => 20, 'null' => true, 'default' => null, 'comment' => 'external, force_download, ...', 'precision' => null, 'fixed' => null],
        'locale' => ['type' => 'string', 'length' => 7, 'null' => false, 'default' => 'pt_BR', 'comment' => '', 'precision' => null, 'fixed' => null],
        'sort' => ['type' => 'integer', 'length' => 10, 'unsigned' => true, 'null' => false, 'default' => null, 'comment' => '', 'precision' => null, 'autoIncrement' => null],
        'access' => ['type' => 'string', 'length' => 20, 'null' => false, 'default' => 'public', 'comment' => 'public, private, ...', 'precision' => null, 'fixed' => null],
        'status' => ['type' => 'integer', 'length' => 2, 'unsigned' => true, 'null' => false, 'default' => '1', 'comment' => '', 'precision' => null, 'autoIncrement' => null],
        '_indexes' => [
            'status' => ['type' => 'index', 'columns' => ['status'], 'length' => []],
            'domain_id' => ['type' => 'index', 'columns' => ['domain_id'], 'length' => []],
            'parent_id' => ['type' => 'index', 'columns' => ['parent_id'], 'length' => []],
        ],
        '_constraints' => [
            'primary' => ['type' => 'primary', 'columns' => ['id'], 'length' => []],
            'menus_domains' => ['type' => 'foreign', 'columns' => ['domain_id'], 'references' => ['domains', 'id'], 'update' => 'restrict', 'delete' => 'cascade', 'length' => []],
            'menus_parents' => ['type' => 'foreign', 'columns' => ['parent_id'], 'references' => ['menus', 'id'], 'update' => 'restrict', 'delete' => 'cascade', 'length' => []],
        ],
        '_options' => [
            'engine' => 'InnoDB',
            'collation' => 'utf8_general_ci'
        ],
    ];
    // @codingStandardsIgnoreEnd

    /**
     * Records
     *
     * @var array
     */
    public $records = [
        [
            'id' => 1,
            'domain_id' => 1,
            'parent_id' => 1,
            'lft' => 1,
            'rght' => 1,
            'title' => 'Lorem ipsum dolor sit amet',
            'slug' => 'Lorem ipsum dolor sit amet',
            'link' => 'Lorem ipsum dolor sit amet',
            'position' => 'Lorem ipsum dolor sit amet',
            'target' => 'Lorem ipsum dolor ',
            'type' => 'Lorem ipsum dolor ',
            'locale' => 'Lorem',
            'sort' => 1,
            'access' => 'Lorem ipsum dolor ',
            'status' => 1
        ],
    ];
}
