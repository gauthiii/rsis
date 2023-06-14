# rsis

RSIS - Reverse Swap Index Shifting (Cipher Algorithm)

## Introduction

Package to perform the RSIS Cipher Technique. This algorithm was created by Gautham Vijayaraj

It's a basic implementation of the algorithm in the Dart language of the following API. To know more about this algorithm, Visit here [cryptify](https://github.com/gauthiii/cryptify). This app explains the working of the algorithm.

You can encrypt and decrypt texts using this algorithm.

<p>
<img src="https://github.com/gauthiii/rsis/assets/35861219/fba7d6f5-579d-46b6-84d9-2763303f7116" height="400">
  <img src="https://github.com/gauthiii/rsis/assets/35861219/1128f200-8879-438f-a5dd-272f9b457e0f" height="400">
  <img src="https://github.com/gauthiii/rsis/assets/35861219/85a1afe5-9d7e-4ebd-aafa-94890b0b761d" height="400">
<br>
</p>

## Installation

```yaml
dependecies:
  rsis: 0.0.5
```

## Example

See `example/main.dart`

```dart
import 'package:rsis/rsis.dart';

void main() {

    String text="Hello this a test!";

    String enc = Rsis.encrypt(text:text);

    print(enc); // prints : GFJ/^_cEmga8#[3Gir(0)6-8-7-2-8-7-5-16-5-6-5-8-5-3-9-2-9-9

    String dec = Rsis.decrypt(text:enc);

    print(dec); // prints : Hello this a test!
}
```


