(** A [GPropertyAction] is a way to get a [Gio.Action] with a state value
    reflecting and controlling the value of a [GObject.Object] property.

    Its methods, signals and properties are on {!class-type-property_action_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Property_action}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PropertyAction].}

    Implements:
    - {{!Ocgio.Action.class-type-action_t}Ocgio.Action}

    A [GPropertyAction] is a way to get a [Gio.Action] with a state value
    reflecting and controlling the value of a [GObject.Object] property.

    The state of the action will correspond to the value of the property.
    Changing it will change the property (assuming the requested value matches
    the requirements as specified in the [GObject.ParamSpec]).

    Only the most common types are presently supported. Booleans are mapped to
    booleans, strings to strings, signed/unsigned integers to int32/uint32 and
    floats and doubles to doubles.

    If the property is an enum then the state will be string-typed and
    conversion will automatically be performed between the enum value and ‘nick’
    string as per the [GObject.EnumValue] table.

    Flags types are not currently supported.

    Properties of object types, boxed types and pointer types are not supported
    and probably never will be.

    Properties of [GLib.Variant] types are not currently supported.

    If the property is boolean-valued then the action will have a [NULL]
    parameter type, and activating the action (with no parameter) will toggle
    the value of the property.

    In all other cases, the parameter type will correspond to the type of the
    property.

    The general idea here is to reduce the number of locations where a
    particular piece of state is kept (and therefore has to be synchronised
    between). [GPropertyAction] does not have a separate state that is kept in
    sync with the property value — its state is the property value.

    For example, it might be useful to create a [Gio.Action] corresponding to
    the [visible-child-name] property of a
    {{:https://docs.gtk.org/gtk4/class.Stack.html}[GtkStack]} so that the
    current page can be switched from a menu. The active radio indication in the
    menu is then directly determined from the active page of the [GtkStack].

    An anti-example would be binding the [active-id] property on a
    {{:https://docs.gtk.org/gtk4/class.ComboBox.html}[GtkComboBox]}. This is
    because the state of the combo box itself is probably uninteresting and is
    actually being used to control something else.

    Another anti-example would be to bind to the [visible-child-name] property
    of a {{:https://docs.gtk.org/gtk4/class.Stack.html}[GtkStack]} if this value
    is actually stored in [Gio.Settings]. In that case, the real source of the
    value is* [Gio.Settings]. If you want a [Gio.Action] to control a setting
    stored in [Gio.Settings], see [Gio.Settings.create_action] instead, and
    possibly combine its use with [Gio.Settings.bind]. *)
class type property_action_t = object
  inherit Action.action_t

  (** {2:properties Properties} *)

  method enabled : bool
  (** If [action] is currently enabled.

      If the action is disabled then calls to g_action_activate() and
      g_action_change_state() have no effect. *)

  method invert_boolean : bool
  (** If [TRUE], the state of the action will be the negation of the property
      value, provided the property is boolean. *)

  method name : string
  (** The name of the action. This is mostly meaningful for identifying the
      action once it has been added to a [GActionMap]. *)

  method parameter_type : Gvariant_type.t
  (** The type of the parameter that must be given when activating the action.
  *)

  method state : Gvariant.t
  (** The state of the action, or [NULL] if the action is stateless. *)

  method state_type : Gvariant_type.t
  (** The [GVariantType] of the state that the action has, or [NULL] if the
      action is stateless. *)

  (** {2:conversions Conversions} *)

  method as_property_action : Raw.Property_action.t
end

class property_action : Raw.Property_action.t -> property_action_t
(** Wraps a raw handle of {!Ocgio.Raw.Property_action.t}. *)

(** {1:description Description}

    A [GPropertyAction] is a way to get a [Gio.Action] with a state value
    reflecting and controlling the value of a [GObject.Object] property.

    The state of the action will correspond to the value of the property.
    Changing it will change the property (assuming the requested value matches
    the requirements as specified in the [GObject.ParamSpec]).

    Only the most common types are presently supported. Booleans are mapped to
    booleans, strings to strings, signed/unsigned integers to int32/uint32 and
    floats and doubles to doubles.

    If the property is an enum then the state will be string-typed and
    conversion will automatically be performed between the enum value and ‘nick’
    string as per the [GObject.EnumValue] table.

    Flags types are not currently supported.

    Properties of object types, boxed types and pointer types are not supported
    and probably never will be.

    Properties of [GLib.Variant] types are not currently supported.

    If the property is boolean-valued then the action will have a [NULL]
    parameter type, and activating the action (with no parameter) will toggle
    the value of the property.

    In all other cases, the parameter type will correspond to the type of the
    property.

    The general idea here is to reduce the number of locations where a
    particular piece of state is kept (and therefore has to be synchronised
    between). [GPropertyAction] does not have a separate state that is kept in
    sync with the property value — its state is the property value.

    For example, it might be useful to create a [Gio.Action] corresponding to
    the [visible-child-name] property of a
    {{:https://docs.gtk.org/gtk4/class.Stack.html}[GtkStack]} so that the
    current page can be switched from a menu. The active radio indication in the
    menu is then directly determined from the active page of the [GtkStack].

    An anti-example would be binding the [active-id] property on a
    {{:https://docs.gtk.org/gtk4/class.ComboBox.html}[GtkComboBox]}. This is
    because the state of the combo box itself is probably uninteresting and is
    actually being used to control something else.

    Another anti-example would be to bind to the [visible-child-name] property
    of a {{:https://docs.gtk.org/gtk4/class.Stack.html}[GtkStack]} if this value
    is actually stored in [Gio.Settings]. In that case, the real source of the
    value is* [Gio.Settings]. If you want a [Gio.Action] to control a setting
    stored in [Gio.Settings], see [Gio.Settings.create_action] instead, and
    possibly combine its use with [Gio.Settings.bind]. *)

(** {1:constructors Constructors} *)

val new_ : string -> [ `object_ ] Gobject.obj -> string -> property_action_t
(** Creates a [GAction] corresponding to the value of property [property_name]
    on [object].

    The property must be existent and readable and writable (and not
    construct-only).

    This function takes a reference on [object] and doesn't release it until the
    action is destroyed. *)
