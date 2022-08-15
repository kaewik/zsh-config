has_command () {
    if ! command -v $1 &> /dev/null
    then
        return -1
    fi
    return 0

}
