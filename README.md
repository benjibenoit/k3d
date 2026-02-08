traefik
```shell
helm repo add traefik https://traefik.github.io/charts
helm repo update

helm upgrade --install traefik traefik/traefik -n traefik --create-namespace -f traefik/traefik-values.yaml
kubectl -n traefik rollout status deploy/traefik
```


argocd
```shell
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

helm upgrade --install argocd argo/argo-cd -n argocd --create-namespace -f argocd/argocd-values.yaml
kubectl -n traefik rollout status deploy/argocd-server

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
