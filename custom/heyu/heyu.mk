#############################################################
#
# Heyu
#
#############################################################
HEYU_VERSION = 2.9.3
HEYU_SOURCE = heyu-$(HEYU_VERSION).tar.gz
HEYU_SITE = http://www.heyu.org/download

define HEYU_BUILD_CMDS
	(cd $(@D) ; ./Configure ; cat Makefile | sed 's/CFLAGS = -g/CFLAGS =/g' > Makefile.new ; mv Makefile.new Makefile)
	$(MAKE) CC="$(TARGET_CC)" LD=$(TARGET_LD) -C $(@D) all
endef

define HEYU_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/heyu $(TARGET_DIR)/usr/bin/heyu
	$(INSTALL) -D -m 0644 $(@D)/x10config.sample $(TARGET_DIR)/etc/heyu/x10.conf
	mkdir $(TARGET_DIR)/var/tmp/heyu
endef

$(eval $(call GENTARGETS,package,heyu))
