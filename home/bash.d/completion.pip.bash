_pip() {
    local curr="${COMP_WORDS[COMP_CWORD]}"
    local commands="install uninstall freeze list show search zip unzip bundle help"

    COMPREPLY=()
    [[ $COMP_CWORD -eq 1 ]] && {
        COMPREPLY=( $(compgen -W "${commands}" -- "${curr}") )
    } || {
        COMPREPLY=( $(compgen -f -- "${curr}") )
    }
}

complete -F _pip pip
