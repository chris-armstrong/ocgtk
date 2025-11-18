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

  let email_check = GButton.check_button ~label:"Enable email notifications" () in
  vbox#append (email_check :> GObj.widget);

  let sound_check = GButton.check_button ~label:"Enable sounds" ~active:true () in
  vbox#append (sound_check :> GObj.widget);

  let auto_save = GButton.check_button ~label:"Auto-save documents" () in
  vbox#append (auto_save :> GObj.widget);

  (* Section 2: Radio buttons using CheckButton grouping (GTK4 style) *)
  let lbl2 = Label.new_ (Some "\nTheme Selection:") in
  vbox#append (GObj.widget_of_obj (lbl2));

  let theme_light = GButton.radio_button ~label:"Light theme" () in
  vbox#append (theme_light :> GObj.widget);

  let theme_dark = GButton.radio_button ~label:"Dark theme" ~group:theme_light () in
  vbox#append (theme_dark :> GObj.widget);

  let theme_auto = GButton.radio_button ~label:"Auto (system)" ~group:theme_light () in
  vbox#append (theme_auto :> GObj.widget);
  theme_light#set_active true;

  (* Section 3: Toggle button *)
  let lbl3 = Label.new_ (Some "\nAdvanced Mode:") in
  vbox#append (GObj.widget_of_obj (lbl3));

  let advanced_toggle = GButton.toggle_button ~label:"Advanced settings" () in
  vbox#append (advanced_toggle :> GObj.widget);

  (* Section 4: Spin button for numeric input *)
  let lbl4 = Label.new_ (Some "\nFont Size:") in
  vbox#append (GObj.widget_of_obj (lbl4));

  let font_spin = Spin_button.new_with_range 8.0 72.0 1.0 in
  Spin_button.set_value font_spin 12.0;
  Spin_button.set_digits font_spin 0;
  vbox#append (GObj.widget_of_obj (font_spin));

  (* Apply button to show current settings *)
  let apply_btn = GButton.button ~label:"Show Current Settings" () in
  vbox#append (apply_btn :> GObj.widget);

  ignore (apply_btn#connect#clicked ~callback:(fun () ->
    let settings = Printf.sprintf
      "Settings:\n\
       - Email notifications: %b\n\
       - Sounds: %b\n\
       - Auto-save: %b\n\
       - Theme: %s\n\
       - Advanced mode: %b\n\
       - Font size: %.0f"
      email_check#active
      sound_check#active
      auto_save#active
      (if theme_light#active then "Light"
       else if theme_dark#active then "Dark"
       else "Auto")
      advanced_toggle#active
      (Spin_button.get_value font_spin)
    in
    print_endline settings
  ));

  (* Show window and run main loop *)
  window#show;
  GMain.main ()
