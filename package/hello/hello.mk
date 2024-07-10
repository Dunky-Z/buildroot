HELLO_VERSION = master
HELLO_SITE_METHOD = local
HELLO_SITE = /home/user/ips-workspace/riscv-hello-c
HELLO_ALWAYS_BUILD = YES
# HELLO_INSTALL_STAGING = YES
HELLO_CFLAGS =
HELLO_LDFLAGS =
OUT_BIN = hello
HELLO_MAKE_FLAGS += \
     CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
     CC=$(TARGET_CC)      \
     OUT_BIN=$(OUT_BIN)  \
     AR=$(TARGET_AR)      \
     STRIP=$(TARGET_STRIP) \
     CFLAGS=$(HELLO_CFLAGS) \
     LDFLAGS=$(HELLO_LDFLAGS) \
     STAGING_DIR=$(STAGING_DIR)  \
     TARGET_DIR=$(TARGET_DIR)


define HELLO_BUILD_CMDS
	$(MAKE) clean  -C $(@D)
	$(MAKE) $(HELLO_MAKE_FLAGS)  -C $(@D)
endef

define HELLO_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/hello $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
