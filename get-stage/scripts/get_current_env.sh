#!/usr/bin/env bash
set +x
REF=$1

if [ -z ${REF} ]; then
  echo 'pass an argument to this script'
  exit
fi

final_block=`echo $REF | rev | cut -d '-' -f1 | rev`

if [ "$final_block" == 'prod' ]; then
  echo -n 'prod'
  exit 0
fi

if [ "$final_block" == 'beta' ]; then
  echo -n 'beta'
  exit 0
fi

branch_name=`echo $REF | rev | cut -d '/' -f1 | rev`
echo $branch_name
if [ "$branch_name" == 'main' ] || [ "$branch_name" == 'master' ] || [ "$branch_name" == 'github-action' ]; then
  echo -n 'dev'
  exit 0
fi

exit 1