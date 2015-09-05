<?php
namespace App\Controller;

use App\Controller\AppController;
use Cake\Event\Event;
use Cake\Network\Email\Email;
use App\Auth\LegacyPasswordHasher;
use Cake\Core\Configure;

/**
 * Users Controller
 *
 * @property \App\Model\Table\UsersTable $Users
 */
class UsersController extends AppController
{
    private $no_redirect = false;

    public function beforeFilter(Event $event)
    {
        parent::beforeFilter($event);
        $this->Auth->allow(['login', 'logout', 'reminder']);
    }

    public function login()
    {
        if ($this->request->is('post')) {
            $user = $this->Auth->identify();
            if ($user) {
                $this->Auth->setUser($user);
                $this->_authExtras();
                return $this->redirect($this->Auth->redirectUrl());
            } else {
                $this->Flash->error(__('Invalid username or password, try again.'), ['key' => 'auth']);
            }
        }
    }

    public function logout()
    {
        $this->request->session()->destroy();
        $this->Cookie->delete('Auth.token');
        return $this->redirect($this->Auth->logout());
    }

    public function reminder()
    {
        if ($this->request->is('post')) {
            $user = $this->Users->findByEmail($this->request->data['email'])->first();
            if ($user) {
                $email = new Email('default');
                $email->template('reminder', 'default')
                    ->to($user->email)
                    ->subject('Recuperação de Senha')
                    ->viewVars(['name' => $user->name,
                                'email' => $user->email,
                                'password' => (new LegacyPasswordHasher)->decode($user->password)])
                    ->send();
                unset($this->request->data['email']);
                $this->Flash->success(__('We sent an email to you. Open your inbox to check your password.'), ['key' => 'auth']);
            } else {
                $this->Flash->error(__('E-mail does not exist.'), ['key' => 'auth']);
            }
        }
    }

    public function me()
    {
        $this->no_redirect = true;
        $this->edit($this->Auth->user('id'));
    }

    /**
     * Index method
     *
     * @return void
     */
    public function index()
    {
        $this->paginate = [
            'contain' => ['Roles', 'Labels']
        ];
        if(!empty($this->request->query['search'])) {
            $this->paginate['conditions'] = [$this->Users->displayField().' LIKE' => '%'.$this->request->query['search'].'%'];
        }
        $this->paginate['order'] = [$this->Users->displayField() => 'ASC'];
        $this->set('users', $this->paginate($this->Users));
        $this->set('_serialize', ['users']);
    }

    /**
     * Add method
     *
     * @return void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $user = $this->Users->newEntity();
        if ($this->request->is('post')) {
            $user = $this->Users->patchEntity($user, $this->request->data);
            if ($this->Users->save($user)) {
                $this->Flash->success(__('Saved successfully'));
                return $this->redirect(['action' => 'index', '?' => @$this->request->query]);
            } else {
                $this->Flash->error(__('Error: It not saved. Please, try again.').$this->Common->getEntityErrors($user));
            }
        }
        $roles = $this->Users->Roles->find('list', ['limit' => 200]);
        $labels = $this->Users->Labels->find('list', ['limit' => 200]);
        $this->set(compact('user', 'roles', 'labels'));
        $this->set('_serialize', ['user']);
    }

    /**
     * Edit method
     *
     * @param string|null $id User id.
     * @return void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $user = $this->Users->get($id, [
            'contain' => []
        ]);
        if ($this->request->is(['patch', 'post', 'put'])) {
            if(!empty($this->request->data['new_password'])) {
                $this->request->data['password'] = $this->request->data['new_password'];
            }
            $user = $this->Users->patchEntity($user, $this->request->data);
            if ($this->Users->save($user)) {
                $upload = $this->_avatar($user->id);
                if($upload==='ok') {
                    $this->Flash->success(__('Saved successfully'));
                    if (!$this->no_redirect) {
                        return $this->redirect(['action' => 'index', '?' => @$this->request->query]);
                    }
                    unset($this->request->data['new_password']); unset($this->request->data['confirm_new_password']);
                    unset($user->new_password); unset($user->confirm_new_password);
                } else {
                    $this->Flash->error(__('Upload Error').':<br>'.$upload);
                }
            } else {
                $this->Flash->error(__('Error: It not saved. Please, try again.').$this->Common->getEntityErrors($user));
            }
        }
        unset($user->password);
        $roles = $this->Users->Roles->find('list', ['limit' => 200]);
        $labels = $this->Users->Labels->find('list', ['limit' => 200]);
        $this->set(compact('user', 'roles', 'labels'));
        $this->set('_serialize', ['user']);
    }

    /**
     * Delete method
     *
     * @param string|null $id User id.
     * @return void Redirects to index.
     * @throws \Cake\Network\Exception\NotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $user = $this->Users->get($id);
        if ($this->Users->delete($user)) {
            @unlink(UPLOADS.'avatars/'.$id.'.jpg');
            $this->Flash->success(__('Deleted successfully'));
        } else {
            $this->Flash->error(__('Error: It not deleted. Please, try again.'));
        }
        return $this->redirect(['action' => 'index', '?' => @$this->request->query]);
    }

    private function _avatar($user_id)
    {
        if(empty($this->request->data['image']['name'])) {
            return 'ok';
        }

        if(USE_AWS_S3) {
            define('awsAccessKey', Configure::read('S3.awsAccessKey'));
            define('awsSecretKey', Configure::read('S3.awsSecretKey'));
            $handle = new \Upload\uploadS3($this->request->data['image'], \Locale::getDefault());
        } else {
            $handle = new \Upload\upload($this->request->data['image'], \Locale::getDefault());
        }
        if($handle->uploaded) {
            $uri                          = Configure::read('S3.bucket_uri').'/avatars/';
            $handle->bucket               = Configure::read('S3.bucket');
            $handle->bucket_uri           = 'uploads/'.$uri;
            $handle->file_new_name_body   = $user_id;
            $handle->file_safe_name       = true;
            $handle->file_overwrite       = true;
            $handle->allowed              = array('image/*');
            $handle->image_convert        = 'jpg';
            $handle->jpeg_quality         = 90;
            $handle->image_resize         = true;
            $handle->image_x              = 200;
            $handle->image_y              = 200;
            $handle->image_ratio_crop     = true;
            $handle->process(USE_AWS_S3 ? TMP : UPLOADS.$uri );
            if ($handle->processed) {
                $handle->clean();
                $this->request->session()->write('Auth.User.avatar', $user_id.'.jpg');
                return 'ok';
            } else {
                return $handle->error;
            }
        } else {
            return $handle->error;
        }
    }
}