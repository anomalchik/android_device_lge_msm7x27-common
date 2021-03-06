# Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/initlogo.rle:root/initlogo.rle \
    $(LOCAL_PATH)/root/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/root/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/root/init.qcom.bluez.rc:root/init.qcom.bluez.rc \
    $(LOCAL_PATH)/root/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/root/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/root/default.prop:root/default.prop

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/CHANGELOG-CM.txt:system/etc/CHANGELOG-CM.txt \
    $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/configs/adreno_config.txt:system/etc/adreno_config.txt \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/nvram.txt:system/etc/wl/nvram.txt \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml


PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.camera=msm7x27 \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r6 \
    ro.setupwizard.enable_bypass=1 \
    ro.telephony.call_ring.multiple=false \
    ro.vold.umsdirtyratio=20

PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hdmi_out=false \
    debug.sf.hw=1 \
    debug.composition.type=mdp \
    debug.gr.numframebuffers=2 \
    persist.sys.purgeable_assets=1 \
    persist.service.adb.enable=1

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x27 \
    audio.primary.msm7x27

# Graphics & Media
PRODUCT_PACKAGES += \
#   hwcomposer.msm7x27 \
    libdivxdrmdecrypt

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    lights.msm7x27
    
# GPS
PRODUCT_PACKAGES += \
    gps.default \
    gps.msm7x27 \
    librpc
    
# Build sim toolkit
PRODUCT_PACKAGES += \
    Stk
    
# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

## BlueZ support

# Download BT firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# BlueZ configs
PRODUCT_COPY_FILES += \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf \
    system/bluetooth/data/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    system/bluetooth/data/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    system/bluetooth/data/input.conf:system/etc/bluetooth/input.conf \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \
    system/bluetooth/data/network.conf:system/etc/bluetooth/network.conf \
    system/bluetooth/data/stack.conf:system/etc/bluetooth/stack.conf

# javax.btobex is required by Bluetooth_msm
PRODUCT_PACKAGES += \
    javax.btobex

# BlueZ binaries
PRODUCT_PACKAGES += \
    bluetoothd \
    libbluetoothd \
    hcitool \
    hciconfig \
    hciattach \
    brcm_patchram_plus \
    hwaddrs

# Inherit qcom/msm7x27
$(call inherit-product, device/qcom/msm7x27/msm7x27.mk)

# Install/Uninstall google apps
$(call inherit-product, vendor/google/gapps_armv6_tiny.mk)

# Common assets
PRODUCT_AAPT_CONFIG := normal mdpi hdpi

# lge msm7x27-common overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/msm7x27-common/overlay