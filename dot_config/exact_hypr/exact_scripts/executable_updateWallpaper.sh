#!/bin/bash

baseUrl="https://wallhaven.cc/api/v1/search"
apiKey=frKKQHulAjiG6H0VuQUq1qYVtaokwa7u
atLeast="3440x1440"
sorting="random"
purity=100
categories=111
query="+landscape +nature +sky type:jpg"

img="background.jpg"
imgFolder="$HOME/.local/share/wallhaven"
imagePath="$imgFolder/$img"

mkdir -p $imgFolder

response=`curl -s -G \
  --data-urlencode "apikey=$apiKey" \
  --data-urlencode "atleast=$atLeast" \
  --data-urlencode "sorting=$sorting" \
  --data-urlencode "purity=$purity" \
  --data-urlencode "categories=$categories" \
  --data-urlencode "q=$query" \
  "$baseUrl"`

randomImage=`jq '.data.[0]' <<< $response`

echo `jq <<< $randomImage`

fileUrl=`jq -r '.path' <<< $randomImage`

echo $imagePath
echo $fileUrl

curl -o $imagePath "$fileUrl"
