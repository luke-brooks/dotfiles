declare -a arr=("Bark-js"
"api-client"
"bootstrap"
"buildkite-scripts"
"check-sim"
"crosscheck-ui"
"crosscheck-v2-ui"
"data-service"
"datascience-labs"
"datascience-service"
"devops"
"dispensecheck-service"
"dispensecheck-ui"
"dockerfiles"
"edi-service"
"fx9500"
"hardware"
"importance"
"kc-sargas"
"kitcheck-cookbooks"
"kitcheck-toolbox"
"kitcheck-ui-cli  "
"kitcheck-ux"
"login-service"
"monitoring"
"natural-orderby"
"phi-service"
"prod-support"
"ref"
"registry-service"
"registry-ui"
"reporting-api"
"scheduled-reports"
"tunnelreader"
"ui-kcapi"
"ui-login-v2")

for i in "${arr[@]}"
do
   git clone git@github.com:kitcheck/$i.git
done
