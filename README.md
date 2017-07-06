# fuse-prometheus-agent
Fuse Prometheus agent work

## Install Prometheus server

1. `oc new project prometheus-example`
2. `oc new-app prom/prometheus`
3. `oc expose prometheus`

## Install Prometheus example

1. `git clone git@github.com:cunningt/fuse-prometheus-agent.git`
2. `cd prometheus-test`
3. `mvn fabric8:deploy`
4. `oc expose service test --port 4545`

## Add Prometheus config

1. `cd fuse-prometheus-agent`
2. `oc create configmap prom-config-example --from-file=prometheus.yml`
3. `oc edit dc/prometheus` 
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
