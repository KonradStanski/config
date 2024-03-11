// sudo log stream --process Phoenix
Phoenix.set({
  openAtLogin: true,
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

function toggleFocus(appName: string): App | undefined {
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
}
