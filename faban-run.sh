#!/bin/bash

[ -z "$FABAN_HOME" ] && echo "FABAN_HOME is not set!" && exit 1
[ -z "$JAVA_HOME" ] && echo "JAVA_HOME is not set!" && exit 1

pushd `dirname $0` > /dev/null
SCRIPT_DIR=`pwd`
popd > /dev/null

fhblib=${FABAN_HOME}/lib

result_path=$(jruby ${SCRIPT_DIR}/path.rb $*)
mkdir -p $result_path

concurrency=(10 25 50)

for i in "${concurrency[@]}"; do
    echo "jruby -J-cp ${fhblib}/fabandriver.jar:${fhblib}/fabancommon.jar:${JAVA_HOME}/lib/tools.jar:${fhblib}/commons-httpclient-3.1.jar:${fhblib}/commons-logging.jar:${fhblib}/commons-codec-1.2.jar ${SCRIPT_DIR}/faban.rb -D $result_path -c $i $*"
    jruby -J-cp ${fhblib}/fabandriver.jar:${fhblib}/fabancommon.jar:${JAVA_HOME}/lib/tools.jar:${fhblib}/commons-httpclient-3.1.jar:${fhblib}/commons-logging.jar:${fhblib}/commons-codec-1.2.jar ${SCRIPT_DIR}/faban.rb -D $result_path -c $i $* && \
        dir=$(ls -t $result_path | head -1) && \
        mv $result_path/$dir $result_path/c$i
done
