open Ocgtk_gtk.Gtk
open Calc_core

(* Escape text for safe use in Pango markup (XML escaping) *)
let escape_pango_markup s =
  let b = Buffer.create (String.length s * 2) in
  String.iter
    (function
      | '&' -> Buffer.add_string b "&amp;"
      | '<' -> Buffer.add_string b "&lt;"
      | '>' -> Buffer.add_string b "&gt;"
      | '"' -> Buffer.add_string b "&quot;"
      | '\'' -> Buffer.add_string b "&apos;"
      | c -> Buffer.add_char b c)
    s;
  Buffer.contents b

let css_provider_as_style_provider :
    Wrappers.Css_provider.t -> Wrappers.Style_provider.t =
  Obj.magic

let css_theme =
  {css|
.calculator-expression {
  font-size: 14px;
  opacity: 0.7;
}

.calculator-result {
  font-family: monospace;
  font-size: 32px;
  font-weight: bold;
}

.calculator-button {
  font-size: 18px;
  border-radius: 6px;
  min-height: 48px;
  min-width: 48px;
}

/* Operator buttons - suggested action style */
.calculator-button-operator {
  background: alpha(@accent_bg_color, 0.3);
}

/* Equals button - accent/suggested action */
.calculator-button-equals {
  background: @accent_bg_color;
  color: @accent_fg_color;
}

/* Clear button - destructive action */
.calculator-button-clear {
  background: alpha(@error_bg_color, 0.4);
}
|css}

type t = {
  expression_label : Label.label_t;
  result_label : Label.label_t;
  state : Calc_state.t ref;
}

let button_layout =
  [|
    [| "C"; "("; ")"; "/" |];
    [| "7"; "8"; "9"; "*" |];
    [| "4"; "5"; "6"; "-" |];
    [| "1"; "2"; "3"; "+" |];
    [| "0"; "."; "=" |];
  |]

let create_display_label text =
  let label = Label.new_ (Some text) in
  label#set_xalign 1.0;
  label#set_hexpand true;
  label#set_margin_start 12;
  label#set_margin_end 12;
  label#set_use_markup true;
  label

let setup_css_provider () =
  let provider =
    new Css_provider.css_provider (Wrappers.Css_provider.new_ ())
  in
  provider#load_from_string css_theme;
  provider

let apply_css_provider (provider : Css_provider.css_provider_t)
    (widget : Widget.widget_t) =
  let style_ctx = widget#get_style_context () in
  let style_provider =
    css_provider_as_style_provider provider#as_css_provider
  in
  Wrappers.Style_context.add_provider style_ctx#as_style_context style_provider
    600

let set_expression_text ui text =
  let markup =
    Printf.sprintf "<span font_desc='Monospace 12'>%s</span>"
      (escape_pango_markup text)
  in
  ui.expression_label#set_markup markup

let set_result_text ui text =
  let markup =
    Printf.sprintf "<span font_desc='Monospace Bold 24'>%s</span>"
      (escape_pango_markup text)
  in
  ui.result_label#set_markup markup

let update_display ui () =
  let expr_text = Calc_state.get_expression_display !(ui.state) in
  let result_text = Calc_state.get_result_display !(ui.state) in
  set_expression_text ui expr_text;
  set_result_text ui result_text

let handle_button_click ui text () =
  let open Calc_state in
  let state_ref = ui.state in
  let current_state = !state_ref in
  let new_state =
    match text with
    | "C" -> clear ()
    | "=" -> evaluate current_state
    | "DEL" -> backspace current_state
    | _ when String.length text = 1 -> append_char current_state text.[0]
    | _ -> current_state
  in
  state_ref := new_state;
  update_display ui ()

let build (window : Window.window_t) =
  let vbox = Box.new_ `VERTICAL 5 in
  vbox#set_margin_top 8;
  vbox#set_margin_bottom 8;
  vbox#set_margin_start 8;
  vbox#set_margin_end 8;
  window#set_child (Some (vbox :> Widget.widget_t));

  let css_provider = setup_css_provider () in

  (* Expression display - small dim text *)
  let expression_label = create_display_label "" in
  expression_label#set_margin_top 8;
  expression_label#set_margin_bottom 4;
  expression_label#add_css_class "calculator-expression";
  expression_label#set_markup "<span font_desc='Monospace 12'></span>";
  apply_css_provider css_provider (expression_label :> Widget.widget_t);
  vbox#append (expression_label :> Widget.widget_t);

  (* Result display - large bold monospace via Pango markup *)
  let result_label = create_display_label "0" in
  result_label#set_margin_bottom 8;
  result_label#add_css_class "calculator-result";
  result_label#set_markup "<span font_desc='Monospace Bold 24'>0</span>";
  apply_css_provider css_provider (result_label :> Widget.widget_t);
  vbox#append (result_label :> Widget.widget_t);

  (* Button grid *)
  let grid = Grid.new_ () in
  grid#set_column_homogeneous true;
  grid#set_row_homogeneous true;
  grid#set_column_spacing 4;
  grid#set_row_spacing 4;
  grid#set_vexpand true;
  vbox#append (grid :> Widget.widget_t);

  (* Create the state ref that will be shared by all button handlers *)
  let state = ref (Calc_state.create ()) in

  (* Build the UI record for callbacks *)
  let ui = { expression_label; result_label; state } in

  Array.iteri
    (fun row cols ->
      Array.iteri
        (fun col text ->
          let btn = new Button.button (Wrappers.Button.new_with_label text) in
          btn#add_css_class "calculator-button";
          (match text with
          | "C" -> btn#add_css_class "calculator-button-clear"
          | "=" -> btn#add_css_class "calculator-button-equals"
          | "/" | "*" | "-" | "+" ->
              btn#add_css_class "calculator-button-operator"
          | _ -> ());

          (* Wire up the click handler *)
          let callback = handle_button_click ui text in
          ignore (btn#on_clicked ~callback);

          apply_css_provider css_provider (btn :> Widget.widget_t);
          grid#attach (btn :> Widget.widget_t) col row 1 1)
        cols)
    button_layout;

  ui
