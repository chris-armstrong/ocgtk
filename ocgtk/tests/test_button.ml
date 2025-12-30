(* Phase 5.1 Button Widget Tests *)

open Alcotest

(* Try to initialize GTK once for all tests *)
let gtk_available =
  try
    let _ = GMain.init () in
    true
  with
  | GMain.Error _ -> false

(* Helper to skip tests when GTK is not available *)
let require_gtk f () =
  if not gtk_available then skip ()
  else f ()

(* Test button creation and basic properties *)
let test_button_creation () =
  let btn = Button.new_ () in
  check bool "button created" true (btn != Obj.magic 0);
  Button.set_label btn "Test Button";
  check (option string) "button label" (Some "Test Button") (Button.get_label btn);
  Button.set_has_frame btn false;
  check bool "button has_frame" false (Button.get_has_frame btn)

let test_button_with_label () =
  let btn = Button.new_with_label "Click me" in
  check (option string) "button label from constructor" (Some "Click me") (Button.get_label btn)

let test_button_with_mnemonic () =
  let btn = Button.new_with_mnemonic "_File" in
  check (option string) "button mnemonic label" (Some "_File") (Button.get_label btn);
  Button.set_use_underline btn true;
  check bool "button use_underline" true (Button.get_use_underline btn)

let test_button_icon_name () =
  let btn = Button.new_from_icon_name "document-open" in
  check (option string) "button icon_name" (Some "document-open") (Button.get_icon_name btn);
  Button.set_icon_name btn "document-save";
  check (option string) "button icon changed" (Some "document-save") (Button.get_icon_name btn)

let test_button_properties () =
  let btn = Button.new_ () in
  Button.set_can_shrink btn true;
  check bool "can_shrink set" true (Button.get_can_shrink btn);
  Button.set_can_shrink btn false;
  check bool "can_shrink unset" false (Button.get_can_shrink btn)

let test_check_button_creation () =
  let btn = Check_button.new_ () in
  check bool "check button created" true (btn != Obj.magic 0);
  check bool "check button initial active" false (Check_button.get_active btn);
  Check_button.set_active btn true;
  check bool "check button activated" true (Check_button.get_active btn)

let test_check_button_with_label () =
  let btn = Check_button.new_with_label (Some "Enable feature") in
  check (option string) "check button label" (Some "Enable feature") (Check_button.get_label btn)

let test_check_button_grouping () =
  (* Test nullable parameter support - set_group accepts widget option *)
  let btn1 = Check_button.new_ () in
  let btn2 = Check_button.new_ () in
  (* Group btn2 with btn1 - btn1 is the group leader *)
  Check_button.set_group btn2 (Some btn1);
  (* Set btn1 active *)
  Check_button.set_active btn1 true;
  check bool "btn1 is active" true (Check_button.get_active btn1)

let test_check_button_inconsistent () =
  let btn = Check_button.new_ () in
  Check_button.set_inconsistent btn true;
  check bool "check button inconsistent" true (Check_button.get_inconsistent btn);
  Check_button.set_inconsistent btn false;
  check bool "check button not inconsistent" false (Check_button.get_inconsistent btn)

let test_toggle_button_creation () =
  let btn = Toggle_button.new_ () in
  check bool "toggle button created" true (btn != Obj.magic 0);
  check bool "toggle button initial active" false (Toggle_button.get_active btn)

let test_toggle_button_with_label () =
  let btn = Toggle_button.new_with_label "Toggle me" in
  Toggle_button.set_active btn true;
  check bool "toggle button activated" true (Toggle_button.get_active btn)

let test_toggle_button_toggled () =
  (* Note: gtk_toggle_button_toggled() emits the "toggled" signal but
     does NOT change the active state. To change state, use set_active. *)
  let btn = Toggle_button.new_ () in
  Toggle_button.set_active btn false;
  (* Call toggled - it should emit signal but not change state *)
  Toggle_button.toggled btn;
  check bool "toggle button state unchanged after toggled" false (Toggle_button.get_active btn);
  (* Try with active=true *)
  Toggle_button.set_active btn true;
  Toggle_button.toggled btn;
  check bool "toggle button state still true after toggled" true (Toggle_button.get_active btn)

let test_high_level_button () =
  let obj = Button.new_ () in
  Button.set_label obj "Click me";
  Button.set_has_frame obj true;
  let btn = new GButton.button obj in
  check (option string) "GButton label" (Some "Click me") (btn#get_label ());
  btn#set_label "Updated";
  check (option string) "GButton label updated" (Some "Updated") (btn#get_label ());
  btn#set_has_frame false;
  check bool "GButton has_frame" false (btn#get_has_frame ())

let test_high_level_button_with_icon () =
  let obj = Button.new_ () in
  Button.set_icon_name obj "document-open";
  let btn = new GButton.button obj in
  check (option string) "GButton icon" (Some "document-open") (btn#get_icon_name ());
  btn#set_icon_name "document-save";
  check (option string) "GButton icon changed" (Some "document-save") (btn#get_icon_name ())

let () =
  run "Button Tests" [
    "low_level_button", [
      test_case "button_creation" `Quick (require_gtk test_button_creation);
      test_case "button_with_label" `Quick (require_gtk test_button_with_label);
      test_case "button_with_mnemonic" `Quick (require_gtk test_button_with_mnemonic);
      test_case "button_icon_name" `Quick (require_gtk test_button_icon_name);
      test_case "button_properties" `Quick (require_gtk test_button_properties);
    ];
    "low_level_check_button", [
      test_case "check_button_creation" `Quick (require_gtk test_check_button_creation);
      test_case "check_button_with_label" `Quick (require_gtk test_check_button_with_label);
      test_case "check_button_grouping" `Quick (require_gtk test_check_button_grouping);
      test_case "check_button_inconsistent" `Quick (require_gtk test_check_button_inconsistent);
    ];
    "low_level_toggle_button", [
      test_case "toggle_button_creation" `Quick (require_gtk test_toggle_button_creation);
      test_case "toggle_button_with_label" `Quick (require_gtk test_toggle_button_with_label);
      test_case "toggle_button_toggled" `Quick (require_gtk test_toggle_button_toggled);
    ];
    "high_level", [
      test_case "gbutton" `Quick (require_gtk test_high_level_button);
      test_case "gbutton_icon" `Quick (require_gtk test_high_level_button_with_icon);
    ];
  ]
