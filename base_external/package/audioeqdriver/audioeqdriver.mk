##############################################################
#
# AUDIOEQDRIVER
#
##############################################################

AUDIOEQDRIVER_VERSION = '5f651a975fd69f58ea310ad3998ebd3d540cf300'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AUDIOEQDRIVER_SITE = 'git@github.com:cu-ecen-aeld/final-project-Sriram-Y.git'
AUDIOEQDRIVER_SITE_METHOD = git

define AUDIOEQDRIVER_PREPARE_CMDS
	echo "Cloning repository: $(AUDIOEQDRIVER_SITE)"
	$(call MESSAGE,"Cloning repository: $(AUDIOEQDRIVER_SITE)")
endef

define AUDIOEQDRIVER_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define AUDIOEQDRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/audioeqdriver $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scripts/audioeqdriver-start-stop.sh $(TARGET_DIR)/etc/init.d/S99audioeqdriver
endef

$(eval $(generic-package))