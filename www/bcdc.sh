#!/bin/bash

function pause(){
read -p "$*"
}

sed -i 's/world! $2/world! $1/g' index.php

git add .
sleep 5
git commit -m $1
sleep 5
git push https://renanrmoraes:q1w2e3R%24@github.com/renanrmoraes/hpa.git --all
echo "Login OCP 3.11"
oc login https://ocp.democenter.cloud:8443 -u system:admin
oc project rollack
oc patch bc/hpa --patch '{"spec":{"output":{"to":{"name": "hpa:$1"}}}}'
oc start-build hpa
echo "Login OCP 3.9"
oc login https://master39.democenter.cloud:8443 -u system:admin
oc project rollack
oc patch bc/hpa --patch '{"spec":{"output":{"to":{"name": "hpa:$1"}}}}'
oc start-build hpa

pause 'Aguardar Buld nos 2 projetos terminar'

echo "Login OCP 3.11"
oc login https://ocp.democenter.cloud:8443 -u system:admin
oc project rollack
oc set triggers dc/hpa --remove-all=true
oc set triggers dc/hpa --containers=hpa --from-image=hpa:$1
oc rollout latest dc/hpa
echo "Login OCP 3.9"
oc login https://master39.democenter.cloud:8443 -u system:admin
oc project rollack
oc set triggers dc/hpa --remove-all=true
oc set triggers dc/hpa --containers=hpa --from-image=hpa:$1
oc rollout latest dc/hpa
