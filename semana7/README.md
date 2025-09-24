# Instalación e iniciación

```console
docker-compose up -d
```

*OBS:* Debe estar en el directorio lab donde exista docker-compose.yml y nginx.conf

# Comprobación

Ingresar a la url: http://localhost:8888

El jenkins va a solicitar una contraseña inicial de administrador, la cual se encuentra en:
 ```console
 /var/jenkins_home/secrets/initialAdminPassword
 ```
O en el log.

Para conseguir la contraseña del log debemos de:
* Ejecutar el comando que lista todos los contenedores

 ```console
 docker ps
 ```

 El resultado será algo como:

> CONTAINER ID  IMAGE                           COMMAND               CREATED         STATUS         PORTS                                             NAMES \
>696684340ef0  docker.io/jenkins/jenkins:lts                         43 minutes ago  Up 21 minutes  0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp  jenkins \
>2be707164749  docker.io/library/nginx:alpine  nginx -g daemon o...  43 minutes ago  Up 21 minutes  0.0.0.0:8888->80/tcp                              nginx

Identificamos el CONTAINER_ID del jenkins (en el ejemplo es el 696684340ef0)

Y ejecutamos el siguiente comando:
> docker inspect [CONTAINER_ID]

Para el ejemplo serìa: docker inspect 696684340ef0
Lo cual nos da un resultado como este:
 ```json
 [
     {
          "Id": "696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726",
          "Created": "2025-09-24T07:56:30.837565304-03:00",
          "Path": "/usr/bin/tini",
          "Args": [
               "--",
               "/usr/local/bin/jenkins.sh"
          ],
          "State": {
               "OciVersion": "1.2.1",
               "Status": "running",
               "Running": true,
               "Paused": false,
               "Restarting": false,
               "OOMKilled": false,
               "Dead": false,
               "Pid": 104337,
               "ConmonPid": 104335,
               "ExitCode": 0,
               "Error": "container 696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726: container is running",
               "StartedAt": "2025-09-24T08:18:42.256447535-03:00",
               "FinishedAt": "2025-09-24T08:16:06.923786555-03:00",
               "CgroupPath": "/user.slice/user-1000.slice/user@1000.service/user.slice/user-libpod_pod_c9e69ccc929c8fc86be192caae9e8bce1459ff7b2b04d0f0cc4a992b7a7015c1.slice/libpod-696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726.scope",
               "CheckpointedAt": "0001-01-01T00:00:00Z",
               "RestoredAt": "0001-01-01T00:00:00Z"
          },
          "Image": "79d081a365a1652df714eb51ae497e9f3974d172f7644288cee3dd781e28cd15",
          "ImageDigest": "sha256:ace160331258aeff24581038e63ec5b5e8e969cebc9582a5ac7f0ed9fd20043b",
          "ImageName": "docker.io/jenkins/jenkins:lts",
          "Rootfs": "",
          "Pod": "c9e69ccc929c8fc86be192caae9e8bce1459ff7b2b04d0f0cc4a992b7a7015c1",
          "ResolvConfPath": "/run/user/1000/containers/overlay-containers/696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726/userdata/resolv.conf",
          "HostnamePath": "/run/user/1000/containers/overlay-containers/696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726/userdata/hostname",
          "HostsPath": "/run/user/1000/containers/overlay-containers/696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726/userdata/hosts",
          "StaticDir": "/home/franco/.local/share/containers/storage/overlay-containers/696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726/userdata",
          "OCIConfigPath": "/home/franco/.local/share/containers/storage/overlay-containers/696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726/userdata/config.json",
          "OCIRuntime": "crun",
          "ConmonPidFile": "/run/user/1000/containers/overlay-containers/696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726/userdata/conmon.pid",
          "PidFile": "/run/user/1000/containers/overlay-containers/696684340ef09f0c725c693f2e493b0f25c2dbdb8811149acdd008b9a207b726/userdata/pidfile",
          "Name": "jenkins",
          "RestartCount": 0,
          "Driver": "overlay",
          "MountLabel": "",
          "ProcessLabel": "",
          "AppArmorProfile": "",
          "EffectiveCaps": [
               "CAP_CHOWN",
               "CAP_DAC_OVERRIDE",
               "CAP_FOWNER",
               "CAP_FSETID",
               "CAP_KILL",
               "CAP_NET_BIND_SERVICE",
               "CAP_SETFCAP",
               "CAP_SETGID",
               "CAP_SETPCAP",
               "CAP_SETUID",
               "CAP_SYS_CHROOT"
          ],
          "BoundingCaps": [
               "CAP_CHOWN",
               "CAP_DAC_OVERRIDE",
               "CAP_FOWNER",
               "CAP_FSETID",
               "CAP_KILL",
               "CAP_NET_BIND_SERVICE",
               "CAP_SETFCAP",
               "CAP_SETGID",
               "CAP_SETPCAP",
               "CAP_SETUID",
               "CAP_SYS_CHROOT"
          ],
          "ExecIDs": [],
          "GraphDriver": {
               "Name": "overlay",
               "Data": {
                    "LowerDir": "/home/franco/.local/share/containers/storage/overlay/33d34e2c44f891f3b5b3ad1d8c59e24d6ae42b1fad387abca35c6ff6bc645edb/diff:/home/franco/.local/share/containers/storage/overlay/e1e1da44779c6408061a4f616bb667160ce67a2dac40d7d2b77827c9cf91a6f8/diff:/home/franco/.local/share/containers/storage/overlay/cb873819cd321c6b26192f5df4fac6d4c7a6d5de4c264e8f6b270b4d7e81f2eb/diff:/home/franco/.local/share/containers/storage/overlay/493eb441a9bcca626eeefcbaebe5d55835ed688d3ff80cdd284d8efc57ab91f7/diff:/home/franco/.local/share/containers/storage/overlay/1e12d236cf7fe0204a1a1b0b7882da5d56ecaf0d10a2285bf86f569e289345b0/diff:/home/franco/.local/share/containers/storage/overlay/877913d6c847383f6464c3b71f22f3ec8af33f8bdbd0c0fa80fded9b7b6dc2d0/diff:/home/franco/.local/share/containers/storage/overlay/34d16dd7c0dfe062a8be877646826b3aa6fd6a0b99572cc42f75df184418dd48/diff:/home/franco/.local/share/containers/storage/overlay/468f6da9595d6ae24ea0e28ac283a39bc0252a204d83db06de63eaf28abfd282/diff:/home/franco/.local/share/containers/storage/overlay/4d5aa581fadd8610a409e65d1f0ca1af58af0c5908ccf748f3859d86a029d62a/diff:/home/franco/.local/share/containers/storage/overlay/6984489de3665da8c2b4138bce485965439fb32bb54014185dcf5eb88057d649/diff:/home/franco/.local/share/containers/storage/overlay/5fe0da6c66df7e8076084e58cefa1fbc3b1461f3fb75f9734efe4177d1ecc790/diff:/home/franco/.local/share/containers/storage/overlay/88466a243658a910cd71f34f9d0b8af62f0d0d5488294211a8980b0d02c71bac/diff",
                    "MergedDir": "/home/franco/.local/share/containers/storage/overlay/8b180eb3b66b65265d4c368daa8f2b9723180e2fe7deacf6a8b86e6a60f8bd20/merged",
                    "UpperDir": "/home/franco/.local/share/containers/storage/overlay/8b180eb3b66b65265d4c368daa8f2b9723180e2fe7deacf6a8b86e6a60f8bd20/diff",
                    "WorkDir": "/home/franco/.local/share/containers/storage/overlay/8b180eb3b66b65265d4c368daa8f2b9723180e2fe7deacf6a8b86e6a60f8bd20/work"
               }
          },
          "Mounts": [
               {
                    "Type": "volume",
                    "Name": "lab_jenkins_home",
                    "Source": "/home/franco/.local/share/containers/storage/volumes/lab_jenkins_home/_data",
                    "Destination": "/var/jenkins_home",
                    "Driver": "local",
                    "Mode": "",
                    "Options": [
                         "nosuid",
                         "nodev",
                         "rbind"
                    ],
                    "RW": true,
                    "Propagation": "rprivate"
               }
          ],
          "Dependencies": [],
          "NetworkSettings": {
               "EndpointID": "",
               "Gateway": "",
               "IPAddress": "",
               "IPPrefixLen": 0,
               "IPv6Gateway": "",
               "GlobalIPv6Address": "",
               "GlobalIPv6PrefixLen": 0,
               "MacAddress": "",
               "Bridge": "",
               "SandboxID": "",
               "HairpinMode": false,
               "LinkLocalIPv6Address": "",
               "LinkLocalIPv6PrefixLen": 0,
               "Ports": {
                    "50000/tcp": [
                         {
                              "HostIp": "0.0.0.0",
                              "HostPort": "50000"
                         }
                    ],
                    "8080/tcp": [
                         {
                              "HostIp": "0.0.0.0",
                              "HostPort": "8080"
                         }
                    ]
               },
               "SandboxKey": "/run/user/1000/netns/netns-117dbe08-7ba9-6bf3-eb26-0bf9d0ffb5a9",
               "Networks": {
                    "lab_default": {
                         "EndpointID": "",
                         "Gateway": "10.89.2.1",
                         "IPAddress": "10.89.2.7",
                         "IPPrefixLen": 24,
                         "IPv6Gateway": "",
                         "GlobalIPv6Address": "",
                         "GlobalIPv6PrefixLen": 0,
                         "MacAddress": "f2:ee:03:11:a2:38",
                         "NetworkID": "0ecfad7fed67bbd407c1187c57e65c5b3f1d28cda8498bf8d9974f6106930b82",
                         "DriverOpts": null,
                         "IPAMConfig": null,
                         "Links": null,
                         "Aliases": [
                              "jenkins",
                              "696684340ef0"
                         ]
                    }
               }
          },
          "Namespace": "",
          "IsInfra": false,
          "IsService": false,
          "KubeExitCodePropagation": "invalid",
          "lockNumber": 29,
          "Config": {
               "Hostname": "696684340ef0",
               "Domainname": "",
               "User": "root",
               "AttachStdin": false,
               "AttachStdout": false,
               "AttachStderr": false,
               "Tty": false,
               "OpenStdin": false,
               "StdinOnce": false,
               "Env": [
                    "JAVA_HOME=/opt/java/openjdk",
                    "JENKINS_INCREMENTALS_REPO_MIRROR=https://repo.jenkins-ci.org/incrementals",
                    "JENKINS_UC=https://updates.jenkins.io",
                    "COPY_REFERENCE_FILE_LOG=/var/jenkins_home/copy_reference_file.log",
                    "REF=/usr/share/jenkins/ref",
                    "container=podman",
                    "LANG=C.UTF-8",
                    "JENKINS_SLAVE_AGENT_PORT=50000",
                    "JENKINS_HOME=/var/jenkins_home",
                    "JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental",
                    "JENKINS_VERSION=2.516.3",
                    "PATH=/opt/java/openjdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                    "HOME=/root",
                    "HOSTNAME=696684340ef0"
               ],
               "Cmd": null,
               "Image": "docker.io/jenkins/jenkins:lts",
               "Volumes": null,
               "WorkingDir": "/",
               "Entrypoint": [
                    "/usr/bin/tini",
                    "--",
                    "/usr/local/bin/jenkins.sh"
               ],
               "OnBuild": null,
               "Labels": {
                    "PODMAN_SYSTEMD_UNIT": "podman-compose@lab.service",
                    "com.docker.compose.container-number": "1",
                    "com.docker.compose.project": "lab",
                    "com.docker.compose.project.config_files": "docker-compose.yml",
                    "com.docker.compose.project.working_dir": "/home/franco/dev/lab",
                    "com.docker.compose.service": "jenkins",
                    "io.podman.compose.config-hash": "37e3907827e8e4ce6130739b3a2b3f2253660fb325c32fe5e5b2a205221c1190",
                    "io.podman.compose.project": "lab",
                    "io.podman.compose.service": "jenkins",
                    "io.podman.compose.version": "1.5.0",
                    "org.opencontainers.image.description": "The Jenkins Continuous Integration and Delivery server",
                    "org.opencontainers.image.licenses": "MIT",
                    "org.opencontainers.image.revision": "69c12c7c0453c55bccfacea26e2ead9af91be714",
                    "org.opencontainers.image.source": "https://github.com/jenkinsci/docker",
                    "org.opencontainers.image.title": "Official Jenkins Docker image",
                    "org.opencontainers.image.url": "https://www.jenkins.io/",
                    "org.opencontainers.image.vendor": "Jenkins project",
                    "org.opencontainers.image.version": "2.516.3"
               },
               "Annotations": {
                    "io.container.manager": "libpod",
                    "io.kubernetes.cri-o.SandboxID": "c9e69ccc929c8fc86be192caae9e8bce1459ff7b2b04d0f0cc4a992b7a7015c1",
                    "org.opencontainers.image.stopSignal": "15",
                    "org.systemd.property.KillSignal": "15",
                    "org.systemd.property.TimeoutStopUSec": "uint64 10000000"
               },
               "StopSignal": "SIGTERM",
               "HealthcheckOnFailureAction": "none",
               "HealthLogDestination": "local",
               "HealthcheckMaxLogCount": 5,
               "HealthcheckMaxLogSize": 500,
               "CreateCommand": [
                    "podman",
                    "create",
                    "--name=jenkins",
                    "--pod=pod_lab",
                    "--label",
                    "io.podman.compose.config-hash=37e3907827e8e4ce6130739b3a2b3f2253660fb325c32fe5e5b2a205221c1190",
                    "--label",
                    "io.podman.compose.project=lab",
                    "--label",
                    "io.podman.compose.version=1.5.0",
                    "--label",
                    "PODMAN_SYSTEMD_UNIT=podman-compose@lab.service",
                    "--label",
                    "com.docker.compose.project=lab",
                    "--label",
                    "com.docker.compose.project.working_dir=/home/franco/dev/lab",
                    "--label",
                    "com.docker.compose.project.config_files=docker-compose.yml",
                    "--label",
                    "com.docker.compose.container-number=1",
                    "--label",
                    "io.podman.compose.service=jenkins",
                    "--label",
                    "com.docker.compose.service=jenkins",
                    "-v",
                    "lab_jenkins_home:/var/jenkins_home",
                    "--network=lab_default:alias=jenkins",
                    "-p",
                    "8080:8080",
                    "-p",
                    "50000:50000",
                    "-u",
                    "root",
                    "--restart",
                    "unless-stopped",
                    "jenkins/jenkins:lts"
               ],
               "Umask": "0022",
               "Timeout": 0,
               "StopTimeout": 10,
               "Passwd": true,
               "sdNotifyMode": "container",
               "ExposedPorts": {
                    "50000/tcp": {},
                    "8080/tcp": {}
               }
          },
          "HostConfig": {
               "Binds": [
                    "lab_jenkins_home:/var/jenkins_home:rprivate,nosuid,nodev,rbind"
               ],
               "CgroupManager": "systemd",
               "CgroupMode": "private",
               "ContainerIDFile": "",
               "LogConfig": {
                    "Type": "journald",
                    "Config": null,
                    "Path": "",
                    "Tag": "",
                    "Size": "-1B"
               },
               "NetworkMode": "bridge",
               "PortBindings": {
                    "50000/tcp": [
                         {
                              "HostIp": "0.0.0.0",
                              "HostPort": "50000"
                         }
                    ],
                    "8080/tcp": [
                         {
                              "HostIp": "0.0.0.0",
                              "HostPort": "8080"
                         }
                    ]
               },
               "RestartPolicy": {
                    "Name": "unless-stopped",
                    "MaximumRetryCount": 0
               },
               "AutoRemove": false,
               "AutoRemoveImage": false,
               "Annotations": {
                    "io.container.manager": "libpod",
                    "io.kubernetes.cri-o.SandboxID": "c9e69ccc929c8fc86be192caae9e8bce1459ff7b2b04d0f0cc4a992b7a7015c1",
                    "org.opencontainers.image.stopSignal": "15",
                    "org.systemd.property.KillSignal": "15",
                    "org.systemd.property.TimeoutStopUSec": "uint64 10000000"
               },
               "VolumeDriver": "",
               "VolumesFrom": null,
               "CapAdd": [],
               "CapDrop": [],
               "Dns": [],
               "DnsOptions": [],
               "DnsSearch": [],
               "ExtraHosts": [],
               "HostsFile": "",
               "GroupAdd": [],
               "IpcMode": "shareable",
               "Cgroup": "",
               "Cgroups": "default",
               "Links": null,
               "OomScoreAdj": 0,
               "PidMode": "private",
               "Privileged": false,
               "PublishAllPorts": false,
               "ReadonlyRootfs": false,
               "SecurityOpt": [],
               "Tmpfs": {},
               "UTSMode": "private",
               "UsernsMode": "",
               "ShmSize": 65536000,
               "Runtime": "oci",
               "ConsoleSize": [
                    0,
                    0
               ],
               "Isolation": "",
               "CpuShares": 0,
               "Memory": 0,
               "NanoCpus": 0,
               "CgroupParent": "user.slice/user-1000.slice/user@1000.service/user.slice/user-libpod_pod_c9e69ccc929c8fc86be192caae9e8bce1459ff7b2b04d0f0cc4a992b7a7015c1.slice",
               "BlkioWeight": 0,
               "BlkioWeightDevice": null,
               "BlkioDeviceReadBps": null,
               "BlkioDeviceWriteBps": null,
               "BlkioDeviceReadIOps": null,
               "BlkioDeviceWriteIOps": null,
               "CpuPeriod": 0,
               "CpuQuota": 0,
               "CpuRealtimePeriod": 0,
               "CpuRealtimeRuntime": 0,
               "CpusetCpus": "",
               "CpusetMems": "",
               "Devices": [],
               "DiskQuota": 0,
               "KernelMemory": 0,
               "MemoryReservation": 0,
               "MemorySwap": 0,
               "MemorySwappiness": 0,
               "OomKillDisable": false,
               "PidsLimit": 2048,
               "Ulimits": [
                    {
                         "Name": "RLIMIT_NOFILE",
                         "Soft": 524288,
                         "Hard": 524288
                    },
                    {
                         "Name": "RLIMIT_NPROC",
                         "Soft": 95197,
                         "Hard": 95197
                    }
               ],
               "CpuCount": 0,
               "CpuPercent": 0,
               "IOMaximumIOps": 0,
               "IOMaximumBandwidth": 0,
               "CgroupConf": null
          },
          "UseImageHosts": false,
          "UseImageHostname": false
     }
]
```
