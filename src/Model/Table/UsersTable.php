<?php
namespace App\Model\Table;

use App\Model\Entity\User;
use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Users Model
 *
 * @property \Cake\ORM\Association\BelongsTo $Labels
 * @property \Cake\ORM\Association\HasMany $Agendas
 * @property \Cake\ORM\Association\HasMany $Processes
 */
class UsersTable extends Table
{

    /**
     * Initialize method
     *
     * @param array $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config)
    {
        $this->table('users');
        $this->displayField('name');
        $this->primaryKey('id');
        $this->addBehavior('Timestamp');
        $this->belongsTo('Roles', [
            'foreignKey' => 'role_id'
        ]);
        $this->belongsTo('Labels', [
            'foreignKey' => 'label_id'
        ]);
        $this->hasMany('Agendas', [
            'foreignKey' => 'user_id'
        ]);
        $this->hasMany('Processes', [
            'foreignKey' => 'user_id'
        ]);
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator)
    {
        $validator
            ->add('id', 'valid', ['rule' => 'numeric', 'message' => __('The provided value for the {0} field is invalid', __('Id'))])
            ->allowEmpty('id', 'create');

        $validator
            ->requirePresence('name', 'create', __('This field {0} is required', __('Name')))
            ->notEmpty('name', __('This field {0} is required', __('Name')));

        $validator
            ->add('email', 'valid', ['rule' => 'email', 'message' => __('The provided value for the {0} field is invalid', __('Email'))])
            ->requirePresence('email', 'create', __('This field {0} is required', __('Email')))
            ->notEmpty('email', __('This field {0} is required', __('Email')))
            ->add('email', 'unique', ['rule' => 'validateUnique', 'provider' => 'table', 'message' => __('The provided value for the {0} field is invalid', __('Email'))]);

        $validator
            ->requirePresence('password', 'create', __('This field {0} is required', __('Password')))
            ->notEmpty('password', __('This field {0} is required', __('Password')));

        $validator
            ->allowEmpty('new_password');

        $validator
            ->add('confirm_new_password', ['compare' => ['rule' => ['compareWith', 'new_password'], 'message' => __('The provided value for the {0} field is invalid. Must match the field {1}.', [__('Confirm new password'), __('New password')])]])
            ->allowEmpty('confirm_new_password');

        $validator
            ->allowEmpty('auth_token');

        $validator
            ->add('status', 'valid', ['rule' => 'boolean', 'message' => __('The provided value for the {0} field is invalid', __('Status'))])
            ->requirePresence('status', 'create', __('This field {0} is required', __('Status')))
            ->notEmpty('status', __('This field {0} is required', __('Status')));

        return $validator;
    }

    /**
     * Returns a rules checker object that will be used for validating
     * application integrity.
     *
     * @param \Cake\ORM\RulesChecker $rules The rules object to be modified.
     * @return \Cake\ORM\RulesChecker
     */
    public function buildRules(RulesChecker $rules)
    {
        $rules->add($rules->isUnique(['email']));
        $rules->add($rules->existsIn(['label_id'], 'Labels'));
        $rules->add($rules->existsIn(['role_id'], 'Roles'));
        return $rules;
    }
}