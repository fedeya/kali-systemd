FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# Update Repos and Install Tools 

RUN apt-get -y update && apt-get -y upgrade && \
  apt-get install -y \
  kali-linux-core \
  kali-tools-top10 \
  dirb \
  gobuster \
  git \
  pciutils \
  beef-xss \
  dirbuster \
  wfuzz \
  iputils-ping \
  zaproxy \
  net-tools \
  bash-completion

RUN apt-get autoremove -y && \
  apt-get clean

# Run Systemd

RUN cd /lib/systemd/system/sysinit.target.wants/; ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 \
  rm -f /lib/systemd/system/multi-user.target.wants/*;\
  rm -f /etc/systemd/system/*.wants/*;\
  rm -f /lib/systemd/system/local-fs.target.wants/*; \
  rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
  rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
  rm -f /lib/systemd/system/basic.target.wants/*;\
  rm -f /lib/systemd/system/anaconda.target.wants/*; \
  rm -f /lib/systemd/system/plymouth*; \
  rm -f /lib/systemd/system/systemd-update-utmp*;
RUN systemctl set-default multi-user.target
ENV init /lib/systemd/systemd
VOLUME [ "/sys/fs/cgroup" ]
ENTRYPOINT ["/lib/systemd/systemd"]
