(* Simple Counter Application
   Demonstrates: Button, Label, event handling *)

let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  (* Create main window *)
  let window = GWindow.window ~title:"Counter App" ~width:300 ~height:100 () in

  (* Create vertical box for layout *)
  let vbox = GBox.vbox ~spacing:10 () in
  window#add (vbox :> GObj.widget);

  (* Counter state *)
  let count = ref 0 in

  (* Create label to display count *)
  let label = Label.new_ (Some (Printf.sprintf "Count: %d" !count)) in
  vbox#append (GObj.widget_of_obj (label));

  (* Create button to increment *)
  let button = GButton.button ~label:"Click Me!" () in
  vbox#append (button :> GObj.widget);
  ignore (button#connect#clicked ~callback:(fun () ->
    count := !count + 1;
    Label.set_label label (Printf.sprintf "Count: %d" !count)
  ));

  (* Create reset button *)
  let reset_btn = GButton.button ~label:"Reset" () in
  vbox#append (reset_btn :> GObj.widget);
  ignore (reset_btn#connect#clicked ~callback:(fun () ->
    count := 0;
    Label.set_label label (Printf.sprintf "Count: %d" !count)
  ));

  (* Show window and run main loop *)
  window#show;
  GMain.main ()
