const effect = {
  init: function () {
    // This function is called when the effect is initialized.
  },

  uninit: function () {
    // This function is called when the effect is unloaded.
  },

  paint: function (win, mask) {
    const surface = effects.windowGeometry(win).translated(-win.x, -win.y);

    const paint = new QPainter(surface);
    paint.fillRect(surface.rect, new QColor(255, 0, 0, 100));
    paint.end();
  },
};

effect;
