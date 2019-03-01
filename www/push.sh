git add .
sleep 5
git commit -m $1
sleep 5
git push
oc start-build hpa
sleep 10
oc get po -w
