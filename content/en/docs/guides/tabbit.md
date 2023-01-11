---
title: "tabbit"
weight: 200
---
Hello2



## Here come the tabs
---

{{<tabs name="platform" >}}


{{<tab name="wubble" include="build__platform__macos__amd64" />}}

{{%tab name="macOS" subtitle="(amd64)"%}}
Intel Mac
<br/>
*some more stuff*

{{<info>}}I am `info` with [link](https://example.com){{</info>}}
{{<note>}}Note huzzah{{</note>}}

{{%/tab%}}

{{%tab name="macOS" subtitle="(arm64)"%}}
[Apple](https://apple.com) Silicon
{{%/tab%}}

{{%tab name="Linux"%}}
This tab has [markdown content](https://https://www.markdownguide.org). That
is why it uses `%tab` instead of `<tab`.
{{%/tab%}}

{{<tab name="Windows">}}
Windows
{{</tab>}}

{{</tabs>}}


{{<tabs name="languages-tabs" >}}

{{<tab name="Python" codelang="py">}}
print('Hello World!');
{{</tab>}}

{{<tab name="Go" codelang="go">}}
fmt.Println("Hello World!")
{{</tab>}}

{{</tabs>}}





{{< tabs name="tab_with_md" >}}
{{< tab name="Markdown" subtitle="wubbddle2d">}}
This is **some markdown.**s



{{<info>}}I am `alert` with [link](https://example.com){{</info>}}
{{<warning>}}I am `warning` with [link](https://example.com){{</warning>}}
{{<success>}}I am `success` with [link](https://example.com){{</success>}}
{{<danger>}}I am `danger` with [link](https://example.com){{</success>}}

{{< /tab >}}


{{< tab name="HTML" subtitle="for you">}}
<div>
	<h3>Plain HTML</h3>
	<p>This is some <i>plain</i> HTML.</p>
</div>
{{< /tab >}}
{{< /tabs >}}

---



