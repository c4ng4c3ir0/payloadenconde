#!/bin/bash

# Obtém a entrada do usuário
read -p "Insere esse lixo de payload: " input_string

# Define uma variável para armazenar a string codificada em URL
url_encoded_string=""

# Itera através de cada caractere na string de entrada
for (( i=0; i<${#input_string}; i++ )); do
  # Obtém o caractere atual
  current_char=${input_string:$i:1}
  
  # Verifica se o caractere é um espaço
  if [[ $current_char == " " ]]; then
    # Se for um espaço, adiciona "%20" à string codificada em URL
    url_encoded_string+="%20"
  else
    # Caso contrário, usa o comando "printf" para codificar o caractere em URL e adicioná-lo à string codificada em URL
    printf -v encoded_char "%%%02X" "'$current_char"
    url_encoded_string+=$encoded_char
  fi
done

# Imprime a string codificada em URL
echo "o resultado dessa porcaria é: $url_encoded_string"
