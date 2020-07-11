status=$(sudo curl -s -o /dev/null -w "%{http_code}" http://192.168.99.106:30003/index.html)
if status==200
then
exit 0
else 
exit 1
fi