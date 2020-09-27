# helloworld-webpart

## Summary

SharePoint Framework with Docker example

## Used SharePoint Framework version

![version](https://img.shields.io/badge/version-1.11-green.svg)

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)

## Getting started

- Clone this repository
- Ensure that you are at the solution folder
- In the command-line run:

```sh
docker build -t helloworld:1.0 .
```

```sh
docker run -it --rm --name ${PWD##*/} -v $PWD:/usr/src/app -p 5432:5432 -p 4321:4321 -p 35729:35729 helloworld:1.0
```

```sh
gulp serve
```

To open the SharePoint workbench, navigate to **https://localhost:5432/workbench** in the browser.

To close the container, in the container command-line run:

```sh
exit
```

## Known issues

### Can't access workbench

Open `node_modules\@microsoft\sp-build-web\lib\SPWebBuildRig.js` and change lines 96-98 from:

```js
spBuildCoreTasks.writeManifests.mergeConfig({
    debugBasePath: `${serve.taskConfig.https ? 'https' : 'http'}://${serve.taskConfig.hostname}:${serve.taskConfig.port}/`
});
```

to (add the `if` statement):

```js
if (!spBuildCoreTasks.writeManifests.taskConfig.debugBasePath) {
    spBuildCoreTasks.writeManifests.mergeConfig({
        debugBasePath: `${serve.taskConfig.https ? 'https' : 'http'}://${serve.taskConfig.hostname}:${serve.taskConfig.port}/`
    });
}
```

## References

- [SharePoint Framework Docker images](https://github.com/waldekmastykarz/docker-spfx)
- [Getting started with Docker](https://docs.docker.com/get-started/)
- [Getting started with SharePoint Framework](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/set-up-your-developer-tenant)
- [Building for Microsoft teams](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/build-for-teams-overview)
- [Use Microsoft Graph in your solution](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/web-parts/get-started/using-microsoft-graph-apis)
- [Publish SharePoint Framework applications to the Marketplace](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/publish-to-marketplace-overview)
- [Microsoft 365 Patterns and Practices](https://aka.ms/m365pnp) - Guidance, tooling, samples and open-source controls for your Microsoft 365 development
