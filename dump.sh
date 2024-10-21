echo 'host'
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-host cluster-info dump|grep '\-\-cluster-cidr\='
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-host cluster-info dump|grep '\-\-service-cluster-ip-range\='
echo 'apiserver'
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver cluster-info dump|grep '\-\-cluster-cidr\='
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver cluster-info dump|grep '\-\-service-cluster-ip-range\='
echo 'member1'
kubectl --kubeconfig ~/.kube/members.config --context member1 cluster-info dump|grep '\-\-cluster-cidr\='
kubectl --kubeconfig ~/.kube/members.config --context member1 cluster-info dump|grep '\-\-service-cluster-ip-range\='
echo 'member2'
kubectl --kubeconfig ~/.kube/members.config --context member2 cluster-info dump|grep '\-\-cluster-cidr\='
kubectl --kubeconfig ~/.kube/members.config --context member2 cluster-info dump|grep '\-\-service-cluster-ip-range\='
echo 'member3'
kubectl --kubeconfig ~/.kube/members.config --context member3 cluster-info dump|grep '\-\-cluster-cidr\='
kubectl --kubeconfig ~/.kube/members.config --context member3 cluster-info dump|grep '\-\-service-cluster-ip-range\='



