## Sample: DevOps Migration Pipeline   

### On Virtual Machine   
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

### Docker Container   
Build Container: (Run from top level source directory)   
```
# docker build -t vedanta/dmp-single:latest -f docker/dmp-single.dockerfile .
```   
Run Container: 
```   
# docker run --name dmp-sample_1 -p 80:80 -it vedanta/dmp-single:latest   
```   
Run Container in Backgroud:   
```
# docker run --name dmp-sample_2 -p 80:80 -itd vedanta/dmp-single:latest   
```   

