#!/bin/sh

for d in rbac configmaps tasks pipelines triggers secrets
do
  [[ -d $d ]] && cd $d && ./setup.sh && cd ..
done
