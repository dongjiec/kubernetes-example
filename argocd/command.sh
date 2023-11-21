$ kubectl apply -n argocd -f https://ghproxy.com/https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
customresourcedefinition.apiextensions.k8s.io/applications.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/applicationsets.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/appprojects.argoproj.io created
......


$ kubectl wait --for=condition=Ready pods --all -n argocd --timeout 300s
pod/argocd-application-controller-0 condition met
pod/argocd-applicationset-controller-57bfc6fdb8-x5jxc condition met
......

export http_proxy='http://172.30.198.243:51889'
export https_proxy='http://172.30.198.243:51889'


root 11:30:56 /mnt/d/gitops/kubernetes-example/argocd
$ hostname -I | awk '{print $1}'
172.30.198.243

curl https://ghproxy.com/https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
curl: (35) OpenSSL SSL_connect: Connection reset by peer in connection to ghproxy.com:443 