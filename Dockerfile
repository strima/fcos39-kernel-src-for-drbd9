FROM fedora:39

# Packages needed for the DRBD build process.
RUN yum install -y gcc make coccinelle koji cpio patch perl-interpreter diffutils kmod \
  && yum clean all

# DOWNLOAD STUFF
RUN cd /tmp && koji download-build --rpm --arch=x86_64 kernel-devel-6.7.4-200.fc39.x86_64

# EXTRACT KERNEL HEADERS
RUN cd /tmp && rpm2cpio ./kernel-devel-6.7.4-200.fc39.x86_64.rpm | cpio -idD /

