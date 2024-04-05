// /Users/konrad/.config/phoenix/index.ts
var moveFocusedWindowToSpace = function(spaceIndex) {
  let window = Window.focused();
  if (window) {
    let spaces = Space.all();
    let space = spaces.find((space2) => space2.hash() === spaceIndex);
    if (space) {
      space.moveWindows([window]);
    }
  }
};
var toggleFocus = function(appName) {
  let app = App.get(appName);
  if (app) {
    if (app.isActive()) {
      app.hide();
      return app;
    }
    let window = app.mainWindow();
    let space = Space.active();
    if (space && window) {
      space.moveWindows([window]);
    }
    app.focus();
  } else {
    return App.launch(appName, { focus: true });
  }
};
Phoenix.set({
  openAtLogin: true
});
Phoenix.log("#################################CONFIG RELOADED#################################");
Key.on("o", ["ctrl", "cmd"], () => {
  toggleFocus("Obsidian");
});
Key.on("c", ["ctrl", "cmd"], () => {
  toggleFocus("Google Chat");
});
Key.on("k", ["ctrl", "cmd"], () => {
  toggleFocus("kitty");
});
Key.on("1", ["shift", "cmd"], () => {
  moveFocusedWindowToSpace(1);
});
Key.on("2", ["shift", "cmd"], () => {
  moveFocusedWindowToSpace(2);
});
Key.on("3", ["shift", "cmd"], () => {
  moveFocusedWindowToSpace(3);
});
Key.on("4", ["shift", "cmd"], () => {
  moveFocusedWindowToSpace(4);
});
Key.on("5", ["shift", "cmd"], () => {
  moveFocusedWindowToSpace(5);
});
Key.on("6", ["shift", "cmd"], () => {
  moveFocusedWindowToSpace(6);
});
