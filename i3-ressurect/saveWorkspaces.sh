#!/bin/bash
function SaveWorkspaces() {
	for((i=0; i < 10; i++)); do
		i3-resurrect save -w  $i --swallow=class,instance,title
	done
}
SaveWorkspaces;

