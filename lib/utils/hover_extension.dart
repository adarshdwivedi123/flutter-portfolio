import 'package:flutter/material.dart';

import 'package:flutterudemyportfolio/component/elevation_on_hover.dart';

// extension HoverExtension on Widget {
//   static final appContainer =
//       html.window.document.getElementById('app-container');
//   Widget get showCursorOnHover {
//     return MouseRegion(
//       child: this,
//       onHover: (_) => appContainer.style.cursor = 'pointer',
//       onExit: (_) => appContainer.style.cursor = 'defualt',
//     );
//   }
// }
extension HoverExtension on Widget {
  Widget get moveUpOnHover {
    //return ElevateOnHover(child: this);
    return ElevatorOnHover(child: this);
  }
}
