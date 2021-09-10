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

# Add Pages components
## Create a PageModel
From the parent folder
``` bash
mkdir pageModels && cd pageModels
```
Create the descriptor
``` bash
touch content_page_with_code-descriptor.yaml
```
Add the descriptor Content (`pageModel` live template in Intellij)
``` yaml
code: content_page_with_code
description: Content page with code
templatePath: content-page-with-code.ftl
configuration:
  frames:
    - pos: 0
      description: Logo
      mainFrame: false
      defaultWidget:
        code: logo
        properties:
      sketch:
        x1: 0
        y1: 0
        x2: 2
        y2: 0
    - pos: 1
      description: Navigation bar
      mainFrame: false
      defaultWidget:
        code: navigation-menu
        properties:
      sketch:
        x1: 3
        y1: 0
        x2: 5
        y2: 0
    - pos: 2
      description: Search
      mainFrame: false
      defaultWidget:
        code: search_form
        properties:
      sketch:
        x1: 6
        y1: 0
        x2: 8
        y2: 0
    - pos: 3
      description: Login
      mainFrame: false
      defaultWidget:
        code: keycloak-login
        properties:
      sketch:
        x1: 9
        y1: 0
        x2: 11
        y2: 0
    - pos: 4
      description: Content Frame
      mainFrame: true
      defaultWidget:
        code: content_viewer
        properties:
          modelId: '10002'
      sketch:
        x1: 0
        y1: 1
        x2: 11
        y2: 1
    - pos: 5
      description: Frame 2
      mainFrame: false
      defaultWidget:
      sketch:
        x1: 0
        y1: 2
        x2: 11
        y2: 2
    - pos: 6
      description: Frame 3
      mainFrame: false
      defaultWidget:
      sketch:
        x1: 0
        y1: 3
        x2: 11
        y2: 3
    - pos: 7
      description: Frame 4
      mainFrame: false
      defaultWidget:
      sketch:
        x1: 0
        y1: 4
        x2: 11
        y2: 4
    - pos: 8
      description: Footer
      mainFrame: false
      defaultWidget:
      sketch:
        x1: 0
        y1: 5
        x2: 11
        y2: 5
```
Create the Freemarker template
``` bash
touch content-page-with-code.ftl
```
Add the ftl content (`pageModelFtl` in intellij)
```
<#assign wp=JspTaglibs["/aps-core"]>
<@wp.info key="systemParam" paramName="applicationBaseURL" var="appUrl" />

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>
            <@wp.currentPage param="title" />
        </title>
        <meta name="viewport" content="width=device-width,  user-scalable=no" />
        <link rel="icon" href="${appUrl}favicon.png" type="image/png" />
        <!-- Custom OOTB page template styles -->
        <link rel="stylesheet" href="<@wp.resourceURL />static/css/ootb/page-templates/index.css" rel="stylesheet">
        <!-- Carbon Design System -->
        <@wp.fragment code="entando_ootb_carbon_include" escapeXml=false />
        <@wp.fragment code="keycloak_auth" escapeXml=false />

        <@wp.outputHeadInfo type="CSS">
            <link rel="stylesheet" type="text/css" href="<@wp.cssURL /><@wp.printHeadInfo />" />
        </@wp.outputHeadInfo>

        <@wp.fragment code="prismjs_cdn_inclusions" escapeXml=false />
        </head>
        <body>
          <header-fragment app-url="${appUrl}">
            <template>
                <@wp.show frame=0 />
                <@wp.show frame=1 />
                <@wp.show frame=2 />
                <@wp.show frame=3 />
            </template>
          </header-fragment>
          <div class="bx--grid Homepage__body">
            <div class="bx--row"><@wp.show frame=4 /></div>
            <div class="bx--row"><@wp.show frame=5 /></div>
            <div class="bx--row"><@wp.show frame=6 /></div>
            <div class="bx--row"><@wp.show frame=7 /></div>
          </div>
          <div class="Homepage__footer"><@wp.show frame=8 /></div>
        </body>
</html>
```

Declare the pageModel in the main descriptor (`baseDescriptorFragments` in intellij)
```
  pageModels:
    - pageModels/content_page_with_code-descriptor.yaml
```

## Create the content
## create the page 
# Deploy a new version
```
ent prj pbs-publish
```
## Install the bundle
