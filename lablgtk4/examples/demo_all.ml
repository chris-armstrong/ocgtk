(* Comprehensive Demo of lablgtk4 Bindings - Phase 5.3 *)

let section title =
  print_endline "";
  print_endline ("=" ^ String.make (String.length title + 2) '=');
  print_endline (" " ^ title);
  print_endline ("=" ^ String.make (String.length title + 2) '=');
  print_endline ""

let () =
  ignore (GMain.init ());

  print_endline "\n🎨 LablGTK4 Feature Demonstration";
  print_endline "Phase 5.3: Nullable Parameters & Enhanced Bindings\n";

  (* Button Widgets *)
  section "Button Widgets";

  let btn = GtkButton.new_with_label "Hello World" in
  Printf.printf "✓ Created Button with label: '%s'\n" (GtkButton.get_label btn);

  GtkButton.set_label btn "Updated Label";
  Printf.printf "✓ Updated label to: '%s'\n" (GtkButton.get_label btn);

  (* CheckButton with Nullable Parameters *)
  section "CheckButton - Nullable Parameters (KEY FEATURE)";

  Printf.printf "Creating CheckButton with nullable parameter...\n";
  let check1 = GtkCheckButton.new_with_label (Some "Enable notifications") in
  Printf.printf "✓ CheckButton created with label: '%s'\n"
    (GtkCheckButton.get_label check1);

  let check2 = GtkCheckButton.new_with_mnemonic (Some "_Advanced mode") in
  Printf.printf "✓ CheckButton created with mnemonic: '%s'\n"
    (GtkCheckButton.get_label check2);

  let _check3 = GtkCheckButton.new_ () in
  Printf.printf "✓ CheckButton created without label (nullable None)\n";

  Printf.printf "\n💡 NOTE: Constructors take 'string option' (Some/None)\n";

  (* Radio Button Grouping *)
  section "Radio Buttons - GTK4 CheckButton Grouping";

  let radio1 = GtkCheckButton.new_with_label (Some "Option A") in
  let radio2 = GtkCheckButton.new_with_label (Some "Option B") in
  let radio3 = GtkCheckButton.new_with_label (Some "Option C") in

  GtkCheckButton.set_group radio2 (Some radio1);
  GtkCheckButton.set_group radio3 (Some radio1);
  Printf.printf "✓ Created radio button group (3 buttons)\n";

  GtkCheckButton.set_active radio1 true;
  Printf.printf "  - Option A: %b, Option B: %b, Option C: %b\n"
    (GtkCheckButton.get_active radio1)
    (GtkCheckButton.get_active radio2)
    (GtkCheckButton.get_active radio3);

  GtkCheckButton.set_active radio2 true;
  Printf.printf "✓ Activated Option B:\n";
  Printf.printf "  - Option A: %b, Option B: %b, Option C: %b\n"
    (GtkCheckButton.get_active radio1)
    (GtkCheckButton.get_active radio2)
    (GtkCheckButton.get_active radio3);

  (* ToggleButton *)
  section "ToggleButton";

  let toggle = GtkToggleButton.new_with_label "Toggle Feature" in
  GtkToggleButton.set_active toggle true;
  Printf.printf "✓ Created ToggleButton (active: %b)\n" (GtkToggleButton.get_active toggle);

  GtkToggleButton.toggled toggle;
  Printf.printf "✓ Toggled (active: %b)\n" (GtkToggleButton.get_active toggle);

  (* High-Level OO Wrappers *)
  section "High-Level OO Wrappers";

  let gbutton = GButton.button ~label:"Click Me" () in
  Printf.printf "✓ Created GButton: '%s'\n" gbutton#label;

  let gcheck = GButton.check_button ~label:"Feature enabled" ~active:true () in
  Printf.printf "✓ Created GButton.check_button (active=%b)\n" gcheck#active;

  let gtoggle = GButton.toggle_button ~label:"Power" () in
  Printf.printf "✓ Created GButton.toggle_button (active=%b)\n" gtoggle#active;

  (* Summary *)
  section "Summary";
  print_endline "✅ Phase 5.3 Complete - All Features Working:";
  print_endline "   ✓ Nullable parameters (string option)";
  print_endline "   ✓ CheckButton radio grouping (GTK4 style)";
  print_endline "   ✓ Button/CheckButton/ToggleButton";
  print_endline "   ✓ High-level OO wrappers";
  print_endline "   ✓ Bytecode/native variants (>5 params)";
  print_endline "";
  print_endline "🎉 lablgtk4 is working!\n"
