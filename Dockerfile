FROM scratch
MAINTAINER ngdly <ngdly@qq.com>
ADD files/oraclelinux-7.4-rootfs.tar.xz /
ADD files/instantclient-basic-linux.x64-12.2.0.1.0.zip /root

RUN yum install -y libaio \
	&& yum install -y libaio-devel \
	&& yum install -y scl-utils devtoolset-3 \
	&& yum install -y python2 \
	&& yum install -y unzip \
	&& mkdir -p /opt/oracle \
	&& cd /opt/oracle \
	&& mv /root/instantclient-basic-linux.x64-12.2.0.1.0.zip /opt/oracle \
	&& unzip instantclient-basic-linux.x64-12.2.0.1.0.zip \
	&& export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2 \
	&& mkdir -p /opt/oracle/instantclient_12_2/network/admin \
	&& sh -c "echo /opt/oracle/instantclient_12_2 > /etc/ld.so.conf.d/oracle-instantclient.conf" \
	&& ldconfig \
	&& rm -rf instantclient-basic-linux.x64-12.2.0.1.0.zip \
	&& cd /opt \
	&& curl -SLO https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-linux-x64.tar.xz \
	&& tar -xvf node-v8.9.3-linux-x64.tar.xz \
	&& mv node-v8.9.3-linux-x64 nodejs \
	&& ls \
	&& ln -s /opt/nodejs/bin/node /usr/local/bin/ \
	&& ln -s /opt/nodejs/bin/npm /usr/local/bin/ \
	&& rm -rf node-v8.9.3-linux-x64.tar.xz \
	&& npm i --unsafe-perm oracledb -g 
	
ENV NODE_PATH /opt/nodejs/lib/node_modules

# overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]