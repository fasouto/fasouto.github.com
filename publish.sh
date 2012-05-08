#! /bin/bash

hyde gen -r -c

echo "Commit message:"
read commit_message

hyde publish -p github -c site.yaml -m "$commit_message"