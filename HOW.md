#CAKE BAKE

bin/cake bake model ModelNames --table table_name --theme TemplateAdmin
bin/cake bake controller ModelNames --theme TemplateAdmin
bin/cake bake template ModelNames --theme TemplateAdmin

#Internationalization

\Locale::getDefault();
\Locale::setDefault('fr');

#Sessions
$this->request->session()->check('Auth.User.id');
$this->request->session()->read('Auth.User.id');
$this->request->session()->write('Auth.User.id', '1');
$this->request->session()->delete('Auth.User.id');

#Json
Add extensão na URL
Ex: http://localhost/app/posts.json