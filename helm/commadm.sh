$ helm install my-kubernetes-example ./helm --namespace helm-staging --create-namespace --set frontend.autoscaling.averageUtilization=60 --set backend.autoscaling.averageUtilization=60
NAME: my-kubernetes-example
LAST DEPLOYED: Thu Oct 20 18:13:34 2022
NAMESPACE: helm-staging
STATUS: deployed
REVISION: 1
TEST SUITE: None

$ kubectl get hpa backend -n helm-staging --output jsonpath='{.spec.metrics[0].resource.target.averageUtilization}'
60

$ kubectl get deployment backend -n helm-staging --output jsonpath='{.spec.template.spec.containers[0].env[*]}'

{"name":"DATABASE_URI","value":"pg-service"} {"name":"DATABASE_USERNAME","value":"postgres"} {"name":"DATABASE_PASSWORD","value":"postgres"}


$ helm install my-kubernetes-example ./helm -f ./helm/values-prod.yaml --namespace helm-prod --create-namespace
NAME: my-kubernetes-example
LAST DEPLOYED: Thu Oct 20 20:21:07 2022
NAMESPACE: helm-prod
STATUS: deployed
REVISION: 1
TEST SUITE: None

$ kubectl get deployment postgres -n helm-prod   
Error from server (NotFound): deployments.apps "postgres" not found

$ helm registry login -u dongjiec https://ghcr.io
Password: token here
Login Succeeded
#tocken
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


$ helm package ./helm
Successfully packaged chart and saved it to: /Users/weiwang/Downloads/kubernetes-example/kubernetes-example-0.1.0.tgz


$ helm registry login -u dongjiec https://ghcr.io
Password: 
Login Succeeded
root 10:41:48 /mnt/d/gitops/kubernetes-example
$ helm package ./helm
Successfully packaged chart and saved it to: /mnt/d/gitops/kubernetes-example/kubernetes-example-0.1.0.tgz

$ helm push kubernetes-example-0.1.0.tgz oci://ghcr.io/dongjiec/helm

Pushed: ghcr.io/lyzhang1999/helm/kubernetes-example:0.1.0
Digest: sha256:8a0cc4a2ac00f5b1f7a50d6746d54a2ecc96df6fd419a70614fe2b9b975c4f42

root 10:41:48 /mnt/d/gitops/kubernetes-example
$ helm package ./helm
Successfully packaged chart and saved it to: /mnt/d/gitops/kubernetes-example/kubernetes-example-0.1.0.tgz
root 10:43:34 /mnt/d/gitops/kubernetes-example
$ helm push kubernetes-example-0.1.0.tgz oci://ghcr.io/dongjiec/helm
Pushed: ghcr.io/dongjiec/helm/kubernetes-example:0.1.0
Digest: sha256:6dfe97efed1330b6d1f04f6362422fa91e2f3fa4ab57cbc3e0aef65afd2caca2
root 10:45:58 /mnt/d/gitops/kubernetes-example
$ 


root 10:49:18 /mnt/d/gitops/kubernetes-example
$ helm list -A
NAME                    NAMESPACE       REVISION        UPDATED                                 STATUS             CHART                    APP VERSION
my-kubernetes-example   helm-prod       1               2023-11-21 10:37:01.3511443 +0800 CST   deployed           kubernetes-example-0.1.0 0.1.0
root 10:49:22 /mnt/d/gitops/kubernetes-example
$ 


root 10:53:30 /mnt/d/gitops/kubernetes-example
$ helm upgrade my-kubernetes-example ./helm -n helm-prod
Release "my-kubernetes-example" has been upgraded. Happy Helming!
NAME: my-kubernetes-example
LAST DEPLOYED: Tue Nov 21 10:53:48 2023
NAMESPACE: helm-prod
STATUS: deployed
REVISION: 2
TEST SUITE: None
root 10:53:49 /mnt/d/gitops/kubernetes-example
$ 



$ helm registry login -u dongjie66 https://ghcr.io
Password: token here
Login Succeeded


 $ helm push kubernetes-example-0.1.0.tgz oci://ghcr.io/dongjie66/helm

Pushed: ghcr.io/lyzhang1999/helm/kubernetes-example:0.1.0
Digest: sha256:8a0cc4a2ac00f5b1f7a50d6746d54a2ecc96df6fd419a70614fe2b9b975c4f42

$ helm push kubernetes-example-0.1.0.tgz oci://ghcr.io/dongjie66/helm

Pushed: ghcr.io/lyzhang1999/helm/kubernetes-example:0.1.0
Digest: sha256:8a0cc4a2ac00f5b1f7a50d6746d54a2ecc96df6fd419a70614fe2b9b975c4f42