CUSTOM=/home/stack/ovs-sriov

openstack overcloud deploy --override-ansible-cfg /home/stack/ansible.cfg \
 --templates \
 -r /home/stack/ovs-sriov/templates/roles_data.yaml \
 -n /home/stack/ovs-sriov/templates/network_data.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible-external.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovs.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-sriov.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/metrics/ceilometer-write-qdr.yaml  \
 -e /usr/share/openstack-tripleo-heat-templates/environments/metrics/collectd-write-qdr.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/metrics/qdr-edge-only.yaml \
 -e $CUSTOM/containers-prepare-parameter.yaml \
 -e $CUSTOM/templates/external_ceph.yaml \
 -e $CUSTOM/templates/node_info.yaml \
 -e $CUSTOM/templates/network-environment.yaml \
 -e $CUSTOM/templates/overcloud-image.yaml \
 -e $CUSTOM/templates/root_password.yaml \
 -e $CUSTOM/templates/externalvip.yaml \
 -e $CUSTOM/templates/fencing.yaml \
 -e $CUSTOM/templates/cloudname.yaml \
 -e $CUSTOM/templates/enable-stf.yaml \
 -e $CUSTOM/templates/stf-connectors.yaml \
 --ntp-server 192.168.24.1 --libvirt-type kvm  --timeout 240 \
 --log-file overcloud-deployment.log
