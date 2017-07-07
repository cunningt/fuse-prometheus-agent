# fuse-prometheus-agent
Fuse Prometheus agent work

## Install FIS image streams (required by fabric8 maven plugin)

1. `clone git@github.com:jboss-openshift/application-templates.git`
1. `cd application-templates`
1. `oc login -u system:admin`
1. `oc create -n openshift -f ./fis-image-streams.json`

## Install Prometheus server

1. `oc login -u developer -p developer`
1. `oc new-project prometheus-example`
2. `oc new-app prom/prometheus`
3. `oc expose service prometheus`

## Install Prometheus example

1. `git clone git@github.com:cunningt/fuse-prometheus-agent.git`
2. `cd fuse-prometheus-agent/prometheus-test/`
3. `mvn fabric8:deploy`
4. `oc expose service test --port 4545`

## Add Prometheus config

1. `cd ..`
1. update 'target' in 'prometheus.yml'
1. `oc create configmap prom-config-example --from-file=prometheus.yml`
1. `oc edit dc/prometheus` 
Add the new volume information (https://www.robustperception.io/openshift-and-prometheus/), add the volume and volumeMount

# Install Grafana

1. `oc new-app grafana/grafana`
2. `oc volume dc/grafana --remove --name=grafana-volume-1`
3. `oc volume dc/grafana --remove --name=grafana-volume-2`
4. `oc expose svc grafana`

# Create Datasource in Grafana

1. Login as admin/admin
2. Create a prometheus datasource :
* name=openshift
* type=prometheus
* url= your prometheus service url (http://prometheus-prometheus-example.192.168.64.2.nip.io)
* access=direct

# Create a Dashboard

1. Use openshift datasource
2. Use Metric Lookup to choose an "org_apache_camel_camel" metric 
