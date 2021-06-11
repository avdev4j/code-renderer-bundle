<#assign wp=JspTaglibs["/aps-core"]>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>
        Code rendering
    </title>
    <meta name="viewport" content="width=device-width,  user-scalable=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />favicon.png" type="image/png" />
    <@wp.fragment code="highlightjs_cdn_inclusions" escapeXml=false />
</head>
<body>
    <pre><code class="language-js">
    get initializing() {
    const phaseFromJHipster = super._initializing();
    return {
        ...phaseFromJHipster,
        setupConfigQuarkus() {
            const context = this.context;
            if (!context.useConfigurationFile) {
                context.dataAccess = constants.DEFAULT_DATA_ACCESS;
            } else {
                context.dataAccess = context.fileData ? context.fileData.dataAccess : constants.DEFAULT_DATA_ACCESS;
            }
        },
    };
    }
    </code></pre>

    <pre><code class="language-yaml">
    code: standard-demo
    description: Standard Demo bundle
    components:
    widgets:
    - widgets/brand-logo-descriptor.yaml
    - widgets/breadcrumb-descriptor.yaml
    </code></pre>

<@wp.show frame=0 />
<@wp.show frame=1 />
<@wp.show frame=2 />
<@wp.show frame=3 />
<@wp.show frame=4 />
<@wp.show frame=5 />
<@wp.show frame=6 />
<@wp.show frame=7 />
<@wp.show frame=8 />
<@wp.show frame=9 />
<@wp.show frame=10 />
<@wp.show frame=11 />
<@wp.show frame=12 />
<@wp.show frame=13 />
<@wp.show frame=14 />
</body>
</html>
