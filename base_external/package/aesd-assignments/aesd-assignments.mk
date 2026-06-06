################################################################################
#
# aesd-assignments
#
################################################################################

AESD_ASSIGNMENTS_VERSION = master
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-krishnanbasudeo.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/writer
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
	$(INSTALL) -m 0644 $(@D)/conf/username.txt $(TARGET_DIR)/etc/finder-app/conf/username.txt
	$(INSTALL) -m 0644 $(@D)/conf/assignment.txt $(TARGET_DIR)/etc/finder-app/conf/assignment.txt
endef

$(eval $(generic-package))
