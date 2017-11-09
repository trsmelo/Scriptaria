#!/bin/bash
#
#Desenvolvido por: Tiago Melo
#
#Script que imprime um relatório baseado em um usuário passado por argumento checando se o mesmo é válido
#
USERNAME=$1 #Nome do usuário recebido por argumento

#Condicional que vai verificar se o argumento com o nome do usuário válido está sendo passado.
if [ -z $USERNAME ];then

    echo "Please provide a valid username. eg: root"
    exit 1
fi

getent passwd $USERNAME > /dev/null 2&>1 #verifica se o usuário passado existe, redirecionando o erro

if [ $? != 0 ]; then #verifica se o comando acima foi executado corretamente. Se  == 0 (ok) caso contrario o usuário n existe e script e encerrado
    echo "Please provide a valid user. eg: labccet"
    exit 1
fi

USERID=$(id -u $USERNAME) #Pega o user id do usuário
GROUPID=$(id -G $USERNAME) #Pega os grupos a qual o usuário pertence
USERPS=$(ps -U $USERNAME | awk -F " " '{print $1}' | grep -v "PID") #pega os processos do usuário filtrando para aparecer apenas os PIDs

# Imprime os conteúdos das variáveis
echo "Usuário: $USERNAME"
echo "UID: $USERID"
echo "GIDs: $GROUPID"
echo "PIDs:$USERPS"
