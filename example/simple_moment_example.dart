// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:simple_moment/simple_moment.dart';

main() {
  var secondsToAdd = new Duration(seconds: 10);
  var dateForComparison = new DateTime.now().add(secondsToAdd);
  var moment = new Moment.now();

  // should print "in a few seconds"
  print(moment.from(dateForComparison));

  Moment rawDate = Moment.parse("2020-07-03");
  // should print "2020-08-03 00:00:00.000
  print(rawDate.add(months: 1));

  // should print "2019-07-03 00:00:00.000
  print(rawDate.subtract(years: 1));

  //should print "03-07-2020 00:00"
  print(rawDate.format("dd-MM-yyyy HH:mm"));
}
