<?php
namespace App\Test\TestCase\Model\Table;

use App\Model\Table\ContentsCommentsTable;
use Cake\ORM\TableRegistry;
use Cake\TestSuite\TestCase;

/**
 * App\Model\Table\ContentsCommentsTable Test Case
 */
class ContentsCommentsTableTest extends TestCase
{

    /**
     * Fixtures
     *
     * @var array
     */
    public $fixtures = [
        'app.contents_comments',
        'app.contents',
        'app.domains',
        'app.contracts',
        'app.users',
        'app.categories',
        'app.contents_categories',
        'app.menus',
        'app.modules',
        'app.options',
        'app.templates'
    ];

    /**
     * setUp method
     *
     * @return void
     */
    public function setUp()
    {
        parent::setUp();
        $config = TableRegistry::exists('ContentsComments') ? [] : ['className' => 'App\Model\Table\ContentsCommentsTable'];
        $this->ContentsComments = TableRegistry::get('ContentsComments', $config);
    }

    /**
     * tearDown method
     *
     * @return void
     */
    public function tearDown()
    {
        unset($this->ContentsComments);

        parent::tearDown();
    }

    /**
     * Test initialize method
     *
     * @return void
     */
    public function testInitialize()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test validationDefault method
     *
     * @return void
     */
    public function testValidationDefault()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }

    /**
     * Test buildRules method
     *
     * @return void
     */
    public function testBuildRules()
    {
        $this->markTestIncomplete('Not implemented yet.');
    }
}
