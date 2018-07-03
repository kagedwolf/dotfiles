_dropbox() {
    COMPREPLY=()
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    curr="${COMP_WORDS[COMP_CWORD]}"

    commands="status help puburl stop running start filestatus ls autostart exclude lansync"

    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $(compgen -W "${commands}" -- "${curr}" ) )
    elif [ $COMP_CWORD -eq 2 ]; then
        case $prev in
            puburl | filestatus | ls | exclude )
                COMPREPLY=( $(compgen -W "$(ls)" -- "${curr}") )
                ;;
            help )
                COMPREPLY=( $(compgen -W "${commands}" -- "${curr}" ) )
                ;;
            * )
                ;;
        esac
    fi
}

complete -F _dropbox dropbox
