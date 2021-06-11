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
    <@wp.show frame=0 />
</body>
</html>
