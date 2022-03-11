#!/usr/bin/env bash

GITOPS_DIR=.weave-gitops

if [ -d $GITOPS_DIR ]; then
	echo "Cleaning..."
	rm -rf $GITOPS_DIR

	git add -A && \
		git commit -m "Cleanup" && \
		git push
else
	echo "Nothing found.."
fi

