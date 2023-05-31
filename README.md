# rsis

RSIS - Reverse Swap Index Shifting (Cipher Algorithm)

## Introduction

Package to perform the RSIS Cipher Technique. This algorithm was created by Gautham Vijayaraj

It's a basic implementation of the algorithm in the Dart language of the following API. To know more about this algorithm, Visit here [cryptify](https://github.com/gauthiii/cryptify). This app explains the working of the algorithm.

You can encrypt and decrypt texts using this algorithm.

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


