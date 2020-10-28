# kubeadm-cluster-playbook
# 
#           本文架构 
#
#
# 1、使用nginx负载均衡作为 API的外接入地址
# 2、首先安装nginx  docker
# 3、再安装kubeadm kubectl kubelet 
# 4、role  master-first  生成集群  并存储 token—command
# 5、role  master-second 使用 token-command--control-plane 加入master
# 6、role  node          使用 token-command
