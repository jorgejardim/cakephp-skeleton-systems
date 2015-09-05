<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;
use Cake\Utility\Inflector;

/**
 * Test Entity.
 */
class Test extends Entity
{

    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     * Note that '*' is set to true, which allows all unspecified fields to be
     * mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        '*' => true,
        'id' => false,
    ];

    protected function _setSlug($slug)
    {
        return strtolower(Inflector::slug($slug));
    }

    protected function _setCalendar($calendar)
    {
        return is_object($calendar) ? $calendar->format('Y-m-d H:i') : $calendar;
    }

    protected function _getCalendar($calendar)
    {
        return is_object($calendar) ? $calendar->format('d/m/Y H:i') : $calendar;
    }

    protected function _getHour($hour)
    {
        return is_object($hour) ? $hour->format('H:i') : $hour;
    }
}
