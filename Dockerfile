FROM finchsec/kali:base
LABEL org.opencontainers.image.authors="thomas@finchsec.com"
ENV LANG en_US.UTF-8
#hadolint ignore=SC2046,DL3005,DL3008,SC2406,DL3015,DL4006
RUN apt-get update && \
	echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/force-unsafe-io && \
	apt-get dist-upgrade -y && \
		apt-get install debconf-utils -y && \
		echo "kismet-capture-common kismet-capture-common/install-setuid boolean false" | debconf-set-selections && \
		echo "wireshark-common	wireshark-common/install-setuid	boolean boolean false" | debconf-set-selections && \
		DEBIAN_FRONTEND=noninteractive apt-get install -y kismet kismet-plugins tshark && \
		apt-get purge debconf-utils -y && \
		apt-get install \
			aircrack-ng tcpdump john cowpatty routerkeygenpc wpa-sycophant \
			asleap bettercap hostapd-mana reaver mdk3 mdk4 termshark berate-ap \
			hostapd-wpe freeradius-wpe wig-ng wifipumpkin3 airgeddon pcapfix \
			wordlists hostapd wpasupplicant iwd eaphammer wireless-tools \
			eapmd5pass pixiewps bully python3-simplejson iproute2 hcxtools \
			$([ "$(uname -m)" != "armv7l" ] && echo hashcat-utils hashcat pocl-opencl-icd) \
			$([ "$(uname -m)" = "x86_64" ] && echo intel-opencl-icd) \
			openssh-client kmod wifite hcxdumptool --no-install-recommends -y && \
		apt-get autoclean && \
		rm -rf /var/lib/dpkg/status-old /etc/dpkg/dpkg.cfg.d/force-unsafe-io /var/lib/apt/lists/*
# Use statically compiled asleap
ARG ASLEAP_BIN="/usr/local/bin/asleap"
COPY --from=finchsec/asleap:static /usr/bin/asleap "${ASLEAP_BIN}"
COPY --from=finchsec/asleap:static /usr/bin/genkeys /usr/local/bin/genkeys
# Install crackapd
ARG CRACKAPD_CONF="/usr/local/etc/crackapd.conf"
ARG CRACKAPD_PY="/usr/local/bin/crackapd.py"
COPY --from=finchsec/crackapd:latest "${CRACKAPD_PY}" "${CRACKAPD_PY}"
COPY --from=finchsec/crackapd:latest "${CRACKAPD_CONF}" "${CRACKAPD_CONF}"
# Kismet
EXPOSE 2501
# Bettercap
EXPOSE 80
