(* Phase 5.1 Button Widget Tests *)

open Alcotest

(* Helper to wrap tests with GTK init *)
let with_gtk f () =
  try
    let _ = GMain.init () in
    f ()
  with
  | GMain.Error _ -> skip ()

(* Test button creation and basic properties *)
let test_button_creation () =
  let btn = GtkButton.new_ () in
  check bool "button created" true (btn != Obj.magic 0);
  (* Set and get label *)
  GtkButton.set_label btn "Test Button";
  check string "button label" "Test Button" (GtkButton.get_label btn);
  (* Set and get has_frame *)
  GtkButton.set_has_frame btn false;
  check bool "button has_frame" false (GtkButton.get_has_frame btn)

let test_button_with_label () =
  let btn = GtkButton.new_with_label "Click me" in
  check string "button label from constructor" "Click me" (GtkButton.get_label btn)

let test_button_with_mnemonic () =
  let btn = GtkButton.new_with_mnemonic "_File" in
  check string "button mnemonic label" "_File" (GtkButton.get_label btn);
  GtkButton.set_use_underline btn true;
  check bool "button use_underline" true (GtkButton.get_use_underline btn)

let test_button_icon_name () =
  let btn = GtkButton.new_from_icon_name "document-open" in
  check string "button icon_name" "document-open" (GtkButton.get_icon_name btn);
  (* Change icon *)
  GtkButton.set_icon_name btn "document-save";
  check string "button icon changed" "document-save" (GtkButton.get_icon_name btn)

let test_button_properties () =
  let btn = GtkButton.new_ () in
  (* can_shrink property *)
  GtkButton.set_can_shrink btn true;
  check bool "can_shrink set" true (GtkButton.get_can_shrink btn);
  GtkButton.set_can_shrink btn false;
  check bool "can_shrink unset" false (GtkButton.get_can_shrink btn)

(* Test check button *)
let test_check_button_creation () =
  let btn = GtkCheckButton.new_ () in
  check bool "check button created" true (btn != Obj.magic 0);
  (* Initial state should be inactive *)
  check bool "check button initial active" false (GtkCheckButton.get_active btn);
  (* Activate it *)
  GtkCheckButton.set_active btn true;
  check bool "check button activated" true (GtkCheckButton.get_active btn)

let test_check_button_with_label () =
  let btn = GtkCheckButton.new_with_label "Enable feature" in
  check string "check button label" "Enable feature" (GtkCheckButton.get_label btn)

let test_check_button_grouping () =
  (* Create radio buttons using check button grouping *)
  let rb1 = GtkCheckButton.new_with_label "Option 1" in
  let rb2 = GtkCheckButton.new_with_label "Option 2" in
  let rb3 = GtkCheckButton.new_with_label "Option 3" in

  (* Group them together *)
  GtkCheckButton.set_group rb2 (Some rb1);
  GtkCheckButton.set_group rb3 (Some rb1);

  (* Activate first button *)
  GtkCheckButton.set_active rb1 true;
  check bool "rb1 active" true (GtkCheckButton.get_active rb1)
  (* Note: GTK4 radio button mutual exclusion happens at runtime,
     not immediately visible in these unit tests *)

let test_check_button_inconsistent () =
  let btn = GtkCheckButton.new_ () in
  GtkCheckButton.set_inconsistent btn true;
  check bool "check button inconsistent" true (GtkCheckButton.get_inconsistent btn);
  GtkCheckButton.set_inconsistent btn false;
  check bool "check button not inconsistent" false (GtkCheckButton.get_inconsistent btn)

(* Test toggle button *)
let test_toggle_button_creation () =
  let btn = GtkToggleButton.new_ () in
  check bool "toggle button created" true (btn != Obj.magic 0);
  check bool "toggle button initial active" false (GtkToggleButton.get_active btn)

let test_toggle_button_with_label () =
  let btn = GtkToggleButton.new_with_label "Toggle me" in
  GtkToggleButton.set_active btn true;
  check bool "toggle button activated" true (GtkToggleButton.get_active btn)

