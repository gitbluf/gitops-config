#!/usr/bin/env bash

CLUSTER=$1

flux bootstrap github \
  --owner=gitbluf \
  --branch=master \
  --repository=gitops-config \
  --components-extra=image-reflector-controller,image-automation-controller \
  --path=./flux/clusters/$CLUSTER \
  --read-write-key \
  --personal
