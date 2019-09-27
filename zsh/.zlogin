#!/usr/bin/env zsh

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$PATH:/usr/local/opt/mysql@5.6/bin
export CODE_PATH="${HOME}/code"
export GOPATH="${HOME}/go"
export GITHUB_URL="github.com"
export GITHUB_ORG_NS="TBD"
export HOMEBREW_GITHUB_API_TOKEN="TBD"

alias gs='git status'

pad() {
	pad_dir="${HOME}/pad"
	if [[ ! -z "${1}" ]]; then
		open "${pad_dir}/${1}"
	else
		for file in $(basename ${pad_dir}/*); do
			echo "$file"
		done
	fi
}

gclone() {
	clone_dir="${CODE_PATH}/${1}"
	git clone "git@${GITHUB_URL}:${GITHUB_ORG_NS}/${1}" "${clone_dir}"
	if [ $? -ne 0 ]; then
		return
	fi
	cd "${clone_dir}"
}
