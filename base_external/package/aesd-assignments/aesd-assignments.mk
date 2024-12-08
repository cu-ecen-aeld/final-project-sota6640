##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '2d09c3507bfeea4e3b150d7b1ef1aadb5ed32346'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/final-project-Sriram-Y.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_DEPENDENCIES = alsa-lib
AESD_ASSIGNMENTS_CONF_OPTS += $(shell pkg-config --cflags --libs alsa)

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(info Using cross-compiler: arm-none-linux-gnueabihf-gcc)
    $(MAKE) -C $(@D) clean
    $(MAKE) -C $(@D) \
        CC=arm-none-linux-gnueabihf-gcc \
        CFLAGS="$(TARGET_CFLAGS)" \
        LDFLAGS="$(TARGET_LDFLAGS)" \
        all
endef




define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(info $(INSTALL))
    $(INSTALL) -m 0755 $(@D)/audioeqdriver $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/scripts/audioeqdriver-start-stop.sh $(TARGET_DIR)/etc/init.d/S99audioeqdriver
endef

$(eval $(generic-package))
