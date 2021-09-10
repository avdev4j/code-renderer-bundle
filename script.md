# Initiate the bundle
Start by creating the parent folder
``` bash
mkdir code-renderer-bundle-parent && cd code-renderer-bundle-parent
```

Initialize the project
``` bash
ent prj init
```

Fill the project name, and remove the `-parent` suffix.
```
Please provide the project name (code-renderer-bundle-parent): code-renderer-bundle
```

Create the bundle folder
``` bash
mkdir bundle && cd bundle
```

# Add the first component

## prismjs fragment
``` bash
mkdir fragments && cd fragments
```
``` bash
touch prismjs_cdn_inclusions-descriptor.yaml
```
``` bash
vi prismjs_cdn_inclusions-descriptor.yaml
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
cd ..
touch descriptor.yaml
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
## Configure the publication system
From the parent folder `code-renderer-bundle-parent` run the following command to publish the bundle to the Git repository
```
ent prj pbs-init
```
Then answer the question by providing the HTTPS Git repository link, your name and your email.
For the others, leave the default values.
```
Please provide the URL of the publication repository: https://github.com/avdev4j/code-renderer-bundle-test.git
Please provide the git user name: avdev4j
Please provide the git email: ***@entando.com
Initialized empty Git repository in /private/tmp/code-renderer-bundle-parent/bundle/.git/
Should I enable the credentials cache for the publication of the frontend? (y/n/q) y
Expiration in seconds? (86400):
```
## Publish on GitHub
Run the command
```
ent prj pbs-publish
```
Provide a number version (add the 'v' prefix to follow the Git tag pattern)
```
~~~
➤ [I] | 2021-09-10 17-24-55 | Publishing the frontend to git
Please provide the bundle version number: v0.0.1
Please provide the bundle version comment (v0.0.1  - 2021-09-10T15:25:06+0000): the first version
[master 71a299a] the first version
 2 files changed, 7 insertions(+)
 create mode 100644 descriptor.yml
 create mode 100644 fragments/prismjs_cdn_inclusions-descriptor.yaml
➤ [I] | 2021-09-10 17-25-14 | Version v0.0.1 published
~~~
```
