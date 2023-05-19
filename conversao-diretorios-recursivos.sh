#!/bin/bash

converte_imagem(){
  local PATH_IMAGE=$1  
  local IMAGE=$(ls $PATH_IMAGE | awk -F. '{ print $1 }')
  convert $IMAGE.jpg $IMAGE.png
}

varrer_diretorio(){
  cd $1
  for file in *
  do
    local PATH_FILE=$(find ~/scripts/imagens-novos-livros -name $file)
    if [ -d $PATH_FILE ]
    then
      varrer_diretorio $PATH_FILE
    else
      converte_imagem $PATH_FILE
    fi
  done
}

varrer_diretorio ~/scripts/imagens-novos-livros 2> log_erro.txt

if [ $? -eq 0 ]
then
  echo "Conversao efetuada com sucesso"
else
  echo "Houve falha no processo"
fi
