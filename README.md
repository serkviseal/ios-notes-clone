
<h1 align="center">iOS Notes App Clone</h1>

<div align="center">

![Status](https://github.com/silverhairs/ios-notes-clone/workflows/Dart/badge.svg?branch=main)
[![GitHub Issues](https://img.shields.io/github/issues/silverhairs/ios-notes-clone.svg)](https://github.com/silverhairs/ios-notes-clone/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/silverhairs/ios-notes-clone.svg)](https://github.com/silverhairs/ios-notes-clone/pulls)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

</div>

---

<p align="center"> A cross-platform clone of the iOS notes app.
    <br> 
</p>

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter](https://flutter.dev)
- [Dart](https://dart.dev/) (version 2.10.5 or upper)
- An IDE/Text Editor (Android Studio, VS Code or IntelliJ IDEA)
- An Android device (physical or emulator)

**PS: To run the app on an iOS simulator, you need XCode**

After all the prerequisites are met, follow the steps below: <br/>
Make sure the emulator is already running and if you are using a physical device, make sure it is plugged and and USB debugging is activated. Run the command bellow to see if flutter has detected your device:

```
$ flutter devices
```

Then run the following commands to clone, install and run the app.

```
$ git clone silverhairs/ios-notes-clone.git
$ cd ios-notes-clone/
$ flutter pub get
$ flutter run
```


## ⛏️ Built Using <a name = "built_using"></a>

- [Flutter](https://www.flutter.dev/) - Framework
- [Dart](https://dart.dev/) - Programming Language

---

## 📝 TODO

- [ ] search screen with suggestions
- [x] text editor
- [ ] upload images in a note
- [ ] lines and grids
- [ ] pin note
- [ ] save note locally
- [ ] save notes on the cloud
- [ ] share note on social media/sms
- [ ] lock a note/folder
- [x] save folder locally
- [x] delete saved folder
