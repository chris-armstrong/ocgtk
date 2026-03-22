open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain
(* Login Form Application
   Demonstrates: Entry, PasswordEntry, Button, Label with markup *)

(* PasswordEntry and Entry implement GtkEditable but our L1 types don't model
   interface implementation yet, so we use Obj.magic for Editable text access *)
let editable_get_text obj = Wrappers.Editable.get_text (Obj.magic obj)
let editable_set_text obj text = Wrappers.Editable.set_text (Obj.magic obj) text

let () =
  ignore (GMain.init ());

  let window = new window (Wrappers.Window.new_ ()) in
  window#set_title (Some "Login Form");
  window#set_default_size 350 200;

  (* Create vertical box for layout *)
  let vbox = new box (Wrappers.Box.new_ `VERTICAL 15) in
  window#set_child (Some (vbox :> widget));

  (* Title *)
  let title_label = new label (Wrappers.Label.new_ (Some "Please log in")) in
  title_label#set_markup "<big><b>Please log in</b></big>";
  vbox#append (title_label :> widget);

  (* Username field *)
  let username_box = new box (Wrappers.Box.new_ `HORIZONTAL 10) in
  vbox#append (username_box :> widget);

  let username_label = new label (Wrappers.Label.new_ (Some "Username:")) in
  username_box#append (username_label :> widget);

  let username_entry_obj = Wrappers.Entry.new_ () in
  let username_entry = new entry username_entry_obj in
  username_entry#set_placeholder_text (Some "Enter username");
  username_box#append (username_entry :> widget);

  (* Password field *)
  let password_box = new box (Wrappers.Box.new_ `HORIZONTAL 10) in
  vbox#append (password_box :> widget);

  let password_label = new label (Wrappers.Label.new_ (Some "Password:")) in
  password_box#append (password_label :> widget);

  let password_entry_obj = Wrappers.Password_entry.new_ () in
  let password_entry = new password_entry password_entry_obj in
  password_entry#set_placeholder_text "Enter password";
  password_entry#set_show_peek_icon true;
  password_box#append (password_entry :> widget);

  (* Remember me checkbox *)
  let remember_check = new check_button (Wrappers.Check_button.new_with_label (Some "Remember me")) in
  vbox#append (remember_check :> widget);

  (* Status label *)
  let status_label = new label (Wrappers.Label.new_ None) in
  status_label#set_label "";
  vbox#append (status_label :> widget);

  (* Button row *)
  let button_box = new box (Wrappers.Box.new_ `HORIZONTAL 10) in
  vbox#append (button_box :> widget);

  (* Login button *)
  let login_btn = new button (Wrappers.Button.new_with_label "Login") in
  button_box#append (login_btn :> widget);

  ignore (login_btn#on_clicked ~callback:(fun () ->
    let username = editable_get_text username_entry_obj in
    let password = editable_get_text password_entry_obj in

    if username = "" || password = "" then
      status_label#set_label "Please fill in all fields"
    else if username = "admin" && password = "password" then begin
      status_label#set_markup "<span foreground='green'>Login successful!</span>";
      Printf.printf "Logged in as: %s (Remember me: %b)\n"
        username (remember_check#get_active ())
    end else
      status_label#set_markup "<span foreground='red'>Invalid credentials</span>"
  ));

  (* Cancel button *)
  let cancel_btn = new button (Wrappers.Button.new_with_label "Cancel") in
  button_box#append (cancel_btn :> widget);

  ignore (cancel_btn#on_clicked ~callback:(fun () ->
    editable_set_text username_entry_obj "";
    editable_set_text password_entry_obj "";
    status_label#set_label "";
    remember_check#set_active false
  ));

  (* Show window and run main loop *)
  window#present ();
  GMain.main ()
