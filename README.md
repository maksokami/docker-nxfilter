
This image is based on debian and supports ARM as well.
Takes a minute to start for the first time to create the DB.

# Ports
- 53 - DNS
- 80 and 443 - Web interface
- 19002-19004 - Clustering 

# Usage  

**Simple run and remove on stop:**  
```
docker run --rm \
  --name nxfilter \
  -p 80:80 -p 443:443\
  -p 53:53/udp \
  maksokami/nxfilter-base
```  

**Persistent data volumes**  
```
docker run -dt \
  --name nxfilter \
  -v nxfilter-conf:/nxfilter/conf \
  -v nxfilter-log:/nxfilter/log \
  -v nxfilter-db:/nxfilter/db \
  -p 80:80 -p 443:443 -p 53:53/udp \
  -p 19002-19004:19002-19004 \
   --restart=unless-stopped \
  maksokami/nxfilter:latest
```

**Get into the container CLI**
```
docker exec -it nxfilter bash
```
