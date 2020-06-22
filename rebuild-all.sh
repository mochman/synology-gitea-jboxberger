#!/bin/bash
IS_DEBUG=""

########################################################################################################################
# PARAMETER HANDLING
########################################################################################################################
for i in "$@"
do
    case $i in
        --debug)
            IS_DEBUG="--debug"
        ;;
        *)
            # unknown option
        ;;
    esac
    shift
done

spk_version=0101

gitea_package_name="gitea/gitea"
declare -A versions;      declare -a orders;
#versions["1.3"]="34"; orders+=( "1.3" )
#versions["1.4"]="34"; orders+=( "1.4" )
#versions["1.4.1"]="34"; orders+=( "1.4.1" )
#versions["1.4.2"]="34"; orders+=( "1.4.2" )
#versions["1.5.0"]="37"; orders+=( "1.5.0" )
#versions["1.5.1"]="37"; orders+=( "1.5.1" )
#versions["1.6"]="39"; orders+=( "1.6" )
#versions["1.7"]="42"; orders+=( "1.7" )
#versions["1.7.1"]="42"; orders+=( "1.7.1" )
#versions["1.7.3"]="42"; orders+=( "1.7.3" )
#versions["1.8"]="47"; orders+=( "1.8" )
#versions["1.8.2"]="47"; orders+=( "1.8.2" )
#versions["1.9"]="47"; orders+=( "1.9" )
#versions["1.9.3"]="45"; orders+=( "1.9.3" )
#versions["1.10.3"]="49"; orders+=( "1.10.3" )
#versions["1.11.1"]="38"; orders+=( "1.11.1" )
versions["1.12.1"="52"; orders+=( "1.12.1" )

for i in "${!orders[@]}"
do
    gitea_version=${orders[$i]}
    gitea_size=${versions[${orders[$i]}]}
    gitea_package_fqn=$gitea_package_name:$gitea_version


    echo "building $gitea_package_fqn ("$gitea_size"MB)"
    ./build.sh --gitea-fqn=$gitea_package_fqn --gitea-download-size=$gitea_size \
       --spk-version=$spk_version \
       "$IS_DEBUG"
done
