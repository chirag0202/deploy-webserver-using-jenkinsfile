sleep 15
sudo kubectl cp /task6/* $(sudo kubectl get pod|grep webtest| awk '{print $1'):/var/www/html
sudo kubectl get all