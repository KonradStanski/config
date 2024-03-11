// /Users/konrad/.config/phoenix/index.ts
var toggleFocus = function(appName) {
  let app = App.get(appName);
  if (app) {
    if (app.isActive()) {
      app.hide();
      return;
    }
    let window = app.mainWindow();
    let space = Space.active();
    if (space && window) {
      space.moveWindows([window]);
    }
    app.focus();
  } else {
    App.launch(appName, { focus: true });
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
