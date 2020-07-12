if sudo /usr/local/bin/kubectl get all --kubeconfig /root/.kube/config |grep webtest
then
sudo /usr/local/bin/kubectl delete all --all --kubeconfig /root/.kube/config 
sudo /usr/local/bin/kubectl delete pvc --all --kubeconfig /root/.kube/config 
sudo /usr/local/bin/kubectl create -k . --kubeconfig /root/.kube/config 
else
sudo /usr/local/bin/kubectl create -k . --kubeconfig /root/.kube/config 
fi
