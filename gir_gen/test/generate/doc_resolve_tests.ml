(* Unit tests for Doc_resolve (gir_gen/lib/generate/doc_resolve.ml): each
   type-level and member fragment linked from both layers, endpoint forms
   (relative, anchored, backticked), cross-package targets and members, and every
   miss reason. The index is built by Doc_index from the Member_fixture Gtk
   namespace and Gdk and Pango references files. *)

open Gir_gen_lib
open Gir_gen_lib.Generate
open Type_factory

let entities entries =
  List.fold_left
    (fun acc (entity : Types.cross_reference_entity) ->
      Types.StringMap.add entity.cr_name entity acc)
    Types.StringMap.empty entries

let layer ?(methods = []) ?(constructors = []) ?(signals = [])
    ?(properties = []) () : Types.cross_reference_layer_members =
  {
    crl_methods = methods;
    crl_constructors = constructors;
    crl_signals = signals;
    crl_properties = properties;
  }

(* Gdk's references file, with member tables. [Surface.get_scale] is emitted at
   layer 1 only. *)
let gdk_refs =
  Helpers.make_ncr "Gdk"
    (entities
       [
         make_cross_reference_entity ~cr_name:"Texture" ~cr_c_type:"GdkTexture"
           ~cr_type:(make_cross_reference_type `Class)
           ();
         make_cross_reference_entity ~cr_name:"Surface" ~cr_c_type:"GdkSurface"
           ~cr_type:(make_cross_reference_type `Class)
           ~cr_members:
             {
               crm_l1 =
                 layer
                   ~methods:[ ("beep", "beep"); ("get_scale", "get_scale") ]
                   ~constructors:[ ("new_popup", "new_popup") ]
                   ~signals:[ ("layout", "on_layout") ]
                   ~properties:[ ("mapped", "get_mapped") ]
                   ();
               crm_l2 =
                 layer
                   ~methods:[ ("beep", "beep") ]
                   ~constructors:[ ("new_popup", "new_popup") ]
                   ~signals:[ ("layout", "on_layout") ]
                   ~properties:[ ("mapped", "mapped") ]
                   ();
               crm_c_methods =
                 [
                   ("beep", "gdk_surface_beep");
                   ("get_scale", "gdk_surface_get_scale");
                 ];
               crm_c_constructors = [ ("new_popup", "gdk_surface_new_popup") ];
             }
           ();
         make_cross_reference_entity ~cr_name:"Gravity" ~cr_c_type:"GdkGravity"
           ~cr_type:(make_cross_reference_type `Enum)
           ~cr_enum_members:[ ("north_west", "GDK_GRAVITY_NORTH_WEST") ]
           ();
         make_cross_reference_entity ~cr_name:"PaintableFlags"
           ~cr_c_type:"GdkPaintableFlags"
           ~cr_type:(make_cross_reference_type `Bitfield)
           ~cr_enum_members:[ ("static_size", "GDK_PAINTABLE_STATIC_SIZE") ]
           ();
         make_cross_reference_entity ~cr_name:"KEY_a" ~cr_c_type:"GDK_KEY_a"
           ~cr_type:(make_cross_reference_type `Constant)
           ();
       ])

(* A references file with no member tables, as an older file has none. *)
let pango_refs =
  Helpers.make_ncr "Pango"
    (entities
       [
         make_cross_reference_entity ~cr_name:"Layout" ~cr_c_type:"PangoLayout"
           ~cr_type:(make_cross_reference_type `Class)
           ();
         make_cross_reference_entity ~cr_name:"WrapMode"
           ~cr_c_type:"PangoWrapMode"
           ~cr_type:(make_cross_reference_type `Enum)
           ();
       ])

let index =
  Member_fixture.index
    ~classes:
      (Member_fixture.classes
      @ [
          make_gir_class ~class_name:"ToggleButton" ~c_type:"GtkToggleButton"
            ~parent:"Button" ();
        ])
    ~interfaces:[ make_gir_interface ~interface_name:"Actionable" () ]
    ~records:[ make_gir_record ~record_name:"TextIter" () ]
    ~constants:
      [
        make_gir_constant ~constant_name:"ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE"
          ~constant_c_type:"GTK_ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE" ();
      ]
    ~cross_references:(make_cross_reference_map [ gdk_refs; pango_refs ])
    ()

let env layer : Doc_resolve.env = { namespace = "Gtk"; layer; index }
let l2 = env Types.Main_library
let l1 = env Types.Raw_library

let translate refs gir =
  String.trim (Doc_emit.translate ~refs Doc_translate.Member gir)

let check_links ~refs label gir expected =
  Alcotest.(check string) label expected (translate refs gir)

let reason_testable =
  Alcotest.testable
    (Fmt.of_to_string Doc_resolve.miss_reason_name)
    Doc_resolve.equal_miss_reason

(* The miss reason of a doc's only reference; [None] when it linked. *)
let miss refs gir =
  match
    Doc_resolve.resolve refs (Doc_translate.parse Doc_translate.Member gir)
  with
  | _, [ { result = Ok (); _ } ] -> None
  | _, [ { result = Error reason; _ } ] -> Some reason
  | _, outcomes ->
      Alcotest.failf "expected one reference in %S, got %d" gir
        (List.length outcomes)

let check_miss ?(refs = l2) label gir expected =
  Alcotest.(check (option reason_testable))
    label (Some expected) (miss refs gir)

(* ---------- types, from both layers ----------------------------- *)

let test_class_from_both_layers () =
  check_links ~refs:l2 "layer 2 doc links the class type"
    "[class@Gtk.ToggleButton]"
    "{{!Ocgtk.Toggle_button.class-type-toggle_button_t}[Gtk.ToggleButton]}";
  check_links ~refs:l1 "layer 1 doc links the layer 1 module"
    "[class@Gtk.ToggleButton]" "{{!Ocgtk.Raw.Toggle_button}[Gtk.ToggleButton]}"

let test_interface_from_both_layers () =
  check_links ~refs:l2 "layer 2" "[iface@Gtk.Actionable]"
    "{{!Ocgtk.Actionable.class-type-actionable_t}[Gtk.Actionable]}";
  check_links ~refs:l1 "layer 1" "[iface@Gtk.Actionable]"
    "{{!Ocgtk.Raw.Actionable}[Gtk.Actionable]}"

let test_record_links_like_a_class () =
  check_links ~refs:l2 "a record has a class type" "[struct@Gtk.TextIter]"
    "{{!Ocgtk.Text_iter.class-type-text_iter_t}[Gtk.TextIter]}";
  check_links ~refs:l1 "and a layer 1 module" "[struct@Gtk.TextIter]"
    "{{!Ocgtk.Raw.Text_iter}[Gtk.TextIter]}"

let test_enum_same_from_both_layers () =
  List.iter
    (fun refs ->
      check_links ~refs "enum type in Enums" "[enum@Gtk.Orientation]"
        "{{!Ocgtk.Enums.type-orientation}[Gtk.Orientation]}";
      check_links ~refs "bitfield list type in Enums" "[flags@Gtk.StateFlags]"
        "{{!Ocgtk.Enums.type-stateflags}[Gtk.StateFlags]}")
    [ l1; l2 ]

let test_constant_same_from_both_layers () =
  List.iter
    (fun refs ->
      check_links ~refs "constant in Constants"
        "[const@Gtk.ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]"
        "{{!Ocgtk.Constants.accessible_attribute_overline_none}[Gtk.ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]}")
    [ l1; l2 ]

let test_type_fragment_takes_kind_from_index () =
  check_links ~refs:l2 "a class" "[type@Gtk.Button]"
    "{{!Ocgtk.Button.class-type-button_t}[Gtk.Button]}";
  check_links ~refs:l2 "an enum" "[type@Gtk.Orientation]"
    "{{!Ocgtk.Enums.type-orientation}[Gtk.Orientation]}"

(* ---------- members, from both layers ---------------------------- *)

let test_method_from_both_layers () =
  check_links ~refs:l2 "layer 2: the class type's method"
    "[method@Gtk.Button.set_label]"
    "{{!Ocgtk.Button.class-type-button_t.method-set_label}[Gtk.Button.set_label]}";
  check_links ~refs:l1 "layer 1: the external" "[method@Gtk.Button.set_label]"
    "{{!Ocgtk.Raw.Button.val-set_label}[Gtk.Button.set_label]}"

let test_filtered_method () =
  List.iter
    (fun refs ->
      check_miss ~refs "not introspectable" "[method@Gtk.Button.get_private]"
        Unknown_target;
      check_links ~refs "stays code" "[method@Gtk.Button.get_private]"
        "[Gtk.Button.get_private]")
    [ l1; l2 ]

let test_renamed_method () =
  check_links ~refs:l2 "layer 2" "[method@Gtk.Button.open]"
    "{{!Ocgtk.Button.class-type-button_t.method-open_}[Gtk.Button.open]}";
  check_links ~refs:l1 "layer 1" "[method@Gtk.Button.open]"
    "{{!Ocgtk.Raw.Button.val-open_}[Gtk.Button.open]}"

let test_method_at_one_layer () =
  check_links ~refs:l1 "an out parameter: layer 1 links"
    "[method@Gtk.Button.get_size]"
    "{{!Ocgtk.Raw.Button.val-get_size}[Gtk.Button.get_size]}";
  check_miss "layer 2 has no such method" "[method@Gtk.Button.get_size]"
    Unknown_target

let test_constructor_from_both_layers () =
  check_links ~refs:l2 "layer 2: the module's value" "[ctor@Gtk.Button.new]"
    "{{!Ocgtk.Button.val-new_}[Gtk.Button.new]}";
  check_links ~refs:l1 "layer 1: the external" "[ctor@Gtk.Button.new]"
    "{{!Ocgtk.Raw.Button.val-new_}[Gtk.Button.new]}"

let test_signal_from_both_layers () =
  check_links ~refs:l2 "layer 2" "[signal@Gtk.Button::activate-link]"
    "{{!Ocgtk.Button.class-type-button_t.method-on_activate_link}[Gtk.Button::activate-link]}";
  check_links ~refs:l1 "layer 1" "[signal@Gtk.Button::activate-link]"
    "{{!Ocgtk.Raw.Button.val-on_activate_link}[Gtk.Button::activate-link]}";
  check_links ~refs:l2 "underscores for hyphens"
    "[signal@Gtk.Button::activate_link]"
    "{{!Ocgtk.Button.class-type-button_t.method-on_activate_link}[Gtk.Button::activate_link]}"

let test_property_claimed_getter () =
  check_links ~refs:l2 "layer 2" "[property@Gtk.Button:label]"
    "{{!Ocgtk.Button.class-type-button_t.method-get_label}[Gtk.Button:label]}";
  check_links ~refs:l1 "layer 1" "[property@Gtk.Button:label]"
    "{{!Ocgtk.Raw.Button.val-get_label}[Gtk.Button:label]}"

let test_property_only_getter () =
  check_links ~refs:l2 "layer 2: the property method"
    "[property@Gtk.Button:use-underline]"
    "{{!Ocgtk.Button.class-type-button_t.method-use_underline}[Gtk.Button:use-underline]}";
  check_links ~refs:l1 "layer 1: get_" "[property@Gtk.Button:use-underline]"
    "{{!Ocgtk.Raw.Button.val-get_use_underline}[Gtk.Button:use-underline]}"

let test_property_at_one_layer () =
  check_links ~refs:l1 "layer 1 links the getter"
    "[property@Gtk.MenuButton:direction]"
    "{{!Ocgtk.Raw.Menu_button.val-get_direction}[Gtk.MenuButton:direction]}";
  check_links ~refs:l2 "layer 2 keeps code"
    "[property@Gtk.MenuButton:direction]" "[Gtk.MenuButton:direction]"

let test_relative_member () =
  check_links ~refs:l2 "no namespace: the current one"
    "[method@Button.set_label]"
    "{{!Ocgtk.Button.class-type-button_t.method-set_label}[Button.set_label]}"

let test_enum_member () =
  List.iter
    (fun refs ->
      check_links ~refs "the variant tag" "[enum@Gtk.Orientation.HORIZONTAL]"
        "{{!Ocgtk.Enums.type-orientation.constructor-HORIZONTAL}[Gtk.Orientation.HORIZONTAL]}";
      check_links ~refs "hyphens and lower case"
        "[enum@Gtk.DirectionType.tab-forward]"
        "{{!Ocgtk.Enums.type-directiontype.constructor-TAB_FORWARD}[Gtk.DirectionType.tab-forward]}")
    [ l1; l2 ]

let test_flags_member () =
  check_links ~refs:l2 "the _flag type's tag" "[flags@Gtk.StateFlags.DIR_LTR]"
    "{{!Ocgtk.Enums.type-stateflags_flag.constructor-DIR_LTR}[Gtk.StateFlags.DIR_LTR]}"

let test_member_misses () =
  check_miss "unknown method" "[method@Gtk.Button.nope]" Unknown_target;
  check_miss "member of an unknown type" "[method@Gtk.Nope.show]" Unknown_target;
  check_miss "unknown enum member" "[enum@Gtk.Orientation.DIAGONAL]"
    Unknown_target;
  check_miss "a method fragment naming a type" "[method@Gtk.Button]"
    Unknown_target;
  check_miss "a skipped signal" "[signal@Gtk.Button::get-size]" Unknown_target

(* ---------- other namespaces ------------------------------------ *)

let test_cross_package_type () =
  check_links ~refs:l2 "class of a dependency" "[class@Gdk.Texture]"
    "{{!Ocgdk.Texture.class-type-texture_t}[Gdk.Texture]}";
  check_links ~refs:l1 "from layer 1" "[class@Gdk.Texture]"
    "{{!Ocgdk.Raw.Texture}[Gdk.Texture]}";
  check_links ~refs:l2 "flags type of a dependency" "[flags@Gdk.PaintableFlags]"
    "{{!Ocgdk.Enums.type-paintableflags}[Gdk.PaintableFlags]}";
  check_links ~refs:l2 "constant of a dependency" "[const@Gdk.KEY_a]"
    "{{!Ocgdk.Constants.key_a}[Gdk.KEY_a]}"

(* ---------- endpoint forms -------------------------------------- *)

let test_relative_endpoint () =
  check_links ~refs:l2 "no namespace: the current one" "[class@ToggleButton]"
    "{{!Ocgtk.Toggle_button.class-type-toggle_button_t}[ToggleButton]}"

let test_anchor_dropped () =
  check_links ~refs:l2 "the anchor is not part of the path"
    "[class@Gtk.Button#css-nodes]"
    "{{!Ocgtk.Button.class-type-button_t}[Gtk.Button]}"

let test_backticked_endpoint () =
  check_links ~refs:l2 "backticks around the endpoint are dropped"
    "[class@`Gtk.Button`]" "{{!Ocgtk.Button.class-type-button_t}[Gtk.Button]}"

(* ---------- misses ---------------------------------------------- *)

let test_namespace_not_generated () =
  check_miss "GObject" "[class@GObject.Object]" Namespace_not_generated;
  check_links ~refs:l2 "stays code" "[class@GObject.Object]" "[GObject.Object]"

let test_unknown_target () =
  check_miss "type not in the namespace" "[class@Gtk.Nope]" Unknown_target;
  check_miss "constant not in the namespace" "[const@Gdk.KEY_b]" Unknown_target;
  check_miss "a class fragment naming a member" "[class@Gtk.Button.label]"
    Unknown_target

let test_member_of_other_namespace () =
  check_links ~refs:l2 "a method, layer 2" "[method@Gdk.Surface.beep]"
    "{{!Ocgdk.Surface.class-type-surface_t.method-beep}[Gdk.Surface.beep]}";
  check_links ~refs:l1 "a method, layer 1" "[method@Gdk.Surface.beep]"
    "{{!Ocgdk.Raw.Surface.val-beep}[Gdk.Surface.beep]}";
  check_links ~refs:l2 "a constructor, layer 2" "[ctor@Gdk.Surface.new_popup]"
    "{{!Ocgdk.Surface.val-new_popup}[Gdk.Surface.new_popup]}";
  check_links ~refs:l1 "a constructor, layer 1" "[ctor@Gdk.Surface.new_popup]"
    "{{!Ocgdk.Raw.Surface.val-new_popup}[Gdk.Surface.new_popup]}";
  check_links ~refs:l2 "a signal" "[signal@Gdk.Surface::layout]"
    "{{!Ocgdk.Surface.class-type-surface_t.method-on_layout}[Gdk.Surface::layout]}";
  check_links ~refs:l2 "a property, layer 2" "[property@Gdk.Surface:mapped]"
    "{{!Ocgdk.Surface.class-type-surface_t.method-mapped}[Gdk.Surface:mapped]}";
  check_links ~refs:l1 "a property, layer 1" "[property@Gdk.Surface:mapped]"
    "{{!Ocgdk.Raw.Surface.val-get_mapped}[Gdk.Surface:mapped]}";
  check_links ~refs:l2 "a signal by C type" "#GdkSurface::layout"
    "{{!Ocgdk.Surface.class-type-surface_t.method-on_layout}[GdkSurface::layout]}"

let test_enum_member_of_other_namespace () =
  List.iter
    (fun refs ->
      check_links ~refs "an enumeration member" "[enum@Gdk.Gravity.NORTH_WEST]"
        "{{!Ocgdk.Enums.type-gravity.constructor-NORTH_WEST}[Gdk.Gravity.NORTH_WEST]}";
      check_links ~refs "a bitfield member"
        "[flags@Gdk.PaintableFlags.static-size]"
        "{{!Ocgdk.Enums.type-paintableflags_flag.constructor-STATIC_SIZE}[Gdk.PaintableFlags.static-size]}")
    [ l1; l2 ]

let test_member_misses_in_other_namespace () =
  check_miss "emitted at layer 1 only" "[method@Gdk.Surface.get_scale]"
    Unknown_target;
  check_links ~refs:l1 "which layer 1 links" "[method@Gdk.Surface.get_scale]"
    "{{!Ocgdk.Raw.Surface.val-get_scale}[Gdk.Surface.get_scale]}";
  check_miss "a class with no member tables" "[method@Gdk.Texture.get_width]"
    Unknown_target;
  check_miss "an unknown enumeration member" "[enum@Gdk.Gravity.EAST]"
    Unknown_target

let test_c_symbol_of_other_namespace () =
  check_links ~refs:l2 "a C call, layer 2" "gdk_surface_beep()"
    "{{!Ocgdk.Surface.class-type-surface_t.method-beep}[gdk_surface_beep ()]}";
  check_links ~refs:l1 "a C call, layer 1" "gdk_surface_beep()"
    "{{!Ocgdk.Raw.Surface.val-beep}[gdk_surface_beep ()]}";
  check_links ~refs:l2 "a constructor" "[id@gdk_surface_new_popup]"
    "{{!Ocgdk.Surface.val-new_popup}[gdk_surface_new_popup]}";
  check_miss "a C call emitted at layer 1 only" "gdk_surface_get_scale()"
    Unknown_target;
  check_links ~refs:l2 "an enumeration member" "%GDK_GRAVITY_NORTH_WEST"
    "{{!Ocgdk.Enums.type-gravity.constructor-NORTH_WEST}[GDK_GRAVITY_NORTH_WEST]}";
  check_links ~refs:l2 "a bitfield member" "%GDK_PAINTABLE_STATIC_SIZE"
    "{{!Ocgdk.Enums.type-paintableflags_flag.constructor-STATIC_SIZE}[GDK_PAINTABLE_STATIC_SIZE]}"

let test_members_not_listed () =
  check_miss "a method" "[method@Pango.Layout.get_text]" Members_not_listed;
  check_miss "an enumeration member" "[enum@Pango.WrapMode.WORD]"
    Members_not_listed;
  check_miss "a signal by C type" "#PangoLayout::changed" Members_not_listed;
  check_links ~refs:l2 "its types still link" "[class@Pango.Layout]"
    "{{!Ocpango.Layout.class-type-layout_t}[Pango.Layout]}"

let test_kind_not_generated () =
  List.iter
    (fun gir -> check_miss gir gir Kind_not_generated)
    [
      "[func@Gtk.init]";
      "[callback@Gtk.TickCallback]";
      "[vfunc@Gtk.Widget.measure]";
      "[alias@Gtk.Allocation]";
      "[error@Gtk.BuilderError]";
    ]

let test_no_links () =
  check_links
    ~refs:(Doc_resolve.no_links ~namespace:"Gtk")
    "an empty index links nothing" "[class@Gtk.Button]" "[Gtk.Button]"

let test_class_member_links_nothing () =
  check_links
    ~refs:(Doc_resolve.class_member l2)
    "class type member docs keep code" "[class@Gtk.Button]" "[Gtk.Button]"

(* ---------- sigils and C calls ----------------------------------- *)

let test_hash_type () =
  check_links ~refs:l2 "layer 2: the class type" "#GtkToggleButton"
    "{{!Ocgtk.Toggle_button.class-type-toggle_button_t}[GtkToggleButton]}";
  check_links ~refs:l1 "layer 1: the module" "#GtkToggleButton"
    "{{!Ocgtk.Raw.Toggle_button}[GtkToggleButton]}";
  check_links ~refs:l2 "an enumeration" "#GtkOrientation"
    "{{!Ocgtk.Enums.type-orientation}[GtkOrientation]}";
  check_links ~refs:l2 "another namespace" "#GdkTexture"
    "{{!Ocgdk.Texture.class-type-texture_t}[GdkTexture]}"

let test_hash_member () =
  check_links ~refs:l2 "a signal, layer 2" "#GtkButton::clicked"
    "{{!Ocgtk.Button.class-type-button_t.method-on_clicked}[GtkButton::clicked]}";
  check_links ~refs:l1 "a signal, layer 1" "#GtkButton::clicked"
    "{{!Ocgtk.Raw.Button.val-on_clicked}[GtkButton::clicked]}";
  check_links ~refs:l2 "a property, layer 2" "#GtkButton:label"
    "{{!Ocgtk.Button.class-type-button_t.method-get_label}[GtkButton:label]}";
  check_links ~refs:l1 "a property, layer 1" "#GtkButton:label"
    "{{!Ocgtk.Raw.Button.val-get_label}[GtkButton:label]}";
  check_links ~refs:l2 "a hyphenated signal" "#GtkButton::activate-link"
    "{{!Ocgtk.Button.class-type-button_t.method-on_activate_link}[GtkButton::activate-link]}"

let test_percent_constant () =
  List.iter
    (fun refs ->
      check_links ~refs "the current namespace"
        "%GTK_ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE"
        "{{!Ocgtk.Constants.accessible_attribute_overline_none}[GTK_ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]}";
      check_links ~refs "another namespace" "%GDK_KEY_a"
        "{{!Ocgdk.Constants.key_a}[GDK_KEY_a]}")
    [ l1; l2 ]

let test_percent_enum_member () =
  List.iter
    (fun refs ->
      check_links ~refs "an enumeration member" "%GTK_DIR_TAB_FORWARD"
        "{{!Ocgtk.Enums.type-directiontype.constructor-TAB_FORWARD}[GTK_DIR_TAB_FORWARD]}";
      check_links ~refs "a bitfield member" "%GTK_STATE_FLAG_DIR_LTR"
        "{{!Ocgtk.Enums.type-stateflags_flag.constructor-DIR_LTR}[GTK_STATE_FLAG_DIR_LTR]}")
    [ l1; l2 ]

let test_c_call () =
  check_links ~refs:l2 "a method, layer 2" "gtk_button_set_label()"
    "{{!Ocgtk.Button.class-type-button_t.method-set_label}[gtk_button_set_label \
     ()]}";
  check_links ~refs:l1 "a method, layer 1" "gtk_button_set_label()"
    "{{!Ocgtk.Raw.Button.val-set_label}[gtk_button_set_label ()]}";
  check_links ~refs:l2 "a constructor, layer 2" "gtk_button_new()"
    "{{!Ocgtk.Button.val-new_}[gtk_button_new ()]}";
  check_links ~refs:l1 "a constructor, layer 1" "gtk_button_new()"
    "{{!Ocgtk.Raw.Button.val-new_}[gtk_button_new ()]}";
  check_links ~refs:l1 "layer 1 only" "gtk_button_get_size()"
    "{{!Ocgtk.Raw.Button.val-get_size}[gtk_button_get_size ()]}";
  check_links ~refs:l2 "a method layer 2 drops stays code"
    "gtk_button_get_size()" "[gtk_button_get_size ()]"

let test_id_fragment () =
  check_links ~refs:l2 "a constructor" "[id@gtk_button_new]"
    "{{!Ocgtk.Button.val-new_}[gtk_button_new]}";
  check_links ~refs:l1 "a method" "[id@gtk_button_set_label]"
    "{{!Ocgtk.Raw.Button.val-set_label}[gtk_button_set_label]}"

let test_sigil_misses () =
  check_miss "a C type that is not generated" "#GObject" Unknown_target;
  check_miss "an unknown member of another namespace" "#GdkTexture::changed"
    Unknown_target;
  check_miss "an unknown constant" "%GDK_KEY_b" Unknown_target;
  check_miss "an unknown C call" "gdk_texture_get_width()" Unknown_target;
  check_miss "a filtered method" "gtk_button_get_private()" Unknown_target;
  check_miss "a C call naming an enumeration member" "[id@GTK_DIR_TAB_FORWARD]"
    Unknown_target

(* ---------- nesting and summary --------------------------------- *)

let test_reference_inside_markup () =
  check_links ~refs:l2 "inside bold and list items" "**see [class@Gtk.Button]**"
    "{b see {{!Ocgtk.Button.class-type-button_t}[Gtk.Button]}}"

let test_outcomes_in_document_order () =
  let _, outcomes =
    Doc_resolve.resolve l2
      (Doc_translate.parse Doc_translate.Member
         "[class@Gtk.Button] then [func@Gtk.init]\n\n- [const@Gdk.KEY_a]")
  in
  Alcotest.(check (list string))
    "one outcome per reference, in order"
    [ "Gtk.Button"; "Gtk.init"; "Gdk.KEY_a" ]
    (List.map (fun (o : Doc_resolve.outcome) -> o.endpoint) outcomes)

let test_summary () =
  let _, outcomes =
    Doc_resolve.resolve l2
      (Doc_translate.parse Doc_translate.Member
         "[class@Gtk.Button] [class@Gtk.Nope] [func@Gtk.init]")
  in
  let summary = Fmt.str "%a" Doc_resolve.pp_summary outcomes in
  List.iter
    (fun sub ->
      Alcotest.(check bool)
        sub true
        (Re.execp (Re.compile (Re.str sub)) summary))
    [
      "Doc references: 3, 1 linked";
      "class 2: linked 1, unknown-target 1";
      "func 1: kind-not-generated 1";
      "unknown targets: class@Gtk.Nope";
    ]

let tests =
  [
    ("class from both layers", `Quick, test_class_from_both_layers);
    ("interface from both layers", `Quick, test_interface_from_both_layers);
    ("record links like a class", `Quick, test_record_links_like_a_class);
    ("enum and flags from both layers", `Quick, test_enum_same_from_both_layers);
    ("constant from both layers", `Quick, test_constant_same_from_both_layers);
    ( "type fragment takes its kind from the index",
      `Quick,
      test_type_fragment_takes_kind_from_index );
    ("cross-package types and constants", `Quick, test_cross_package_type);
    ("relative endpoint", `Quick, test_relative_endpoint);
    ("anchor dropped", `Quick, test_anchor_dropped);
    ("backticked endpoint", `Quick, test_backticked_endpoint);
    ("namespace not generated", `Quick, test_namespace_not_generated);
    ("unknown target", `Quick, test_unknown_target);
    ("method from both layers", `Quick, test_method_from_both_layers);
    ("filtered method", `Quick, test_filtered_method);
    ("renamed method", `Quick, test_renamed_method);
    ("method at one layer", `Quick, test_method_at_one_layer);
    ("constructor from both layers", `Quick, test_constructor_from_both_layers);
    ("signal from both layers", `Quick, test_signal_from_both_layers);
    ("property claimed by a getter", `Quick, test_property_claimed_getter);
    ("property-only getter", `Quick, test_property_only_getter);
    ("property accessors at one layer", `Quick, test_property_at_one_layer);
    ("relative member endpoint", `Quick, test_relative_member);
    ("enum member", `Quick, test_enum_member);
    ("flags member", `Quick, test_flags_member);
    ("member misses", `Quick, test_member_misses);
    ("#Type", `Quick, test_hash_type);
    ("#Type:prop and #Type::sig", `Quick, test_hash_member);
    ("%CONSTANT", `Quick, test_percent_constant);
    ("%ENUM_MEMBER", `Quick, test_percent_enum_member);
    ("C call", `Quick, test_c_call);
    ("id fragment", `Quick, test_id_fragment);
    ("sigil misses", `Quick, test_sigil_misses);
    ("member of another namespace", `Quick, test_member_of_other_namespace);
    ( "enum member of another namespace",
      `Quick,
      test_enum_member_of_other_namespace );
    ( "member misses in another namespace",
      `Quick,
      test_member_misses_in_other_namespace );
    ("C symbol of another namespace", `Quick, test_c_symbol_of_other_namespace);
    ("members not listed", `Quick, test_members_not_listed);
    ("kind not generated", `Quick, test_kind_not_generated);
    ("empty index links nothing", `Quick, test_no_links);
    ("class member docs link nothing", `Quick, test_class_member_links_nothing);
    ("reference inside markup", `Quick, test_reference_inside_markup);
    ("outcomes in document order", `Quick, test_outcomes_in_document_order);
    ("summary", `Quick, test_summary);
  ]
