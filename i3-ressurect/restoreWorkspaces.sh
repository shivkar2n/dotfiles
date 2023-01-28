#!/bin/bash
function RestoreWorkspaces() {
	for((i=0; i < 10; i++)); do
		i3-resurrect restore -w $i --programs-only
		i3-resurrect restore -w $i --layout-only
	done
}
RestoreWorkspaces;

