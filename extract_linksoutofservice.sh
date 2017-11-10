#!/bin/bash
# Desenvolvido por: Tiago Melo
#
# Script que realiza o parsing dos logs dos Links encontrando os eventos de OutofService
# Este script deve estar dentro dos diretorios dos logs e 
# 
#
init(){

  LOGFILE=$(find . -type f -name "*.log" -print | awk -F "/" '{print $2}') #Find percorrendo o diretório local em busca de arquivos .log
}

extractOutOfService(){

  for file in $LOGFILE #Loop que percorre o diretorios de logs
  do
	   #Busca pelas linhas com o evento de OutofService em cada file com o nome do arquivo de log
       awk '/OutofService/ {

       for(i=1;i<=x;)print a[i++];print #Busca linhas acima e imprime

      };
      {
       for(i=1;i<x;i++)a[i]=a[i+1];a[x]=$0;

      }
      '  x=4 $file >> outofservice_"$file" #Redireciona para arquivos separados por regiao
  done
}
#Main
init
extractOutOfService
