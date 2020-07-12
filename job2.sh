if sudo kubectl get all --kubeconfig /root/.kube/config |grep webtest
then
sudo kubectl delete all --all --kubeconfig /root/.kube/config 
sudo kubectl delete pvc --all --kubeconfig /root/.kube/config 
sudo kubectl create -k . --kubeconfig /root/.kube/config 
else
sudo kubectl create -k . --kubeconfig /root/.kube/config 
fi
