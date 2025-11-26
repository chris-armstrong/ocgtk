(* Settings Panel Application
   Demonstrates: CheckButton (including radio grouping), ToggleButton, SpinButton, Switch *)

let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window = GWindow.window ~title:"Settings Panel" ~width:400 ~height:400 () in

  (* Create vertical box for layout *)
  let vbox = GBox.vbox ~spacing:15 () in
  window#add (vbox :> GObj.widget);

  (* Section 1: Simple checkboxes *)
  let lbl1 = Label.new_ (Some "Preferences:") in
  vbox#append (GObj.widget_of_obj (lbl1));

  let email_obj = GtkCheckButton.new_with_label (Some "Enable email notifications") in
  let email_check = new GCheck_button.check_button email_obj in
  vbox#append (email_check);

  let sound_obj = GtkCheckButton.new_with_label (Some "Enable sounds") in
  GtkCheckButton.set_active sound_obj true;
  let sound_check = new GCheck_button.check_button sound_obj in
  vbox#append (sound_check);

  let auto_save_obj = GtkCheckButton.new_with_label (Some "Auto-save documents") in
  let auto_save = new GCheck_button.check_button auto_save_obj in
  vbox#append (auto_save);

  (* Section 2: Radio buttons using CheckButton grouping (GTK4 style) *)
  let lbl2 = Label.new_ (Some "\nTheme Selection:") in
  vbox#append (GObj.widget_of_obj (lbl2));

  let theme_light_obj = GtkCheckButton.new_with_label (Some "Light theme") in
  let theme_dark_obj = GtkCheckButton.new_with_label (Some "Dark theme") in
  let theme_auto_obj = GtkCheckButton.new_with_label (Some "Auto (system)") in
  GtkCheckButton.set_group theme_dark_obj (Some theme_light_obj);
  GtkCheckButton.set_group theme_auto_obj (Some theme_light_obj);
  let theme_light = new GCheck_button.check_button theme_light_obj in
  let theme_dark = new GCheck_button.check_button theme_dark_obj in
  let theme_auto = new GCheck_button.check_button theme_auto_obj in
  vbox#append (theme_light);
  vbox#append (theme_dark);
  vbox#append (theme_auto);
  GtkCheckButton.set_active theme_light_obj true;

  (* Section 3: Toggle button *)
  let lbl3 = Label.new_ (Some "\nAdvanced Mode:") in
  vbox#append (GObj.widget_of_obj (lbl3));

  let advanced_toggle_obj = GtkToggleButton.new_with_label "Advanced settings" in
  let advanced_toggle = new GToggle_button.toggle_button advanced_toggle_obj in
  vbox#append (advanced_toggle);

  (* Section 4: Spin button for numeric input *)
  let lbl4 = Label.new_ (Some "\nFont Size:") in
  vbox#append (GObj.widget_of_obj (lbl4));

  let font_spin = Spin_button.new_with_range 8.0 72.0 1.0 in
  Spin_button.set_value font_spin 12.0;
  Spin_button.set_digits font_spin 0;
  vbox#append (GObj.widget_of_obj (font_spin));

  (* Apply button to show current settings *)
  let apply_btn = new GButton.button (GtkButton.new_with_label "Show Current Settings") in
  vbox#append apply_btn#widget;

  ignore (apply_btn#connect#clicked ~callback:(fun () ->
    let settings = Printf.sprintf
      "Settings:\n\
       - Email notifications: %b\n\
       - Sounds: %b\n\
       - Auto-save: %b\n\
       - Theme: %s\n\
       - Advanced mode: %b\n\
       - Font size: %.0f"
      (GtkCheckButton.get_active email_obj)
      (GtkCheckButton.get_active sound_obj)
      (GtkCheckButton.get_active auto_save_obj)
      (if GtkCheckButton.get_active theme_light_obj then "Light"
       else if GtkCheckButton.get_active theme_dark_obj then "Dark"
       else "Auto")
      (GtkToggleButton.get_active advanced_toggle_obj)
      (Spin_button.get_value font_spin)
    in
    print_endline settings
  ));

  (* Show window and run main loop *)
  window#show;
  GMain.main ()
