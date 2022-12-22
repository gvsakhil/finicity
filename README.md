<h4 align="center"> Finicity Plugin
    <br> 
</h4>

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)
- [Authors](#authors)

## 🧐 About <a name = "about"></a>

Throughout my project, I have been working with Finicity, which does not support Flutter. Since I have always dreamed of creating my own custom plugin, I decided to create one. As this is my first plugin, please raise PRs if something can be improved.

## 🏁 Getting Started <a name = "getting_started"></a>

```
Add this finicity: ^0.0.4 as part of your pubspec.yaml file

Initialize the plugin using final _finicityPlugin = Finicity();

As a next step call initFinicity which starts the Finicity SDK
var result = await _finicityPlugin.initFinicity(connectUrl);

Do check the Example section to see implementation

Note: To generate connect url follow this - https://developer.mastercard.com/open-banking-us/documentation/connect/generate-2-connect-url-apis/
```

## ✍️ Authors <a name = "authors"></a>

- [@gvsakhil](https://github.com/gvsakhil) - Idea & work