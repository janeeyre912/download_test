#!/encs/bin/bash

APIKEY="dc7336e30240bda8635649c0c8fd245a62aeeca74e56efdcb3c6de661579c9c8"
FILE="sha256_list.txt" # Name of the file containing SHA256 hashes

while IFS= read -r SHA256; do
    screen -dmS "download_$SHA256" bash -c "curl -O --remote-header-name -G -d apikey=$APIKEY -d sha256=$SHA256 https://androzoo.uni.lu/api/download"
done < "$FILE"
