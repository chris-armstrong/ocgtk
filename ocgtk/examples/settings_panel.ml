open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain
(* Settings Panel Application
   Demonstrates: CheckButton (including radio grouping), ToggleButton, SpinButton *)

let () =
  ignore (GMain.init ());

  (* Create main window *)
  let window = new window (Wrappers.Window.new_ ()) in
  window#set_title (Some "Settings Panel");
  window#set_default_size 400 400;

  (* Create vertical box for layout *)
  let vbox = new box (Wrappers.Box.new_ `VERTICAL 15) in
  window#set_child (Some (vbox :> widget));

  (* Section 1: Simple checkboxes *)
  let lbl1 = new label (Wrappers.Label.new_ (Some "Preferences:")) in
  vbox#append (lbl1 :> widget);

  let email_check = new check_button (Wrappers.Check_button.new_with_label (Some "Enable email notifications")) in
  vbox#append (email_check :> widget);

  let sound_check = new check_button (Wrappers.Check_button.new_with_label (Some "Enable sounds")) in
  sound_check#set_active true;
  vbox#append (sound_check :> widget);

  let auto_save_check = new check_button (Wrappers.Check_button.new_with_label (Some "Auto-save documents")) in
  vbox#append (auto_save_check :> widget);

  (* Section 2: Radio buttons using CheckButton grouping (GTK4 style) *)
  let lbl2 = new label (Wrappers.Label.new_ (Some "\nTheme Selection:")) in
  vbox#append (lbl2 :> widget);

  let theme_light_obj = Wrappers.Check_button.new_with_label (Some "Light theme") in
  let theme_dark_obj = Wrappers.Check_button.new_with_label (Some "Dark theme") in
  let theme_auto_obj = Wrappers.Check_button.new_with_label (Some "Auto (system)") in
  Wrappers.Check_button.set_group theme_dark_obj (Some theme_light_obj);
  Wrappers.Check_button.set_group theme_auto_obj (Some theme_light_obj);
  let theme_light = new check_button theme_light_obj in
  let theme_dark = new check_button theme_dark_obj in
  let theme_auto = new check_button theme_auto_obj in
  vbox#append (theme_light :> widget);
  vbox#append (theme_dark :> widget);
  vbox#append (theme_auto :> widget);
  theme_light#set_active true;

  (* Section 3: Toggle button *)
  let lbl3 = new label (Wrappers.Label.new_ (Some "\nAdvanced Mode:")) in
  vbox#append (lbl3 :> widget);

  let advanced_toggle = new toggle_button (Wrappers.Toggle_button.new_with_label "Advanced settings") in
  vbox#append (advanced_toggle :> widget);

  (* Section 4: Spin button for numeric input *)
  let lbl4 = new label (Wrappers.Label.new_ (Some "\nFont Size:")) in
  vbox#append (lbl4 :> widget);

  let font_spin = new spin_button (Wrappers.Spin_button.new_with_range 8.0 72.0 1.0) in
  font_spin#set_value 12.0;
  font_spin#set_digits 0;
  vbox#append (font_spin :> widget);

  (* Apply button to show current settings *)
  let apply_btn = new button (Wrappers.Button.new_with_label "Show Current Settings") in
  vbox#append (apply_btn :> widget);

  ignore (apply_btn#on_clicked ~callback:(fun () ->
    let settings = Printf.sprintf
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
    print_endline settings
  ));

  (* Show window and run main loop *)
  window#present ();
  GMain.main ()
