if kubectl get all|grep webtest
then
sudo kubectl delete all --all
sudo kubectl delete pvc --all
sudo kubectl create -k .
else
sudo kubectl create -k .
fi