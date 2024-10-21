kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver delete -f 1-control-plane.yaml
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver delete -f 2-member1.yaml
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver delete -f 3-member1.yaml
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver delete -f 4-member2.yaml
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver delete -f 5-test.yaml

kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver apply -f 1-control-plane.yaml
sleep 1
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver apply -f 2-member1.yaml
sleep 1
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver apply -f 3-member1.yaml
sleep 1
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver apply -f 4-member2.yaml
sleep 1
kubectl --kubeconfig ~/.kube/karmada.config --context karmada-apiserver apply -f 5-test.yaml

subctl --kubeconfig ~/.kube/karmada.config --context karmada-host deploy-broker

subctl  --kubeconfig ~/.kube/members.config --context member1 join broker-info.subm --natt=false --clusterid member1 --check-broker-certificate=false
subctl  --kubeconfig ~/.kube/members.config --context member2 join broker-info.subm --natt=false --clusterid member2 --check-broker-certificate=false
subctl  --kubeconfig ~/.kube/members.config --context member3 join broker-info.subm --natt=false --clusterid member3 --check-broker-certificate=false

#subctl --kubeconfig ~/.kube/karmada.config --context karmada-host uninstall
#subctl --kubeconfig ~/.kube/members.config --context member1 uninstall
#subctl --kubeconfig ~/.kube/members.config --context member2 uninstall

#iptables -D INPUT -s 172.18.0.4 -j DROP
#iptables -D FORWARD -s 172.18.0.4 -j DROP
#iptables -D OUTPUT -d 172.18.0.4 -j DROP
#iptables -D INPUT -s 172.18.0.4 -j ACCEPT
#iptables -D FORWARD -s 172.18.0.4 -j ACCEPT
#iptables -D OUTPUT -d 172.18.0.4 -j ACCEPT

#karmadactl init \
# --karmada-apiserver-replicas 1 \
# --etcd-replicas 1 \
# --etcd-image registry.cn-hangzhou.aliyuncs.com/acejilam/etcd:3.5.13-0 \
# --etcd-init-image registry.cn-hangzhou.aliyuncs.com/acejilam/centos:7 \
# --karmada-aggregated-apiserver-image registry.cn-hangzhou.aliyuncs.com/acejilam/karmada-aggregated-apiserver \
# --karmada-controller-manager-image registry.cn-hangzhou.aliyuncs.com/acejilam/karmada-controller-manager \
# --karmada-scheduler-image registry.cn-hangzhou.aliyuncs.com/acejilam/karmada-scheduler \
# --karmada-webhook-image registry.cn-hangzhou.aliyuncs.com/acejilam/karmada-webhook \
# --etcd-storage-mode hostPath \
# --kubeconfig ~/.kube/kind \
# -d ./tmp \
# --karmada-pki=./tmp/pki \
# -p 31443


#karmadactl init \
# --karmada-apiserver-replicas 1 \
# --etcd-replicas 1 \
# --etcd-image registry.cn-hangzhou.aliyuncs.com/acejilam/etcd:3.5.13-0 \
# --etcd-init-image registry.cn-hangzhou.aliyuncs.com/acejilam/centos:7 \
# --karmada-aggregated-apiserver-image registry.cn-hangzhou.aliyuncs.com/acejilam/karmada-aggregated-apiserver \
# --karmada-controller-manager-image registry.cn-hangzhou.aliyuncs.com/acejilam/karmada-controller-manager \
# --karmada-scheduler-image registry.cn-hangzhou.aliyuncs.com/acejilam/karmada-scheduler \
# --karmada-webhook-image registry.cn-hangzhou.aliyuncs.com/acejilam/karmada-webhook \
# --etcd-storage-mode hostPath \
# --kubeconfig ~/.kube/51.4.config \
# -d ./tmp \
# --karmada-pki=./tmp/pki \
# -p 31443
#
