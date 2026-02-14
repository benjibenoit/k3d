CLUSTER_CFG := cluster.yaml
.PHONY: init purge

init:
	k3d cluster create --config $(CLUSTER_CFG)

purge:
	k3d cluster delete --config $(CLUSTER_CFG)

reset:
	make purge
	make init

argocd:
	helm upgrade --install argo-cd argo/argo-cd -n argocd --create-namespace -f argocd/values.yml
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