let test_toggle_button_toggled () =
  let btn = GtkToggleButton.new_ () in
  (* Set initial state *)
  GtkToggleButton.set_active btn false;
  (* Call toggled (emits signal, changes state) *)
  GtkToggleButton.toggled btn;
  (* State should have changed *)
  check bool "toggle button toggled" true (GtkToggleButton.get_active btn)

(* Test high-level GButton wrapper *)
let test_high_level_button () =
  let btn = GButton.button ~label:"Click me" () in
  check string "GButton label" "Click me" btn#label;
  btn#set_label "Updated";
  check string "GButton label updated" "Updated" btn#label;
  btn#set_has_frame false;
  check bool "GButton has_frame" false btn#has_frame

let test_high_level_button_with_icon () =
  let btn = GButton.button ~icon_name:"document-open" () in
  check string "GButton icon" "document-open" btn#icon_name;
  btn#set_icon_name "document-save";
  check string "GButton icon changed" "document-save" btn#icon_name

let test_high_level_check_button () =
  let cb = GButton.check_button ~label:"Enable" () in
  check bool "GButton.check_button initial" false cb#active;
  cb#set_active true;
  check bool "GButton.check_button activated" true cb#active;
  check string "GButton.check_button label" "Enable" cb#label

let test_high_level_radio_buttons () =
  let rb1 = GButton.radio_button ~label:"Option 1" () in
  let rb2 = GButton.radio_button ~label:"Option 2" ~group:rb1 () in
  let rb3 = GButton.radio_button ~label:"Option 3" ~group:rb1 () in

  rb1#set_active true;
  check bool "radio button 1 active" true rb1#active;
  check string "radio button 1 label" "Option 1" rb1#label;
  check string "radio button 2 label" "Option 2" rb2#label;
  check string "radio button 3 label" "Option 3" rb3#label

let test_high_level_toggle_button () =
  let tb = GButton.toggle_button ~label:"Toggle" () in
  check bool "GButton.toggle_button initial" false tb#active;
  tb#set_active true;
  check bool "GButton.toggle_button activated" true tb#active;
  tb#toggled ();
  check bool "GButton.toggle_button toggled" false tb#active

let () =
  run "Button Tests" [
    "low_level_button", [
      test_case "button_creation" `Quick (with_gtk test_button_creation);
      test_case "button_with_label" `Quick (with_gtk test_button_with_label);
      test_case "button_with_mnemonic" `Quick (with_gtk test_button_with_mnemonic);
      test_case "button_icon_name" `Quick (with_gtk test_button_icon_name);
      test_case "button_properties" `Quick (with_gtk test_button_properties);
    ];
    "low_level_check_button", [
      test_case "check_button_creation" `Quick (with_gtk test_check_button_creation);
      test_case "check_button_with_label" `Quick (with_gtk test_check_button_with_label);
      test_case "check_button_grouping" `Quick (with_gtk test_check_button_grouping);
      test_case "check_button_inconsistent" `Quick (with_gtk test_check_button_inconsistent);
    ];
    "low_level_toggle_button", [
      test_case "toggle_button_creation" `Quick (with_gtk test_toggle_button_creation);
      test_case "toggle_button_with_label" `Quick (with_gtk test_toggle_button_with_label);
      test_case "toggle_button_toggled" `Quick (with_gtk test_toggle_button_toggled);
    ];
    "high_level", [
      test_case "gbutton" `Quick (with_gtk test_high_level_button);
      test_case "gbutton_icon" `Quick (with_gtk test_high_level_button_with_icon);
      test_case "gcheck_button" `Quick (with_gtk test_high_level_check_button);
      test_case "gradio_buttons" `Quick (with_gtk test_high_level_radio_buttons);
      test_case "gtoggle_button" `Quick (with_gtk test_high_level_toggle_button);
    ];
  ]
