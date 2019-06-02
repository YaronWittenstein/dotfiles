NEXT_COMMIT=( $(git log --reverse --ancestry-path HEAD..master | head -n 1 | cut -d \  -f 2) )
echo $NEXT_COMMIT | pbcopy
$(git reset $NEXT_COMMIT --hard) &> /dev/null
