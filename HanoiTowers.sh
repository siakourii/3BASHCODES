dohanoi() {   # Recursive function.
    case $1 in
    0)
        ;;
    *)
        dohanoi "$(($1-1))" $2 $4 $3
        echo move $2 "-->" $3
	let "Moves += 1"  # Modification to original script.
        dohanoi "$(($1-1))" $4 $3 $2
        ;;
    esac
}

case $# in
1)
    case $(($1>0)) in     # Must have at least one disk.
    1)
        dohanoi $1 1 3 2
        echo "Total moves = $Moves"
        exit 0;
        ;;
    *)
        echo "$0: illegal value for number of disks";
        exit $E_BADPARAM;
        ;;
    esac
    ;;
*)
    echo "usage: $0 N"
    echo "       Where \"N\" is the number of disks."
    exit $E_NOPARAM;
    ;;
esac
