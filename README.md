# Supported tags and respective `Dockerfile` links
-	[`base`, `latest` (*Alpine/openjdk8/glibc/Dockerfile*)](https://github.com/blueapple188/baseimage/blob/master/java_base/Dockerfile)
-	[`auto_heap` (*Alpine/openjdk8/glibc/agent-bond/jmx_exporter/run-java.sh/Dockerfile*)] (https://github.com/blueapple188/baseimage/blob/master/java_auto_heap/Dockerfile)

# Alpine Openjdk Base Images

This is a repository for Java Docker base images used in other projects.

The Java base images come in different flavors:

* Based on [Alpine Linux](https://www.alpinelinux.org/) (experimental)
* [OpenJDK 8](http://openjdk.java.net/projects/jdk8/)
* As JDK (Java Developer Toolkit) or as JRE (Java Runtime Environment)
* [Glibc](https://github.com/sgerrand/alpine-pkg-glibc) is the GNU C library as a Alpine Linux package to run binaries linked against glibc. This package utilizes a custom built glibc binary based on the vanilla glibc source. Built binary artifacts come from https://github.com/sgerrand/docker-glibc-builder.
* Other component.Etc.. curl bash tree tzdata openjdk8 mkfontscale mkfontdir fontconfig git openssh wget libgcc sqlite sqlite-dev

All images add the following features:

* [agent-bond](https://github.com/fabric8io/agent-bond) is included
  which combines [Jolokia](http://www.jolokia.org) and
  [jmx_exporter](https://github.com/prometheus/jmx_exporter)
* A startup script [run-java.sh](https://github.com/fabric8io/run-java-sh) is
  included which transparently starts Java application provided as FAT-jar or
  traditionally with a bunch of jar dependencies.
* [dumb-init](https://github.com/Yelp/dumb-init) is a simple process supervisor and init system designed to run as PID 1 inside minimal   container environments (such as Docker). It is deployed as a small, statically-linked binary written in C.

  Lightweight containers have popularized the idea of running a single process or service without normal init systems like systemd or     sysvinit. However, omitting an init system often leads to incorrect handling of processes and signals, and can result in problems such   as containers which can't be gracefully stopped, or leaking containers which should have been destroyed.

  dumb-init enables you to simply prefix your command with dumb-init. It acts as PID 1 and immediately spawns your command as a child     process, taking care to properly handle and forward signals as they are received.
* [gosu](https://github.com/tianon/gosu) is a simple tool grown out of the simple fact that su and sudo have very strange and often       annoying TTY and signal-forwarding behavior. They're also somewhat complex to setup and use (especially in the case of sudo), which     allows for a great deal of expressivity, but falls flat if all you need is "run this specific application as this specific user and     get out of the pipeline".

* [Supervisor][133]([Github][134]) init system overlayed on it.

The core of how gosu works is stolen directly from how Docker/libcontainer itself starts an application inside a container (and in fact, is using the /etc/passwd processing code directly from libcontainer's codebase).  

Imags Instructions
- The blueapple/alpine_glibc_basicimage/java_base is base alpine.
- The blueapple/alpine_glibc_basicimage/java_auto_heap's shell base [fabric8/java-jboss-openjdk8-jdk](https://hub.docker.com/r/fabric8/java-jboss-openjdk8-jdk/)
