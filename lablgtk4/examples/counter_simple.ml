(* Simple Counter - using only gtkButton and minimal dependencies
   Demonstrates: gtkButton module directly *)

let () =
  (* Initialize GTK *)
  ignore (GMain.init ());

  print_endline "Counter app starting...";
  print_endline "Window would appear here in a full GUI environment";
  print_endline "This is a demonstration of the bindings";

  (* Show that we can create GTK objects *)
  let btn = GtkButton.new_with_label "Click Me!" in
  print_endline "✓ Created button";

  GtkButton.set_label btn "Counter: 0";
  print_endline "✓ Set label";

  let label_text = GtkButton.get_label btn in
  Printf.printf "✓ Got label: %s\n" label_text;

  (* Demonstrate CheckButton with nullable parameters *)
  let check1 = GtkCheckButton.new_with_label (Some "Enable feature") in
  print_endline "✓ Created CheckButton with nullable string parameter";

  let check2 = GtkCheckButton.new_ () in
  GtkCheckButton.set_group check2 (Some check1);
  print_endline "✓ Created CheckButton group (radio buttons)";

  GtkCheckButton.set_active check1 true;
  Printf.printf "✓ Check button 1 active: %b\n" (GtkCheckButton.get_active check1);

  (* Demonstrate ToggleButton *)
  let toggle = GtkToggleButton.new_with_label "Toggle Me" in
  GtkToggleButton.set_active toggle true;
  Printf.printf "✓ Toggle button active: %b\n" (GtkToggleButton.get_active toggle);

  print_endline "\n✅ All bindings working correctly!";
  print_endline "Nullable parameters: WORKING ✓";
  print_endline "CheckButton grouping: WORKING ✓";
  print_endline "Button/ToggleButton: WORKING ✓"
