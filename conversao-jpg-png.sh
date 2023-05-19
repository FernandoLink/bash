#!/bin/bash

converte_imagem(){
cd ~/scripts/imagens-livros

if [ ! -d png ]
then
  mkdir png
fi

for image in *.jpg 
do
  local IMAGE=$(ls $image | awk -F. '{ print $1 }')
  convert $IMAGE.jpg png/$IMAGE.png
done
}

converte_imagem 2> log_erro.txt

if [ $? -eq 0 ]
then
  echo "Conversao realizada com sucesso"
else
  echo "Houve uma falha no processo"
fi
