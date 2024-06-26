################################################################################
#
# kodi-visualisation-goom
#
################################################################################

KODI_VISUALISATION_GOOM_VERSION = a8cb12592900fcd099d65d7760cbb113489ec884
KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md

KODI_VISUALISATION_GOOM_DEPENDENCIES = glm kodi

KODI_VISUALISATION_GOOM_CONF_OPTS += \
	-DCMAKE_C_FLAGS="-std=c11"

$(eval $(cmake-package))
