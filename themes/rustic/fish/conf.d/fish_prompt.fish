set __fish_git_prompt_show_informative_status

function fish_prompt
    set last_status $status

    set_color yellow
    printf "@jtstr "

    set_color normal
    printf "["

    set_color $fish_color_cwd
    printf "%s" (prompt_pwd)

    set_color normal
    printf "] > "
end

function fish_right_prompt
    set curr_branch (git branch --show-current 2>/dev/null)
    set branch_get_status $status

    set_color normal
    printf "["

    if test $branch_get_status -eq 0
        set_color magenta
        printf " %s" $curr_branch
    else
        set_color red
        printf ""
    end
    set_color normal
    printf "]"
end
