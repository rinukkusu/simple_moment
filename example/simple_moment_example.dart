// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:simple_moment/simple_moment.dart';

main() {
  var secondsToAdd = new Duration(seconds: 10);
  var dateForComparison = new DateTime.now().add(secondsToAdd);
  var moment = new Moment.now();

  // should print "in a few seconds"
  print(moment.from(dateForComparison));
}
