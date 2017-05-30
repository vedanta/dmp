Create VM:   
```
# vagrant up dmp
```    
Install salt:   
```
# sudo /srv/salt/install_minion.sh
```
Run state:   
```
# sudo salt-call -l quiet --file-root=/srv/salt --pillar-root=/srv/salt/pillar --config-dir=/srv/salt/conf --local state.apply   
```   
