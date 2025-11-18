(* Login Form Application
   Demonstrates: Entry, PasswordEntry, Button, Label *)

let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window = GWindow.window ~title:"Login Form" ~width:350 ~height:200 () in

  (* Create vertical box for layout *)
  let vbox = GBox.vbox ~spacing:15 () in
  window#add (vbox :> GObj.widget);

  (* Title *)
  let title_label = GtkLabel.new_with_label (Some "Please log in") in
  GtkLabel.set_markup title_label "<big><b>Please log in</b></big>";
  vbox#append (GObj.widget_of_obj title_label);

  (* Username field *)
  let username_box = GBox.hbox ~spacing:10 () in
  vbox#append (username_box :> GObj.widget);

  let username_label = GtkLabel.new_with_label (Some "Username:") in
  username_box#append (GObj.widget_of_obj username_label);

  let username_entry = GtkEntry.new_ () in
  GtkEntry.set_placeholder_text username_entry (Some "Enter username");
  username_box#append (GObj.widget_of_obj username_entry);

  (* Password field *)
  let password_box = GBox.hbox ~spacing:10 () in
  vbox#append (password_box :> GObj.widget);

  let password_label = GtkLabel.new_with_label (Some "Password:") in
  password_box#append (GObj.widget_of_obj password_label);

  let password_entry = GtkPasswordEntry.new_ () in
  GtkPasswordEntry.set_placeholder_text password_entry (Some "Enter password");
  GtkPasswordEntry.set_show_peek_icon password_entry true;
  password_box#append (GObj.widget_of_obj password_entry);

  (* Remember me checkbox *)
  let remember_check = GButton.check_button ~label:"Remember me" () in
  vbox#append (remember_check :> GObj.widget);

  (* Status label *)
  let status_label = GtkLabel.new_ () in
  GtkLabel.set_label status_label "";
  vbox#append (GObj.widget_of_obj status_label);

  (* Button row *)
  let button_box = GBox.hbox ~spacing:10 () in
  vbox#append (button_box :> GObj.widget);

  (* Login button *)
  let login_btn = GButton.button ~label:"Login" () in
  button_box#append (login_btn :> GObj.widget);

  ignore (login_btn#connect#clicked ~callback:(fun () ->
    let username = GtkEntry.get_text username_entry in
    let password = GtkPasswordEntry.get_text password_entry in

    if username = "" || password = "" then
      GtkLabel.set_label status_label "Please fill in all fields"
    else if username = "admin" && password = "password" then begin
      GtkLabel.set_markup status_label "<span foreground='green'>✓ Login successful!</span>";
      print_endline (Printf.sprintf "Logged in as: %s (Remember me: %b)"
        username remember_check#active)
    end else
      GtkLabel.set_markup status_label "<span foreground='red'>✗ Invalid credentials</span>"
  ));

  (* Cancel button *)
  let cancel_btn = GButton.button ~label:"Cancel" () in
  button_box#append (cancel_btn :> GObj.widget);

  ignore (cancel_btn#connect#clicked ~callback:(fun () ->
    GtkEntry.set_text username_entry "";
    GtkPasswordEntry.set_text password_entry "";
    GtkLabel.set_label status_label "";
    remember_check#set_active false
  ));

  (* Show window and run main loop *)
  window#show;
  GMain.main ()
