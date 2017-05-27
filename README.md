# salt-master
Salt states for the Powerline salt master

# Usage

To provision the machine:

`salt-call --local --file-root=/srv/salt-master/salt --pillar-root=/srv/salt-master/pillar state.apply`

Use `mock` to test:

`salt-call --local --file-root=/srv/salt-master/salt --pillar-root=/srv/salt-master/pillar state.apply mock=True`

# Development

Development happens using vagrant.

`vagrant up`

Since this is the salt master server, you'll need to use `salt-call` to provision the master correctly

## Pillar Data for Testing

If you need pillar data for testing, please copy `pillar/master/vagrant.sls.example` to `pillar/master/vagrant.sls`. The state `vagrant.sls` will not be tracked so you are free to put testing AWS keys or whatever else in there.
