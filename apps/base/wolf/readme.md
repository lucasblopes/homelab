# Readme

For this to work, it's necessary to add the ```--nvidia-set-as-default``` and  ```--kube-apiserver-arg=service-node-port-range=47000-49828``` flag in systemctl:

```
sudo systemctl edit k3s.service
```

```
ExecStart=/usr/local/bin/k3s server \
  --kube-apiserver-arg=service-node-port-range=47000-49828 \
  --default-runtime=nvidia
```
