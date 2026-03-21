open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain
(* Simple Counter Application
   Demonstrates: Button, Label, event handling *)

let _ =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window_obj = Wrappers.Window.new_ () in
  let window = new window window_obj in
  window#set_title (Some "Counter App");
  window#set_default_size 300 100;

  (* ignore (window#on_unmap ~callback:(fun () -> GMain.quit ())); *)

  (* Create vertical box for layout *)
  let vbox_obj = Wrappers.Box.new_ `VERTICAL 10 in
  let vbox = new box vbox_obj in
  window#set_child (Some (new widget (Obj.magic vbox#as_box)));

  (* Counter state *)
  let count = ref 0 in

  (* Create label to display count *)
  let label_obj = Wrappers.Label.new_ (Some (Printf.sprintf "Count: %d" !count)) in
  vbox#append (new widget (Obj.magic label_obj));

  (* Create button to increment *)
  let button_obj = Wrappers.Button.new_with_label "Click Me!" in
  let button = new button button_obj in
  vbox#append (new widget (Obj.magic button#as_button));
  ignore
    (button#on_clicked ~callback:(fun () ->
         count := !count + 1;
         Wrappers.Label.set_label label_obj (Printf.sprintf "Count: %d" !count)));

  (* Create reset button *)
  let reset_obj = Wrappers.Button.new_with_label "Reset" in
  let reset_btn = new button reset_obj in
  vbox#append (new widget (Obj.magic reset_btn#as_button));
  ignore
    (reset_btn#on_clicked ~callback:(fun () ->
         count := 0;
         Wrappers.Label.set_label label_obj (Printf.sprintf "Count: %d" !count)));

  (* Show window and run main loop *)
  window#present ();
  GMain.main ();

  (* Force GC to finalize remaining objects *)
  Gc.full_major ();
  Gc.full_major ()
