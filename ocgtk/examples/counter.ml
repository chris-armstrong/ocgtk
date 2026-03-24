open Ocgtk_gtk.Gtk
module GMain = Ocgtk_gtk.GMain
(* Simple Counter Application
   Demonstrates: Button, Label, event handling *)

(* close-request returns bool — not yet supported by signal generator,
   so we connect manually via Gobject.Closure *)
let on_close_request window_obj callback =
  let closure = Gobject.Closure.create (fun argv ->
    callback ();
    Gobject.Value.set_boolean (Gobject.Closure.result argv) false
  ) in
  ignore (Gobject.Signal.connect window_obj ~name:"close-request" ~callback:closure ~after:false)

let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window_obj = Wrappers.Window.new_ () in
  let window = new Window.window window_obj in
  window#set_title (Some "Counter App");
  window#set_default_size 300 100;
  on_close_request window_obj (fun () -> GMain.quit ());

  (* Create vertical box for layout *)
  let vbox = new Box.box (Wrappers.Box.new_ `VERTICAL 10) in
  window#set_child (Some (vbox :> Widget.widget_t));

  (* Counter state *)
  let count = ref 0 in

  (* Create label to display count *)
  let label =
    new Label.label
      (Wrappers.Label.new_ (Some (Printf.sprintf "Count: %d" !count)))
  in
  vbox#append (label :> Widget.widget_t);

  (* Create button to increment *)
  let button = new Button.button (Wrappers.Button.new_with_label "Click Me!") in
  vbox#append (button :> Widget.widget_t);
  ignore
    (button#on_clicked ~callback:(fun () ->
         count := !count + 1;
         label#set_label (Printf.sprintf "Count: %d" !count)));

  (* Create reset button *)
  let reset_btn = new Button.button (Wrappers.Button.new_with_label "Reset") in
  vbox#append (reset_btn :> Widget.widget_t);
  ignore
    (reset_btn#on_clicked ~callback:(fun () ->
         count := 0;
         label#set_label (Printf.sprintf "Count: %d" !count)));

  (* Show window and run main loop *)
  window#present ();
  GMain.main ();

  (* Force GC to finalize remaining objects *)
  Gc.full_major ();
  Gc.full_major ()
