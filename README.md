# Backup Online PostgreSQL
Esse repositório tem como base gerar backups online diários do banco de dados PostgreSQL. O ideal é executar o arquivo no seu servidor ou sua máquina através de um cronjob, pois assim ele será executado no horário definido pelo adminsitrador do sitema.

# Procedimento de Backup Online - pg_backup_start()
> O que é o Backup Online:

Backup Online é conhecido como um backup que é gerado com o banco de dados ativo, digamos que temos um sistema de clientes rodando e você precisa fazer um backup. Não pode ser parado o sistema pois os clientes ficaram sem acessar a aplicação. O backuo online serve para utilizarmos a aplicação e o sistema de forma ativa e de uma forma com que não prejudique o usuário.
No PostgreSQL serve para o sistema de arquivamento continuo, sendo assim temos que configurar o sistema para que ele pegue as informações necessárias para o backup.

> Como preparar o sitema para o backup online:

Tendo o conhecimento que será necessário fazer o backup de forma online, precisamos já ter configurado para fazer o backup. Nesse caso precisamos configurar postgresql.conf para o arquivamento de WAL. Seguem as configurações principais que precisam ser alteradas:
- 'wal_level' -> recebe o valor 'replica'
- 'archive_mode' -> recebe o valor 'on'
- 'archive_command', 'restore_command', 'archive_cleanup_command' vão receber as configurações do seu diretório configurado.

# Documentação Relevante

Link documentação de backup restore: https://www.postgresql.org/docs/current/continuous-archiving.html
