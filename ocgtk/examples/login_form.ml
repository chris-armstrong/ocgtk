open Ocgtk_gtk
(* Login Form Application
   Demonstrates: Entry, PasswordEntry, Button, Label *)
class window_class = GApplication_and__window_and__window_group.window

  (* Create main window *)
let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  let module Window = Application_and__window_and__window_group.Window in
   
  let window = new window_class (Window.new_ ()) in
  window#set_title (Some "Login Form");
  window#set_default_size 350 200;

  (* Create vertical box for layout *)
  let vbox = new GBox.box (Box.new_ Gtk_enums.(`VERTICAL) 15) in
  window#set_child (Some vbox);

  (* Title *)
  let title_label = Label.new_ (Some "Please log in") in
  Label.set_markup title_label "<big><b>Please log in</b></big>";
  vbox#append (new GLabel.label (title_label));

  (* Username field *)
  let username_box = new GBox.box (Box.new_ `HORIZONTAL 10) in
  vbox#append (username_box );

  let username_label = new GLabel.label (Label.new_ (Some "Username:")) in
  username_box#append username_label;

  let username_entry = new GEntry.entry (Entry.new_ ()) in
  username_entry#set_placeholder_text (Some "Enter username");
  username_box#append username_entry;

  (* Password field *)
  let password_box = new GBox.box (Box.new_ `HORIZONTAL 10) in
  
  vbox#append (password_box );

  let password_label = new GLabel.label (Label.new_ (Some "Password:")) in
  password_box#append ( (password_label));

  let password_entry = new GPassword_entry.password_entry (Password_entry.new_ ()) in
  password_entry#set_placeholder_text (Some "Enter password")
  Entry.set_placeholder_text (password_entry) (Some "Enter password");
  Password_entry.set_show_peek_icon password_entry true;
  password_box#append (GObj.widget_of_obj (password_entry));

  (* Remember me checkbox *)
  let remember_obj = GtkCheckButton.new_with_label (Some "Remember me") in
  let remember_check = new GCheck_button.check_button remember_obj in
  vbox#append (remember_check#widget);

  (* Status label *)
  let status_label = Label.new_ None in
  Label.set_label status_label "";
  vbox#append (GObj.widget_of_obj (status_label));

  (* Button row *)
  let button_box = new GBox.box (Box.new_ `HORIZONTAL 10) in
  vbox#append (button_box :> GObj.widget);

  (* Login button *)
  let login_btn = new GButton.button (GtkButton.new_with_label "Login") in
  button_box#append (login_btn#widget);

  ignore (login_btn#connect#clicked ~callback:(fun () ->
    let username = Editable.get_text (Entry.as_widget username_entry) in
    let password = Editable.get_text (Password_entry.as_widget password_entry) in

    if username = "" || password = "" then
      Label.set_label status_label "Please fill in all fields"
    else if username = "admin" && password = "password" then begin
      Label.set_markup status_label "<span foreground='green'>✓ Login successful!</span>";
      print_endline (Printf.sprintf "Logged in as: %s (Remember me: %b)"
        username (GtkCheckButton.get_active remember_obj))
    end else
      Label.set_markup status_label "<span foreground='red'>✗ Invalid credentials</span>"
  ));

  (* Cancel button *)
  let cancel_btn = new GButton.button (GtkButton.new_with_label "Cancel") in
  button_box#append (cancel_btn#widget);

  ignore (cancel_btn#connect#clicked ~callback:(fun () ->
    Editable.set_text (username_entry |> Entry.as_widget) "";
    Editable.set_text (password_entry|> Password_entry.as_widget) "";
    Label.set_label status_label "";
    GtkCheckButton.set_active remember_obj false
  ));

  (* Show window and run main loop *)
  window#show;
  GMain.main ()
