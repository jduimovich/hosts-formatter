
oc get routes --all-namespaces -o json > routes.json 
node getroutes.js > update-routes.cmd
rem call update-routes.cmd 
