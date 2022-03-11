#!/usr/bin/env bash

if [ -d .wego-system ]; then
	echo "Cleaning..."
	rm -rf .wego-system

	git add -A && \
		git commit -m "Cleanup" && \
		git push
else
	echo "Nothing found.."
fi

