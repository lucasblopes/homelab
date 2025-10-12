## IMPORTANT:
# First, set up the NFS in the cluster:
# https://microk8s.io/docs/how-to-nfs
##

k3s kubectl create namespace nfs-csi
helm repo add csi-driver-nfs https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts
helm repo update
helm install csi-driver-nfs csi-driver-nfs/csi-driver-nfs \
    --namespace nfs-csi \
    --set kubeletDir=/var/lib/kubelet
kubectl wait pod --selector app.kubernetes.io/name=csi-driver-nfs --for condition=ready --namespace kube-system
kubectl get csidrivers
