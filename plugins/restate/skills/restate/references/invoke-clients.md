---
sidebar_position: 2
description: "Use the clients to invoke handlers programmatically."
---

# Clients
The Restate SDK client library lets you invoke Restate handlers from anywhere in your application.
Use this only in non-Restate services without access to the Restate Context.

    The [UI](/develop/local_dev#restate-ui) helps you with invoking your services programmatically.
    Open the UI at port 9070, register your service, click on the service, open the playground, and copy over the code snippet to invoke your service in your preferred language.

    Always [invoke handlers via the context](/develop/java/service-communication), if you have access to it.
    Restate then attaches information about the invocation to the parent invocation.

Have a look at the documentation of the SDKs:
