open Ocgtk_gtk.Gtk

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
.calculator-display {
  background-color: #2d2d2d;
  color: #ffffff;
  padding: 16px;
  border-radius: 8px;
}

.calculator-expression {
  font-size: 14px;
  color: #aaaaaa;
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

.calculator-button-operator {
  background-color: #ff9500;
  color: white;
}

.calculator-button-equals {
  background-color: #34c759;
  color: white;
}

.calculator-button-clear {
  background-color: #ff3b30;
  color: white;
}
|css}

type t = { expression_label : Label.label_t; result_label : Label.label_t }

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
  expression_label#set_markup
    "<span font_desc='Monospace 12' foreground='#aaaaaa'></span>";
  apply_css_provider css_provider (expression_label :> Widget.widget_t);
  vbox#append (expression_label :> Widget.widget_t);

  (* Result display - large bold monospace via Pango markup *)
  let result_label = create_display_label "0" in
  result_label#set_margin_bottom 8;
  result_label#add_css_class "calculator-result";
  result_label#set_markup
    "<span font_desc='Monospace Bold 24' foreground='#ffffff'>0</span>";
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
          apply_css_provider css_provider (btn :> Widget.widget_t);
          grid#attach (btn :> Widget.widget_t) col row 1 1)
        cols)
    button_layout;

  { expression_label; result_label }

let set_expression_text ui text =
  let markup =
    Printf.sprintf "<span font_desc='Monospace 12' foreground='#aaaaaa'>%s</span>"
      (escape_pango_markup text)
  in
  ui.expression_label#set_markup markup

let set_result_text ui text =
  let markup =
    Printf.sprintf "<span font_desc='Monospace Bold 24' foreground='#ffffff'>%s</span>"
      (escape_pango_markup text)
  in
  ui.result_label#set_markup markup
