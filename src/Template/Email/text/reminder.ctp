Olá, <?php echo $name; ?>.

Você ou outra pessoa usou seu endereço de e-mail para lembrar sua senha de acesso.

Seu login: <?php echo $email; ?>
Sua senha: <?php echo $password; ?>

Link:
<?php echo $this->Url->build('/login', true); ?>

Se você não solicitou este email, por favor, desconsidere.