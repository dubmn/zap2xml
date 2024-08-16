# zap2xml
Docker container for zap2xml

This is zap2xml with Environment Variables driving the configuration. By default it runs every 12 hours to update your EPG data from zap2it. This container will take a second account for zap2it and will merge the received xml files into one using tv_merge.

This is a fork from Scott Carlson [shuaiscott/zap2xml](https://github.com/shuaiscott/zap2xml) committing second login changes.

## Docker

| Tag | Description |
|---|---|
| latest | Stable zap2xml releases |
| vX.X.X | Specific zap2xml release |

### Run
`docker run -d --name zap2xml --restart always -v /path/to/xmltvdata:/data -e USERNAME=myemail@email.com -e PASSWORD=**password** -e OPT_ARGS="-I -D" -e USERNAME2=myemail2@email.com -e PASSWORD2=**secondpassword** -e OPT_ARGS2="-I -D" -e XMLTV_FILENAME=zap2xmltv.xml ghcr.io/dubmn/zap2xml:latest`

### Compose

```yaml
version: '3'
services:
  zap2xml:
    image: ghcr.io/dubmn/zap2xml:latest
    container_name: zap2xml
    volumes:
        - /path/to/xmltvdata:/data #Map from local path
    environment:
        - USERNAME=myemail@email.com
        - PASSWORD=**password**
        - OPT_ARGS=-I -D
        - USERNAME2=myemail2@email.com #Optional
        - PASSWORD2=**secondpassword** #Optional
        - OPT_ARGS2=-I -D #Optional
        - XMLTV_FILENAME=zip2xmltv.xml #Optional
    restart: always
```

## Environment Settings
You can configure the following environment variables below:

### Required
- USERNAME - zap2it.com username (email address)
- PASSWORD - zap2it.com password

### Optional
- OPT_ARGS - additional command line arguments for zap2xml (See [zap2xml.pl](https://web.archive.org/web/20200426004001/zap2xml.awardspace.info/))
- USERNAME2 - Second zap2it.com username (email address)
- PASSWORD2 - Second zap2it.com password
- OPT_ARGS2 = Additional command line arguments for zap2xml for the second username (See [zap2xml.pl](https://web.archive.org/web/20200426004001/zap2xml.awardspace.info/))
- XMLTV_FILENAME - Filename for your xmltv file (default: xmltv.xml)
- SLEEPTIME - Time in seconds to wait before next run (default: 43200)
