/* test_signal_widget_stubs.c — C stubs for cross-namespace signal emission
 *
 * Provides ml_test_emit_key_pressed_signal, which emits the "key-pressed"
 * signal on a GtkEventControllerKey with the given keyval, keycode, and
 * modifier state.  The return value is the gboolean from the signal handler
 * chain, converted to an OCaml bool.
 *
 * This stub uses g_signal_lookup + g_signal_emitv so we can construct the
 * parameter array from OCaml values and verify cross-namespace flags
 * marshalling (GdkModifierType is defined in GDK, not GTK).
 */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/fail.h>

/* Forward-declare the OCaml GObject pointer extractor (from ml_gobject.c,
 * part of ocgtk.common, linked at test time). */
extern gpointer ml_gobject_ext_of_val(value v);

CAMLprim value ml_test_emit_key_pressed_signal(value ctrl_val,
                                                value keyval_val,
                                                value keycode_val,
                                                value state_val)
{
    CAMLparam4(ctrl_val, keyval_val, keycode_val, state_val);

    GObject *instance = G_OBJECT(ml_gobject_ext_of_val(ctrl_val));

    /* Look up the "key-pressed" signal on the EventControllerKey type. */
    guint signal_id = g_signal_lookup("key-pressed", G_OBJECT_TYPE(instance));
    if (signal_id == 0) {
        caml_failwith("ml_test_emit_key_pressed_signal: signal 'key-pressed' not found");
    }

    /* Resolve GdkModifierType GType for the flags parameter. */
    GType modifiertype_id = g_type_from_name("GdkModifierType");

    /* Build parameter array: instance, keyval (uint), keycode (uint),
     * state (GdkModifierType flags). */
    GValue params[4] = {G_VALUE_INIT, G_VALUE_INIT, G_VALUE_INIT, G_VALUE_INIT};

    g_value_init(&params[0], G_OBJECT_TYPE(instance));
    g_value_set_object(&params[0], instance);

    g_value_init(&params[1], G_TYPE_UINT);
    g_value_set_uint(&params[1], (guint)Int_val(keyval_val));

    g_value_init(&params[2], G_TYPE_UINT);
    g_value_set_uint(&params[2], (guint)Int_val(keycode_val));

    g_value_init(&params[3], modifiertype_id);
    g_value_set_flags(&params[3], Int_val(state_val));

    GValue return_value = G_VALUE_INIT;
    g_value_init(&return_value, G_TYPE_BOOLEAN);

    g_signal_emitv(params, signal_id, 0, &return_value);

    gboolean result = g_value_get_boolean(&return_value);

    /* Clean up all GValues */
    g_value_unset(&params[0]);
    g_value_unset(&params[1]);
    g_value_unset(&params[2]);
    g_value_unset(&params[3]);
    g_value_unset(&return_value);

    CAMLreturn(Val_bool(result));
}