library rsis;

class Rsis {
  static String encrypt({required String text}) {
    if (text.isEmpty)
      return "Blank Entry!";
    else {
      int fl, hl, fl1, fl2, hl1, hl2;
      var str = text;
      var str1, str2, str3;

      fl = str.length;
      hl = fl ~/ 2;

      str1 = str.substring(0, hl);
      if (fl % 2 == 0)
        str2 = str.substring(hl, fl);
      else {
        str2 = str.substring(hl + 1, fl);
        str3 = str.substring(hl, hl + 1);
      }

      var str4, str5, str6;
      fl1 = str1.length;
      hl1 = fl1 ~/ 2;

      str4 = str1.substring(0, hl1);
      if (fl1 % 2 == 0)
        str5 = str1.substring(hl1, fl1);
      else {
        str5 = str1.substring(hl1 + 1, fl1);
        str6 = str1.substring(hl1, hl1 + 1);
      }

      var str7, str8, str9;
      fl2 = str2.length;
      hl2 = fl1 ~/ 2;

      str7 = str2.substring(0, hl2);
      if (fl2 % 2 == 0)
        str8 = str2.substring(hl2, fl2);
      else {
        str8 = str2.substring(hl2 + 1, fl2);
        str9 = str2.substring(hl2, hl2 + 1);
      }

      if (fl1 % 2 == 0)
        str1 = str5.split('').reversed.join() + str4;
      else
        str1 = str5.split('').reversed.join() + str6 + str4;

      if (fl2 % 2 == 0)
        str2 = str8.split('').reversed.join() + str7;
      else
        str2 = str8.split('').reversed.join() + str9 + str7;

      if (fl % 2 == 0)
        str = str2 + str1;
      else
        str = str2 + str3 + str1;

      var enc = "";
      var key = "";

      for (int i = 0; i < fl; i++) {
        num d, e, s = 0;
        d = str.codeUnitAt(i);

        while (d > 0) {
          e = d % 10;
          s += e;
          d = d ~/ 10;
        }
        key += s.toString() + "-";
        var x;
        x = str.codeUnitAt(i) + ((i + 1) * s);
        x = x % 94;
        x = x + 32;

        enc += String.fromCharCode(x);
      }

      key = key.substring(0, (key.length - 1));
      /*
//enc=enc+"\n\nKEY:\n\n"+key;

      var k2 = key.split("-");

       var en = "";
      int l1 = 0;
      int l2 = 0;

      for (var i = 0; i < (enc.length + k2.length); i++) {
        if (i % 2 == 0) {
          en += enc[l1];
          l1 += 1;
        } else {
          en += k2[l2];
          l2 += 1;
        }
      }
      */

      return enc + "(0)" + key;
    }
  }

  static String decrypt({required String text}) {
    var dec = "";
    if (text.isEmpty)
      dec = "Blank Entry!";
    else if (!text.contains("(0)"))
      dec = "Incorrect Entry!";
    else {
      var str = text.split("(0)")[0];
      var key = text.split("(0)")[1];
      int k, pos;

      key += "-";

      int r = 0;

      for (int b = 0; b < key.length; b++) if (key[b] == '-') r++;

      if (str.length == 0 ||
          key.length == 0 ||
          (str.length == 0 && key.length == 0))
        dec = "Blank Entry!";
      else if (str.length != r)
        dec = "Incorrect Entry!";
      else {
        pos = 0;
        for (int i = 0; i < str.length; i++) {
          var d;
          d = str.codeUnitAt(i);
          d = d - 32;
          var kc = "";
          for (k = pos; k < key.length; k++) {
            int x = key.codeUnitAt(k);
            if (key[k] != '-')
              kc += String.fromCharCode(x);
            else
              break;
          }
          pos = k + 1;

          int y = int.parse(kc);
          d = d - ((i + 1) * y);
          d = d % 94;

          if (d < 32) d += 94;

          dec += String.fromCharCode(d);
        }

        int fl, hl, fl1, fl2, hl1, hl2;
        var str1, str2, str3;

        fl = dec.length;
        hl = fl ~/ 2;

        str1 = dec.substring(0, hl);
        if (fl % 2 == 0)
          str2 = dec.substring(hl, fl);
        else {
          str2 = dec.substring(hl + 1, fl);
          str3 = dec.substring(hl, hl + 1);
        }

        var str4, str5, str6;
        fl1 = str1.length;
        hl1 = fl1 ~/ 2;

        str4 = str1.substring(0, hl1);
        if (fl1 % 2 == 0)
          str5 = str1.substring(hl1, fl1);
        else {
          str5 = str1.substring(hl1 + 1, fl1);
          str6 = str1.substring(hl1, hl1 + 1);
        }

        var str7, str8, str9;
        fl2 = str2.length;
        hl2 = fl1 ~/ 2;

        str7 = str2.substring(0, hl2);
        if (fl2 % 2 == 0)
          str8 = str2.substring(hl2, fl2);
        else {
          str8 = str2.substring(hl2 + 1, fl2);
          str9 = str2.substring(hl2, hl2 + 1);
        }

        if (fl1 % 2 == 0)
          str1 = str5 + str4.split('').reversed.join();
        else
          str1 = str5 + str6 + str4.split('').reversed.join();

        if (fl2 % 2 == 0)
          str2 = str8 + str7.split('').reversed.join();
        else
          str2 = str8 + str9 + str7.split('').reversed.join();

        if (fl % 2 == 0)
          dec = str2 + str1;
        else
          dec = str2 + str3 + str1;
      }
    }

    return dec;
  }
}
