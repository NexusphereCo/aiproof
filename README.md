<img src="assets/imgs/app_logo/500x500.png" width="50" height="50">

# **aiprof: Fostering Content Authenticity with a Single Scan.**

A mobile app that leverages AI to quickly detect and expose AI-generated text in any written content with just a simple scan. It empowers users to authenticate documents, uphold academic integrity, and protect intellectual property by verifying content originality and ensuring human authorship, all through a convenient mobile scanning experience.

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![SQFlite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)

## **Development** 👨‍💻

### Prerequisites

- Dart
- Flutter
- SQFlite

## **How to clone and run this project** 👨‍👨‍👦‍👦

1. Clone the project.

```bash
git clone https://github.com/NexusphereCo/aiproof.git
cd aiproof
dart pub get
```

2. Setup/Initialize project to firebase.

```bash
npm install -g firebase-tools
dart pub global activate flutterfire_cli
flutterfire configure --project=ebayan-nexusphere
```

3. Run the program.

```bash
flutter run
```


## **Miscellaneous** 🤷‍♂️

**Dart fix**

Run this command if there's any fixes that needs to be done if VSCode prompts the message

```bash
dart fix --apply
```

**How to clean flutter**

Run this command if there are build errors found in development. This refreshes the entire dependencies.

```
flutter clean
flutter pub get
```

**Running in Release Mode**

Run this command if you want to run flutter on release mode without the overhead of debugging lag.

```
flutter run --release
```

## License 📋

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributors 👊

We greatly appreciate contributions to this project. Special thanks to the following contributors for their valuable input and efforts:

- [Gene Bitara](https://github.com/genebit)
- [Miguel Garcera](https://github.com/MD-Garcera)
