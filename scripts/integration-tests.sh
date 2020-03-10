#!/bin/bash

source /scripts/common.sh
source /scripts/bootstrap-helm.sh


run_tests() {
    echo Running tests...

    wait_pod_ready matrix-server
    wait_pod_ready riot-web
}

teardown() {
    helm delete matrix-server
    helm delete riot-web
}

main(){
    if [ -z "$KEEP_W3F_MATRIX" ]; then
        trap teardown EXIT
    fi

    source /scripts/build-helmfile.sh

    run_tests
}

main
