#!/usr/bin/env bash

function gitops-core {
	local -r GITOPS_DIR=.weave-gitops

	if [ $1 == "clean" ]; then
	   if [ -d $GITOPS_DIR ]; then
		echo "Cleaning..."
		rm -rf $GITOPS_DIR
		git add -A && \
			git commit -m "Cleanup" && \
			git push
	   else
	       echo "Nothing found.."
	   fi
	fi
}


function argocd-autopilot {
	export GIT_TOKEN=$GITHUB_TOKEN
	export GIT_REPO=https://github.com/gitbluf/gitops-config/argocd
	
	if [[ "$1" == "clean" ]]; then
	    argocd-autopilot repo uninstall	
	else
	    argocd-autopilot repo bootstrap
	fi
}



# ENTRYPOINT
case $1 in
  "argo")
    argocd-autopilot $2
    ;;
  "gitops")
	gitops-core $2
    ;;
  *)
    argocd-autopilot "clean" && gitops-core "clean"
    ;;
esac
