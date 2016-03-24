#!/bin/ksh

#comment test

SRV_LIST1="AAA1 AAA2 AAA3"
SRV_LIST2="AAA1"               
SRV_LIST3="AAA2"               
SRV_LIST4="AAA2"               
SRV_LIST5="AAA3"               


T_SRV=$1
OPT=$2
case $T_SRV in
    ALL )
        SRV_LIST=$SRV_LIST1
    ;;
    HON )
        SRV_LIST=$SRV_LIST2
    ;;
    KAI )
        SRV_LIST=$SRV_LIST3
    ;;
    LAB )
        SRV_LIST=$SRV_LIST4
    ;;
    KBK )
        SRV_LIST=$SRV_LIST5
    ;;
    * )
        print "Usage : all_cmd.ksh [ ALL | HON | KAI | LAB | KBK] [ -v ] Command"
        exit 1
   ;;
esac


function READ_KEY
{
    case $OPT in
        -v )
            print "OK : Press Enter Key or NG : Ctrl + c"
            read
        ;;
        * )
        ;;
    esac
}


case $OPT in
    -v )
        SHIFT_NUM=2
    ;;
    * )
        SHIFT_NUM=1
    ;;
esac


shift $SHIFT_NUM
COM=$*


print ======================================================================
print $COM
print ======================================================================


for SRV in $SRV_LIST
do
    print "=========================================== $SRV ==========================================="
    ssh -i $HOME/.ssh/nopass-dsa $SRV "$COM"
    print ""
    READ_KEY
done

