# This script file starts the specified JMeter test plan (located in the same folder as the script) from the command line

round=$1
file=parachuteEval_Failover.jmx

if [ "$round" == "" ]
  then
    echo "You need to provide the current index of the round manually executed so that result file names are correct, e.g. $0 1"
  else 
    echo "Starting test plan: $file"
    JVM_ARGS="-Xms512m -Xmx512m" /home/ubuntu/apache-jmeter-5.1.1/bin/jmeter -p aws_env.properties -n -t /home/ubuntu/parachuteEvaluation/jmeter/$file -l /home/ubuntu/parachuteEvaluation/results/parachuteEval_Failover/${file%%.*}-$round.jtl
    echo "Finished test plan: $file"
fi
