while [[ $myvar -lt 6 ]]; do
    if [[ -f /tmp/file$myvar ]]; then
        echo "File Exists"
    else
        touch /tmp/file$myvar
    fi
    ((myvar++))
done
