sleep 15
sudo kubectl cp /task6/* $(sudo kubectl get pod|grep webtest| awk '{print $1'):/var/www/html --kubeconfig /root/.kube/config 
sudo kubectl get all --kubeconfig /root/.kube/config 
