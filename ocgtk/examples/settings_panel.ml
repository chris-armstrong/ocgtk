open Ocgtk_gtk
(* Settings Panel Application
   Demonstrates: CheckButton (including radio grouping), ToggleButton, SpinButton, Switch *)

let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window_obj = Application_and__window_and__window_group.Window.new_ () in
  let window = new GApplication_and__window_and__window_group.window window_obj in
  window#set_title (Some "Settings Panel");
  window#set_default_size 400 400;

  (* Create vertical box for layout *)
  let vbox_obj = Box.new_ `VERTICAL 15 in
  let vbox = new GBox.box vbox_obj in
  window#set_child (Some (vbox :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget));

  (* Section 1: Simple checkboxes *)
  let lbl1_obj = Label.new_ (Some "Preferences:") in
  let lbl1_widget = Label.as_widget lbl1_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget lbl1_widget);

  let email_obj = Check_button.new_with_label (Some "Enable email notifications") in
  let email_widget = Check_button.as_widget email_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget email_widget);

  let sound_obj = Check_button.new_with_label (Some "Enable sounds") in
  Check_button.set_active sound_obj true;
  let sound_widget = Check_button.as_widget sound_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget sound_widget);

  let auto_save_obj = Check_button.new_with_label (Some "Auto-save documents") in
  let auto_save_widget = Check_button.as_widget auto_save_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget auto_save_widget);

  (* Section 2: Radio buttons using CheckButton grouping (GTK4 style) *)
  let lbl2_obj = Label.new_ (Some "\nTheme Selection:") in
  let lbl2_widget = Label.as_widget lbl2_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget lbl2_widget);

  let theme_light_obj = Check_button.new_with_label (Some "Light theme") in
  let theme_dark_obj = Check_button.new_with_label (Some "Dark theme") in
  let theme_auto_obj = Check_button.new_with_label (Some "Auto (system)") in
  Check_button.set_group theme_dark_obj (Some theme_light_obj);
  Check_button.set_group theme_auto_obj (Some theme_light_obj);
  let theme_light_widget = Check_button.as_widget theme_light_obj in
  let theme_dark_widget = Check_button.as_widget theme_dark_obj in
  let theme_auto_widget = Check_button.as_widget theme_auto_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget theme_light_widget);
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget theme_dark_widget);
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget theme_auto_widget);
  Check_button.set_active theme_light_obj true;

  (* Section 3: Toggle button *)
  let lbl3_obj = Label.new_ (Some "\nAdvanced Mode:") in
  let lbl3_widget = Label.as_widget lbl3_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget lbl3_widget);

  let advanced_toggle_obj = Toggle_button.new_with_label "Advanced settings" in
  let advanced_toggle_widget = Toggle_button.as_widget advanced_toggle_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget advanced_toggle_widget);

  (* Section 4: Spin button for numeric input *)
  let lbl4_obj = Label.new_ (Some "\nFont Size:") in
  let lbl4_widget = Label.as_widget lbl4_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget lbl4_widget);

  let font_spin_obj = Spin_button.new_with_range 8.0 72.0 1.0 in
  Spin_button.set_value font_spin_obj 12.0;
  Spin_button.set_digits font_spin_obj 0;
  let font_spin_widget = Spin_button.as_widget font_spin_obj in
  vbox#append (new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget font_spin_widget);

  (* Apply button to show current settings *)
  let apply_btn_obj = Button.new_with_label "Show Current Settings" in
  let apply_btn = new GButton.button apply_btn_obj in
  vbox#append (apply_btn :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget);

  ignore (apply_btn#on_clicked ~callback:(fun () ->
    let settings = Printf.sprintf
      "Settings:\n\
       - Email notifications: %b\n\
       - Sounds: %b\n\
       - Auto-save: %b\n\
       - Theme: %s\n\
       - Advanced mode: %b\n\
       - Font size: %.0f"
      (Check_button.get_active email_obj)
      (Check_button.get_active sound_obj)
      (Check_button.get_active auto_save_obj)
      (if Check_button.get_active theme_light_obj then "Light"
       else if Check_button.get_active theme_dark_obj then "Dark"
       else "Auto")
      (Toggle_button.get_active advanced_toggle_obj)
      (Spin_button.get_value font_spin_obj)
    in
    print_endline settings
  ));

  (* Show window and run main loop *)
  window#present ();
  GMain.main ()
