open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain
(* Login Form Application
   Demonstrates: Entry, PasswordEntry, Button, Label with markup *)

(* close-request returns bool — not yet supported by signal generator *)
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

  let window_obj = Wrappers.Window.new_ () in
  let window = new Window.window window_obj in
  window#set_title (Some "Login Form");
  window#set_default_size 350 200;
  on_close_request window_obj (fun () -> GMain.quit ());

  (* Create vertical box for layout *)
  let vbox = new Box.box (Wrappers.Box.new_ `VERTICAL 15) in
  window#set_child (Some (vbox :> Widget.widget_t));

  (* Title *)
  let title_label =
    new Label.label (Wrappers.Label.new_ (Some "Please log in"))
  in
  title_label#set_markup "<big><b>Please log in</b></big>";
  vbox#append (title_label :> Widget.widget_t);

  (* Username field *)
  let username_box = new Box.box (Wrappers.Box.new_ `HORIZONTAL 10) in
  vbox#append (username_box :> Widget.widget_t);

  let username_label =
    new Label.label (Wrappers.Label.new_ (Some "Username:"))
  in
  username_box#append (username_label :> Widget.widget_t);

  let username_entry = new Entry.entry (Wrappers.Entry.new_ ()) in
  username_entry#set_placeholder_text (Some "Enter username");
  username_box#append (username_entry :> Widget.widget_t);

  (* Password field *)
  let password_box = new Box.box (Wrappers.Box.new_ `HORIZONTAL 10) in
  vbox#append (password_box :> Widget.widget_t);

  let password_label =
    new Label.label (Wrappers.Label.new_ (Some "Password:"))
  in
  password_box#append (password_label :> Widget.widget_t);

  let password_entry =
    new Password_entry.password_entry (Wrappers.Password_entry.new_ ())
  in
  password_entry#set_placeholder_text "Enter password";
  password_entry#set_show_peek_icon true;
  password_box#append (password_entry :> Widget.widget_t);

  (* Remember me checkbox *)
  let remember_check =
    new Check_button.check_button
      (Wrappers.Check_button.new_with_label (Some "Remember me"))
  in
  vbox#append (remember_check :> Widget.widget_t);

  (* Status label *)
  let status_label = new Label.label (Wrappers.Label.new_ None) in
  status_label#set_label "";
  vbox#append (status_label :> Widget.widget_t);

  (* Button row *)
  let button_box = new Box.box (Wrappers.Box.new_ `HORIZONTAL 10) in
  vbox#append (button_box :> Widget.widget_t);

  (* Login button *)
  let login_btn = new Button.button (Wrappers.Button.new_with_label "Login") in
  button_box#append (login_btn :> Widget.widget_t);

  ignore
    (login_btn#on_clicked ~callback:(fun () ->
         let username = username_entry#get_text () in
         let password = password_entry#get_text () in

         if username = "" || password = "" then
           status_label#set_label "Please fill in all fields"
         else if username = "admin" && password = "password" then begin
           status_label#set_markup
             "<span foreground='green'>Login successful!</span>";
           Printf.printf "Logged in as: %s (Remember me: %b)\n" username
             (remember_check#get_active ())
         end
         else
           status_label#set_markup
             "<span foreground='red'>Invalid credentials</span>"));

  (* Cancel button *)
  let cancel_btn =
    new Button.button (Wrappers.Button.new_with_label "Cancel")
  in
  button_box#append (cancel_btn :> Widget.widget_t);

  ignore
    (cancel_btn#on_clicked ~callback:(fun () ->
         username_entry#set_text "";
         password_entry#set_text "";
         status_label#set_label "";
         remember_check#set_active false));

  (* Show window and run main loop *)
  window#present ();
  GMain.main ()
