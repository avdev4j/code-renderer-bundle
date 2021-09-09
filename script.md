# Initiate the bundle
Start by creating the parent folder
``` bash
take code-renderer-bundle-parent
```
and the bundle folder
``` bash
take bundle
```
init the ent project
``` bash
ent prj init
```

# Add the first component

## prismjs fragment
``` bash
take fragments
```
``` bash
touch prismjs_cdn_inclusions-descriptor.yaml
```
Add the prismjs imports descriptor (command `prismFragment` in Intellij) 
``` yaml
code: prismjs_cdn_inclusions
guiCode: '
<#assign wp=JspTaglibs["/aps-core"]>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/themes/prism.min.css" integrity="sha512-tN7Ec6zAFaVSG3TpNAKtk4DOHNpSwKHxxrsiw4GHKESGPs5njn/0sMCUMl2svV4wo4BK/rCP7juYz+zx+l6oeQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/prism.min.js" integrity="sha512-YBk7HhgDZvBxmtOfUdvX0z8IH2d10Hp3aEygaMNhtF8fSOvBZ16D/1bXZTJV6ndk/L/DlXxYStP8jrF77v2MIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.23.0/plugins/autoloader/prism-autoloader.min.js" integrity="sha512-zc7WDnCM3aom2EziyDIRAtQg1mVXLdILE09Bo+aE1xk0AM2c2cVLfSW9NrxE5tKTX44WBY0Z2HClZ05ur9vB6A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
'
```
## main descriptor
Start by creating the main descriptor.
``` bash
touch descriptor.yml
```
In it add the following (command `baseDescriptor` in IntelliJ)
```
code: code-renderer
description: Code renderer bundle
components:
```
Add the fragments section in the main descriptor fragments (command `baseDescriptorFragments` in Intellij):
``` yaml
fragments:
    - fragments/prismjs_cdn_inclusions-descriptor.yaml
```

# Publish the bundle
In the parent folder `code-renderer-bundle-parent` run the following command to publish the bundle to the Git repository
```
ent prj pbs-init
```
