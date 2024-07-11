################################################################################
#
# xz
#
################################################################################

XZ_VERSION = 5.6.2
XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
XZ_INSTALL_STAGING = YES
XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
XZ_CPE_ID_VENDOR = tukaani

XZ_CONF_OPTS = \
	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
	--enable-match-finders=hc3,hc4,bt2,bt3,bt4 \
	--enable-checks=crc32,crc64,sha256 \
	--disable-external-sha256 \
	--enable-microlzma \
	--enable-lzip-decoder \
	--enable-assembler \
	--enable-clmul-crc \
	--enable-arm64-crc32 \
	--disable-small \
	--enable-assume-ram=128 \
	--enable-xz \
	--enable-xzdec \
	--enable-lzmadec \
	--enable-lzmainfo \
	--enable-lzma-links \
	--enable-scripts \
	--enable-sandbox=auto \
	--enable-symbol-versions \
	--enable-rpath \
	--enable-largfile \
	--enable-unaligned-access=auto \
	--disable-unsafe-type-punning \
	--disable-werror \
	--enable-year2038

ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
XZ_CONF_OPTS += --enable-nls
else
XZ_CONF_OPTS += --disable-nls
endif

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
XZ_CONF_OPTS += --enable-threads
else
XZ_CONF_OPTS += --disable-threads
endif

HOST_XZ_CONF_OPTS = \
	$(XZ_CONF_OPTS) \
	--enable-nls \
	--enable-threads

# we are built before ccache
HOST_XZ_CONF_ENV = \
	CC="$(HOSTCC_NOCCACHE)" \
	CXX="$(HOSTCXX_NOCCACHE)"

$(eval $(autotools-package))
$(eval $(host-autotools-package))
