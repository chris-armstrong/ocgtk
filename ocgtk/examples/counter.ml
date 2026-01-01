open Ocgtk_gtk
(* Simple Counter Application
   Demonstrates: Button, Label, event handling *)

let _ =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window_obj = Application_and__window_and__window_group.Window.new_ () in
  let window =
    new GApplication_and__window_and__window_group.window window_obj
  in
  window#set_title (Some "Counter App");
  window#set_default_size 300 100;

  ignore (window#on_unmap ~callback:(fun () -> GMain.quit ()));

  (* Create vertical box for layout *)
  let vbox_obj = Box.new_ `VERTICAL 10 in
  let vbox = new GBox.box vbox_obj in
  window#set_child
    (Some
       (vbox
         :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
            .widget));

  (* Counter state *)
  let count = ref 0 in

  (* Create label to display count *)
  let label_obj = Label.new_ (Some (Printf.sprintf "Count: %d" !count)) in
  let label_widget = Label.as_widget label_obj in
  vbox#append
    (new
       GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
       .widget
       label_widget);

  (* Create button to increment *)
  let button_obj = Button.new_with_label "Click Me!" in
  let button = new GButton.button button_obj in
  vbox#append
    (button
      :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
         .widget);
  ignore
    (button#on_clicked ~callback:(fun () ->
         count := !count + 1;
         Label.set_label label_obj (Printf.sprintf "Count: %d" !count)));

  (* Create reset button *)
  let reset_obj = Button.new_with_label "Reset" in
  let reset_btn = new GButton.button reset_obj in
  vbox#append
    (reset_btn
      :> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
         .widget);
  ignore
    (reset_btn#on_clicked ~callback:(fun () ->
         count := 0;
         Label.set_label label_obj (Printf.sprintf "Count: %d" !count)));

  (* Show window and run main loop *)
  window#present ();
  GMain.main ();

  (* Force GC to finalize remaining objects *)
  Gc.full_major ();
  Gc.full_major ()
