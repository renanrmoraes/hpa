#!/bin/bash
git add .
sleep 5
git commit -m $1
sleep 5
git push https://renanrmoraes:q1w2e3R%24@github.com/renanrmoraes/hpa.git --all
oc start-build hpa
sleep 10
oc get po -w
