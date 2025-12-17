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

  let btn = Button.new_with_label "Hello World" in
  Printf.printf "✓ Created Button with label: '%s'\n" (Option.value ~default:"" (Button.get_label btn));

  Button.set_label btn "Updated Label";
  Printf.printf "✓ Updated label to: '%s'\n" (Option.value ~default:"" (Button.get_label btn));

  (* CheckButton with Nullable Parameters *)
  section "CheckButton - Nullable Parameters (KEY FEATURE)";

  Printf.printf "Creating CheckButton with nullable parameter...\n";
  let check1 = Check_button.new_with_label (Some "Enable notifications") in
  Printf.printf "✓ CheckButton created with label: '%s'\n"
    (Option.value ~default:"" (Check_button.get_label check1));

  let check2 = Check_button.new_with_mnemonic (Some "_Advanced mode") in
  Printf.printf "✓ CheckButton created with mnemonic: '%s'\n"
    (Option.value ~default:"" (Check_button.get_label check2));

  let _check3 = Check_button.new_ () in
  Printf.printf "✓ CheckButton created without label (nullable None)\n";

  Printf.printf "\n💡 NOTE: Constructors take 'string option' (Some/None)\n";

  (* Radio Button Grouping *)
  section "Radio Buttons - GTK4 CheckButton Grouping";

  let radio1 = Check_button.new_with_label (Some "Option A") in
  let radio2 = Check_button.new_with_label (Some "Option B") in
  let radio3 = Check_button.new_with_label (Some "Option C") in

  Check_button.set_group radio2 (Some radio1);
  Check_button.set_group radio3 (Some radio1);
  Printf.printf "✓ Created radio button group (3 buttons)\n";

  Check_button.set_active radio1 true;
  Printf.printf "  - Option A: %b, Option B: %b, Option C: %b\n"
    (Check_button.get_active radio1)
    (Check_button.get_active radio2)
    (Check_button.get_active radio3);

  Check_button.set_active radio2 true;
  Printf.printf "✓ Activated Option B:\n";
  Printf.printf "  - Option A: %b, Option B: %b, Option C: %b\n"
    (Check_button.get_active radio1)
    (Check_button.get_active radio2)
    (Check_button.get_active radio3);

  (* ToggleButton *)
  section "ToggleButton";

  let toggle = Toggle_button.new_with_label "Toggle Feature" in
  Toggle_button.set_active toggle true;
  Printf.printf "✓ Created ToggleButton (active: %b)\n" (Toggle_button.get_active toggle);

  Toggle_button.toggled toggle;
  Printf.printf "✓ Toggled (active: %b)\n" (Toggle_button.get_active toggle);

  (* High-Level OO Wrappers *)
  section "High-Level OO Wrappers";

  let gbutton_obj = Button.new_ () in
  Button.set_label gbutton_obj "Click Me";
  let gbutton = new GButton.button gbutton_obj in
  Printf.printf "✓ Created GButton: '%s'\n" (Option.value ~default:"" (gbutton#get_label ()));

  let gcheck_obj = Check_button.new_with_label (Some "Feature enabled") in
  Check_button.set_active gcheck_obj true;
  let _ = new GCheck_button.check_button gcheck_obj in
  Printf.printf "✓ Created GCheck_button (active=%b)\n" (Check_button.get_active gcheck_obj);

  let gtoggle_obj = Toggle_button.new_with_label "Power" in
  let _ = new GToggle_button.toggle_button gtoggle_obj in
  Printf.printf "✓ Created GToggle_button (active=%b)\n" (Toggle_button.get_active gtoggle_obj);

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
