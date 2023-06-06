#Processo de Backup Fisico 

#Declarar as variavéis:
DATE=`date +%d/%m/%Y-%H%M%S`
BKP_DIRETORIO='/var/backups/postgresql/15/main/'
ARQLOG='/mnt/c/Desenv/Projetos-Estudos/Postgres_Backup_Fisico/relatorio.txt'

echo                                             
echo "-------------------------------------"  
echo "--   CONFIGURAÇÃO DOS DIRETORIOS   --"  
echo "-------------------------------------"  
echo                                         

#Condição que verifica se o arquivo existe
if [ -e $ARQLOG ]; then
 echo 'Diretório configurado'
else
 cd '/mnt/c/Desenv/Projeto-Estudos/Postgres_Backup_Fisico/'
  touch $ARQLOG
  chmod +x $ARQLOG
fi
echo

echo                                             
echo "--------------------------"  
echo "--   INICIO DE BACKUP   --"  
echo "--------------------------"  
echo $DATE
echo

#Passando informações para arquivo de relatório
echo "-------------------------"  >  $ARQLOG
echo "--   INICIO DO BACKUP  --"  >> $ARQLOG
echo "-------------------------"  >> $ARQLOG
echo                              >> $ARQLOG
echo $DATE                        >> $ARQLOG
echo                              >> $ARQLOG   
    
psql -U postgres <<-EOF >> $ARQLOG
SELECT pg_backup_start('Inicio de backup', true);
\! tar czf /var/backups/postgresql/15/main/cluster.tar.gz /var/lib/postgresql/15/main
SELECT pg_backup_stop(false);
EOF

echo                          >> $ARQLOG      
echo "---------------------"  >> $ARQLOG
echo "--  FIM DO BACKUP  --"  >> $ARQLOG
echo "---------------------"  >> $ARQLOG
echo                          >> $ARQLOG
echo $DATE                    >> $ARQLOG
echo                          >> $ARQLOG

echo "-----------------------"  
echo "--   FIM DE BACKUP   --"  
echo "-----------------------"  
echo $DATE
echo

#Fazendo a verificação dos arquivos walls de backup
echo
echo "-----------------------------------------"  
echo "--   INICIO DA VERIFICAÇÃO DO BACKUP   --"  
echo "-----------------------------------------"  
echo $DATE
echo

echo                                >> $ARQLOG      
echo "---------------------------"  >> $ARQLOG
echo "-- VERIFICAÇÃO DE BACKUP --"  >> $ARQLOG
echo "---------------------------"  >> $ARQLOG
echo $DATE                          >> $ARQLOG
echo                                >> $ARQLOG


echo "Acessado diretório de backup" >> $ARQLOG
cd $BKP_DIRETORIO 
 ls -l >> $ARQLOG

echo                                              >> $ARQLOG
echo "Removendo arquivos walls anteriores e arquivos de backup anteriores" >> $ARQLOG
find -name "0000*" -mtime +1 -exec rm -rf {} \;   >> $ARQLOG


echo                                                >> $ARQLOG
echo "Verificando novamente os registros de backup" >> $ARQLOG
cd $BKP_DIRETORIO
 ls -l >> $ARQLOG

echo
echo "--------------------------------------"  
echo "--   FIM DA VERIFICAÇÃO DO BACKUP   --"  
echo "--------------------------------------"  
echo $DATE
echo

echo                                       >> $ARQLOG      
echo "----------------------------------"  >> $ARQLOG
echo "-- FIM DE VERIFICAÇÃO DE BACKUP --"  >> $ARQLOG
echo "----------------------------------"  >> $ARQLOG
echo $DATE                                 >> $ARQLOG
echo                                       >> $ARQLOG


# Fim de backup

echo                                      
echo "-----------------------"     
echo "-- BACKUP FINALIZADO --"      
echo "-----------------------"      
echo                                
echo $DATE                          
echo   




echo                                >> $ARQLOG      
echo "-----------------------"      >> $ARQLOG
echo "-- BACKUP FINALIZADO --"      >> $ARQLOG
echo "-----------------------"      >> $ARQLOG
echo                                >> $ARQLOG
echo $DATE                          >> $ARQLOG
echo   
