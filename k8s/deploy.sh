kubectl config set-cluster "$CI_PROJECT_NAME" --server="$KUBE_URL" --certificate-authority="$KUBE_CA_PEM_FILE"
kubectl config set-credentials "$CI_PROJECT_NAME" --token="$KUBE_TOKEN"
kubectl config set-context "$CI_PROJECT_NAME" --namespace="$KUBE_NAMESPACE" --cluster="$CI_PROJECT_NAME" --user="$CI_PROJECT_NAME"
kubectl config use-context "$CI_PROJECT_NAME"
kubectl create namespace "$KUBE_NAMESPACE" --save-config --dry-run -o yaml | kubectl apply -f -
kubectl create secret docker-registry gitlab-registry --docker-server=$CI_REGISTRY --docker-username=$DEPLOY_USER --docker-password=$DEPLOY_PASSWORD --docker-email=$DEPLOY_EMAIL --save-config --dry-run -o yaml | kubectl apply -f -
helm chart pull $DEPLOY_CHART_URL
helm chart export $DEPLOY_CHART_URL
helm upgrade --install $DEPLOY_NAME -n $KUBE_NAMESPACE \
    --kube-context $CI_PROJECT_NAME \
    --set image.repository=${DOCKER_IMAGE_REPOSITORY} \
    --set image.tag=${DOCKER_IMAGE_TAG} \
    --set ingress[0].host="${DEPLOY_DOMAIN}.vmatrix.org.cn" \
    --set annotations."app\.gitlab\.com/app"=${CI_PROJECT_PATH_SLUG} \
    --set annotations."app\.gitlab\.com/env"=${CI_ENVIRONMENT_SLUG} \
    $DEPLOY_CHART_NAME