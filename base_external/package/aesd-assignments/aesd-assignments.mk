##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = ffce9f4b44f730338a414a2c77caab98c5e22352
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
#     $(info TARGET_CFLAGS are =$(TARGET_CFLAGS))
#    $(info TARGET_LDFLAGS are =$(TARGET_LDFLAGS))
#    $(info MY_CLASS=$(MY_CLASS))
# $(MAKE) --debug=v $(TARGET_CONFIGURE_OPTS) -C $(@D) all
# $(INSTALL) -m 0777 $(@D)/scripts/audioeqdriver-start-stop.sh $(TARGET_DIR)/etc/init.d/S99audioeqdriver
# $(INSTALL) -m 0777 $(@D)/audioeqdriver $(TARGET_DIR)/usr/bin/
# $(INSTALL) -m 0777 $(@D)/test/main $(TARGET_DIR)/usr/bin/
# $(INSTALL) -m 0777 $(@D)/audioeqdriver $(TARGET_DIR)/usr/bin/

AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/final-project-Sriram-Y.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_DEPENDENCIES = alsa-lib
AESD_ASSIGNMENTS_CONF_OPTS += $(shell pkg-config --cflags --libs alsa)
# MY_CLASS = AeldAeldAeld

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(info Directory: $(@D))
    PKG_CONFIG_PATH=$(TARGET_DIR)/usr/lib/pkgconfig
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(info $(INSTALL))
    $(INSTALL) -m 0777 $(@D)/audioeqdriver $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0777 $(@D)/scripts/audioeqdriver-start-stop.sh $(TARGET_DIR)/etc/init.d/S99audioeqdriver
    $(INSTALL) -m 0664 $(@D)/test_mp3/audio.mp3 $(TARGET_DIR)/media
endef

$(eval $(generic-package))
