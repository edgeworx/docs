---
title: "tabbit"
weight: 200
---
Hello2

{{<tabs name="platform" >}}

{{<tab name="macOS" subtitle="(amd64)" include="build__platform__macos__amd64" />}}
{{<tab name="macOS" subtitle="(arm64)" include="build__platform__macos__arm64" />}}
{{<tab name="Linux"  include="build__platform__linux" />}}
{{<tab name="Windows"  include="build__platform__windows" />}}

{{</tabs>}}


{{<tabs name="languages-tabs" >}}

{{<tab name="Python" codelang="py">}}
print('Hello World!');
{{</tab>}}

{{<tab name="Go" codelang="go">}}
fmt.Println("Hello World!")
{{</tab>}}

{{</tabs>}}




