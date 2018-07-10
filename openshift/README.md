#Build and Deploy XLRelease on OpenShift

This document and the files alongside it provide what is needed to build and deploy XLRelease (trial) on OpenShift.

It includes a modified Dockerfile that works with OpenShift's security/permission model plus a set of resource files to create build and deployment objects in OpenShift.

The steps to use these are as follows:

1. fork this repo
1. edit openshift/resources/xl-release-server.conf and update `server.url` (forking the repo and making this edit aren't ideal and should be improved so e.g it can be controlled via environment variable, or perhaps xl-release-server.conf becomes a ConfigMap)
1. commit and push your edited file
1.  In an OpenShift project space where you'd like to run your builds and have your ImageStreams, run:

    ```bash
    oc process -f xlrelease-openshift-build.json -p GITHB_URL=<URL for your github repo containing your fork> | oc create -f -
    ```

1. In an OpenShift project space where you'd like to *deploy* XLRelease, run:

    ```bash
    oc process -f xlrelease-license-configmap.json -p LICENSE_KEY=<your license> | oc create -f -
    oc process -f xlrelease-deployment-env.json -p IMAGESTREAM_NAMESPACE=<your build namespace> | oc create -f -
    ```
    
    *Note*: the default service account in your *deployment* namespace will need to have permission to pull images from the build namespace
    
1. Expose the app at URL of your choosing via `oc expose` 
