if [ -d ~/ndn ]; then
    function _dispatcher() {
        MYCMD=$1
        shift

        # no need in doing anything if we were not asked to
        if [[ -n $1 ]]; then
            # check and see if we know how to preform this action
            MYPATH=`which $MYCMD-$1`
            if [[ -n $MYPATH ]]; then
                # looks like there's a script to handle this action... pass it off
                shift; # because $1 is now in the path we don't need to pass it along
                eval "$MYPATH $*"
            else
                # trap errors
                echo "I do not know how to '$1', typo or possibly ask 'help' for ideas?"
            fi
        fi
    }

    function sup(){
        source ~/signup/bin/activate
        cd ~/signup
        # Ben's old line:  _dispatcher 'sup' $@
        [ -n $* ] && _dispatcher 'sup' $@
    }

    function ndn(){
        cd ~/ndn
        [ -n $* ] && _dispatcher 'ndn' $@
    }

    function sp(){
        cd ~/sitepanel
        [ -n $* ] && _dispatcher 'sp' $@
    }
fi
