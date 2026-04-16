open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain
(* Settings Panel Application
   Demonstrates: CheckButton (including radio grouping), ToggleButton, SpinButton *)

let on_close_request window_obj callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        callback ();
        Gobject.Value.set_boolean (Gobject.Closure.result argv) false)
  in
  ignore
    (Gobject.Signal.connect window_obj ~name:"close-request" ~callback:closure
       ~after:false)

let () =
  ignore (GMain.init ());

  (* Create main window *)
  let window_obj = Wrappers.Window.new_ () in
  let window = new Window.window window_obj in
  window#set_title (Some "Settings Panel");
  window#set_default_size 400 400;
  on_close_request window_obj (fun () -> GMain.quit ());

  (* Create vertical box for layout *)
  let vbox = new Box.box (Wrappers.Box.new_ `VERTICAL 15) in
  window#set_child (Some (vbox :> Widget.widget_t));

  (* Section 1: Simple checkboxes *)
  let lbl1 = new Label.label (Wrappers.Label.new_ (Some "Preferences:")) in
  vbox#append (lbl1 :> Widget.widget_t);

  let email_check =
    new Check_button.check_button
      (Wrappers.Check_button.new_with_label (Some "Enable email notifications"))
  in
  vbox#append (email_check :> Widget.widget_t);

  let sound_check =
    new Check_button.check_button
      (Wrappers.Check_button.new_with_label (Some "Enable sounds"))
  in
  sound_check#set_active true;
  vbox#append (sound_check :> Widget.widget_t);

  let auto_save_check =
    new Check_button.check_button
      (Wrappers.Check_button.new_with_label (Some "Auto-save documents"))
  in
  vbox#append (auto_save_check :> Widget.widget_t);

  (* Section 2: Radio buttons using CheckButton grouping (GTK4 style) *)
  let lbl2 =
    new Label.label (Wrappers.Label.new_ (Some "\nTheme Selection:"))
  in
  vbox#append (lbl2 :> Widget.widget_t);

  let theme_light_obj =
    Wrappers.Check_button.new_with_label (Some "Light theme")
  in
  let theme_dark_obj =
    Wrappers.Check_button.new_with_label (Some "Dark theme")
  in
  let theme_auto_obj =
    Wrappers.Check_button.new_with_label (Some "Auto (system)")
  in
  Wrappers.Check_button.set_group theme_dark_obj (Some theme_light_obj);
  Wrappers.Check_button.set_group theme_auto_obj (Some theme_light_obj);
  let theme_light = new Check_button.check_button theme_light_obj in
  let theme_dark = new Check_button.check_button theme_dark_obj in
  let theme_auto = new Check_button.check_button theme_auto_obj in
  vbox#append (theme_light :> Widget.widget_t);
  vbox#append (theme_dark :> Widget.widget_t);
  vbox#append (theme_auto :> Widget.widget_t);
  theme_light#set_active true;

  (* Section 3: Toggle button *)
  let lbl3 = new Label.label (Wrappers.Label.new_ (Some "\nAdvanced Mode:")) in
  vbox#append (lbl3 :> Widget.widget_t);

  let advanced_toggle =
    new Toggle_button.toggle_button
      (Wrappers.Toggle_button.new_with_label "Advanced settings")
  in
  vbox#append (advanced_toggle :> Widget.widget_t);

  (* Section 4: Spin button for numeric input *)
  let lbl4 = new Label.label (Wrappers.Label.new_ (Some "\nFont Size:")) in
  vbox#append (lbl4 :> Widget.widget_t);

  let font_spin =
    new Spin_button.spin_button
      (Wrappers.Spin_button.new_with_range 8.0 72.0 1.0)
  in
  font_spin#set_value 12.0;
  font_spin#set_digits 0;
  vbox#append (font_spin :> Widget.widget_t);

  (* Apply button to show current settings *)
  let apply_btn =
    new Button.button (Wrappers.Button.new_with_label "Show Current Settings")
  in
  vbox#append (apply_btn :> Widget.widget_t);

  ignore
    (apply_btn#on_clicked ~callback:(fun () ->
         let settings =
           Printf.sprintf
             "Settings:\n\
              - Email notifications: %b\n\
              - Sounds: %b\n\
              - Auto-save: %b\n\
              - Theme: %s\n\
              - Advanced mode: %b\n\
              - Font size: %.0f"
             (email_check#get_active ())
             (sound_check#get_active ())
             (auto_save_check#get_active ())
             (if theme_light#get_active () then "Light"
              else if theme_dark#get_active () then "Dark"
              else "Auto")
             (advanced_toggle#get_active ())
             (font_spin#get_value ())
         in
         print_endline settings));

  (* Show window and run main loop *)
  window#present ();
  GMain.main ()
