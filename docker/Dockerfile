FROM kalilinux/kali-rolling
LABEL org.opencontainers.image.authors="thomas@finchsec.com"
ENV LANG en_US.UTF-8
RUN apt update && \
	echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/force-unsafe-io && \
	apt dist-upgrade -y && \
		apt install locales -y && \
		echo "${LANG}" | tr '.' ' ' > /etc/locale.gen && locale-gen && \
		DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends tzdata && \
		apt install debconf-utils -y && \
		echo "locales locales/default_environment_locale select ${LANG}" | debconf-set-selections && \
		echo "locales locales/locales_to_be_generated multiselect ${LANG} UTF-8" | debconf-set-selections && \
		DEBIAN_FRONTEND=noninteractive apt install -y locales && \
		echo "kismet-capture-common kismet-capture-common/install-setuid boolean false" | debconf-set-selections && \
		echo "wireshark-common	wireshark-common/install-setuid	boolean boolean false" | debconf-set-selections && \
		DEBIAN_FRONTEND=noninteractive apt install -y kismet tshark && \
		apt purge debconf-utils -y && \
		apt install net-tools screen tmux nano vim python3 perl rfkill iw \
			aircrack-ng tcpdump john cowpatty hashcat routerkeygenpc \
			asleap bettercap hostapd-mana reaver mdk3 mdk4 procps zsh \
			hostapd-wpe freeradius-wpe wig-ng wifipumpkin3 airgeddon \
			wordlists hostapd wpasupplicant iwd eaphammer wireless-tools \
			eapmd5pass pixiewps bully psmisc python3-simplejson iproute2 \
			file bzip2 dns-root-data nftables iptables man-db xz-utils \
			openssh-client kmod ocl-icd-libopencl1 \
			--no-install-recommends -y && \
		apt autoclean && \
		rm -rf /var/lib/dpkg/status-old /etc/dpkg/dpkg.cfg.d/force-unsafe-io /var/lib/apt/lists/*
RUN [ "$(uname -m)" = "x86_64" ] && \
	apt install intel-opencl-icd --no-install-recommends -y
# Kismet
EXPOSE 2501
# Bettercap
EXPOSE 80
