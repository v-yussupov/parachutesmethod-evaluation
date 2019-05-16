# This script file starts the specified JMeter test plan (located in the same folder as the script) N times from the command line

rounds=$1
file=parachuteEval_Monolith_Router.jmx

if [ "$rounds" == "" ]
  then
    echo "You need to provide the number of rounds, e.g. $0 10"
  else 
    for ((i=1;i<=$rounds;i++)) ; do
        echo "Starting test plan: $file"
        JVM_ARGS="-Xms512m -Xmx512m" /home/ubuntu/apache-jmeter-5.1.1/bin/jmeter -p aws_env.properties -n -t /home/ubuntu/parachuteEvaluation/jmeter/$file -l /home/ubuntu/parachuteEvaluation/results/parachuteEval_Monolith_Router/${file%%.*}-$i.jtl
        echo "Finished test plan: $file"
    done
fi
