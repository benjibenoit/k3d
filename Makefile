CLUSTER_CFG := cluster.yaml
.PHONY: init purge

init:
	k3d cluster create --config $(CLUSTER_CFG)

purge:
	k3d cluster delete --config $(CLUSTER_CFG)

reset:
	make purge
	make init

setup-nginx:
	kubectl create deployment nginx --image=nginx
	kubectl create service clusterip nginx --tcp=80:80
	kubectl apply -f test.yml
