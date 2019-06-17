# bld_boardpackage_imx53

Testintegration if the recently added A2xx support at the linux kernel MSM graphics driver could be used to replace 
the closed source "gpu-amd-bin-mx51" binary driver with a open-source graphics stack.

Current State:
1. On a custom imx53 hardware the z430 GPU could be initialized with the linux kernel msm driver.
2. The freedreno userspace backend form mesa3d and libdrm is used to interact with der kernel driver.
   The headless msm driver for hardware acceleration and imx-ldb driver as LVDS display driver
3. Qt 5.11 is connected by "eglfs_kms" to accelerated graphisc stack 

