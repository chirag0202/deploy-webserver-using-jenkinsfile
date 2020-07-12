sleep 15
sudo /usr/local/bin/kubectl cp /task6/* $(sudo /usr/local/bin/kubectl get pod --kubeconfig /root/.kube/config |grep webtest| awk '{print $1'):/var/www/html --kubeconfig /root/.kube/config 
sudo /usr/local/bin/kubectl get all --kubeconfig /root/.kube/config 
