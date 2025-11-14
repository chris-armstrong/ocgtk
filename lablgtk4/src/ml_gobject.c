/**************************************************************************/
/*                LablGTK4 - OCaml bindings for GTK4                      */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
/*                                                                        */
/**************************************************************************/

/* Full GObject C bindings for LablGTK4 - Phase 2.2
 *
 * This file provides comprehensive GObject functionality:
 * - Object reference counting
 * - Type system queries
 * - GValue handling (all standard types)
 * - Property get/set
 * - Signal connection/disconnection
 * - Closure marshalling
 */

#include <string.h>
#include <glib.h>
#include <glib-object.h>
#include <gtk/gtk.h>

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/custom.h>

#include "wrappers.h"
#include "gobject_tags.h"

/* ==================================================================== */
/* GObject Reference Counting */
/* ==================================================================== */

CAMLprim value ml_g_object_ref(value obj)
{
    if (obj == Val_unit || Pointer_val(obj) == NULL)
        caml_invalid_argument("g_object_ref: NULL object");

    g_object_ref(Pointer_val(obj));
    return Val_unit;
}

CAMLprim value ml_g_object_unref(value obj)
{
    if (obj == Val_unit || Pointer_val(obj) == NULL)
        return Val_unit;

    g_object_unref(Pointer_val(obj));
    return Val_unit;
}

CAMLprim value ml_g_object_get_ref_count(value obj)
{
    if (obj == Val_unit || Pointer_val(obj) == NULL)
        caml_invalid_argument("g_object_get_ref_count: NULL object");

    GObject *gobj = G_OBJECT(Pointer_val(obj));
    return Val_int(gobj->ref_count);
}

/* ==================================================================== */
/* Type System Queries */
/* ==================================================================== */

CAMLprim value ml_g_object_get_type(value obj)
{
    CAMLparam1(obj);
    GObject *gobj;

    if (obj == Val_unit || Pointer_val(obj) == NULL)
        caml_invalid_argument("g_object_get_type: NULL object");

    gobj = G_OBJECT(Pointer_val(obj));
    CAMLreturn(Val_long(G_OBJECT_TYPE(gobj)));
}

CAMLprim value ml_g_type_name(value type)
{
    const char *name = g_type_name(Long_val(type));
    if (name == NULL)
        return caml_copy_string("<invalid type>");
    return caml_copy_string(name);
}

CAMLprim value ml_g_type_from_name(value name)
{
    GType type = g_type_from_name(String_val(name));
    return Val_long(type);
}

CAMLprim value ml_g_type_parent(value type)
{
    GType parent = g_type_parent(Long_val(type));
    return Val_long(parent);
}

CAMLprim value ml_g_type_is_a(value type, value is_a_type)
{
    gboolean result = g_type_is_a(Long_val(type), Long_val(is_a_type));
    return Val_bool(result);
}

CAMLprim value ml_g_type_fundamental(value type)
{
    GType fund = G_TYPE_FUNDAMENTAL(Long_val(type));
    /* Map GType fundamentals to our enum */
    if (fund == G_TYPE_INVALID) return Val_int(0);
    if (fund == G_TYPE_NONE) return Val_int(1);
    if (fund == G_TYPE_INTERFACE) return Val_int(2);
    if (fund == G_TYPE_CHAR) return Val_int(3);
    if (fund == G_TYPE_UCHAR) return Val_int(4);
    if (fund == G_TYPE_BOOLEAN) return Val_int(5);
    if (fund == G_TYPE_INT) return Val_int(6);
    if (fund == G_TYPE_UINT) return Val_int(7);
    if (fund == G_TYPE_LONG) return Val_int(8);
    if (fund == G_TYPE_ULONG) return Val_int(9);
    if (fund == G_TYPE_INT64) return Val_int(10);
    if (fund == G_TYPE_UINT64) return Val_int(11);
    if (fund == G_TYPE_ENUM) return Val_int(12);
    if (fund == G_TYPE_FLAGS) return Val_int(13);
    if (fund == G_TYPE_FLOAT) return Val_int(14);
    if (fund == G_TYPE_DOUBLE) return Val_int(15);
    if (fund == G_TYPE_STRING) return Val_int(16);
    if (fund == G_TYPE_POINTER) return Val_int(17);
    if (fund == G_TYPE_BOXED) return Val_int(18);
    if (fund == G_TYPE_PARAM) return Val_int(19);
    if (fund == G_TYPE_OBJECT) return Val_int(20);
    return Val_int(0); /* INVALID */
}

CAMLprim value ml_g_type_of_fundamental(value fund_int)
{
    int fund = Int_val(fund_int);
    GType type = G_TYPE_INVALID;

    switch (fund) {
        case 0: type = G_TYPE_INVALID; break;
        case 1: type = G_TYPE_NONE; break;
        case 2: type = G_TYPE_INTERFACE; break;
        case 3: type = G_TYPE_CHAR; break;
        case 4: type = G_TYPE_UCHAR; break;
        case 5: type = G_TYPE_BOOLEAN; break;
        case 6: type = G_TYPE_INT; break;
        case 7: type = G_TYPE_UINT; break;
        case 8: type = G_TYPE_LONG; break;
        case 9: type = G_TYPE_ULONG; break;
        case 10: type = G_TYPE_INT64; break;
        case 11: type = G_TYPE_UINT64; break;
        case 12: type = G_TYPE_ENUM; break;
        case 13: type = G_TYPE_FLAGS; break;
        case 14: type = G_TYPE_FLOAT; break;
        case 15: type = G_TYPE_DOUBLE; break;
        case 16: type = G_TYPE_STRING; break;
        case 17: type = G_TYPE_POINTER; break;
        case 18: type = G_TYPE_BOXED; break;
        case 19: type = G_TYPE_PARAM; break;
        case 20: type = G_TYPE_OBJECT; break;
    }

    return Val_long(type);
}

/* ==================================================================== */
/* GValue Handling */
/* ==================================================================== */

/* Wrapper to track GValue initialization state */
typedef struct {
    GValue gvalue;
    int initialized;
} ml_gvalue;

/* Custom block operations for GValue */
static void finalize_gvalue(value val)
{
    ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(val);
    /* Only unset if the GValue has been initialized */
    if (mlgv->initialized) {
        g_value_unset(&mlgv->gvalue);
        mlgv->initialized = 0;
    }
}

static struct custom_operations gvalue_ops = {
    "org.lablgtk.gvalue",
    finalize_gvalue,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

CAMLprim value ml_g_value_new(void)
{
    CAMLparam0();
    CAMLlocal1(val);

    val = caml_alloc_custom(&gvalue_ops, sizeof(ml_gvalue), 0, 1);
    ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(val);
    memset(&mlgv->gvalue, 0, sizeof(GValue));
    mlgv->initialized = 0;

    CAMLreturn(val);
}

GValue *GValue_val(value val)
{
    ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(val);
    return &mlgv->gvalue;
}

CAMLprim value ml_g_value_init_gtype(value val, value gtype)
{
    ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(val);
    g_value_init(&mlgv->gvalue, (GType)Long_val(gtype));
    mlgv->initialized = 1;
    return Val_unit;
}

CAMLprim value ml_g_value_reset(value val)
{
    ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(val);
    if (mlgv->initialized) {
        g_value_reset(&mlgv->gvalue);
    }
    return Val_unit;
}

CAMLprim value ml_g_value_get_gtype(value val)
{
    GValue *gv = GValue_val(val);
    return Val_long(G_VALUE_TYPE(gv));
}

/* Type-specific getters/setters */

CAMLprim value ml_g_value_get_int(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_INT(gv))
        caml_invalid_argument("g_value_get_int: not an int");
    return Val_int(g_value_get_int(gv));
}

CAMLprim value ml_g_value_set_int(value val, value i)
{
    GValue *gv = GValue_val(val);
    g_value_set_int(gv, Int_val(i));
    return Val_unit;
}

CAMLprim value ml_g_value_get_boolean(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_BOOLEAN(gv))
        caml_invalid_argument("g_value_get_boolean: not a boolean");
    return Val_bool(g_value_get_boolean(gv));
}

CAMLprim value ml_g_value_set_boolean(value val, value b)
{
    GValue *gv = GValue_val(val);
    g_value_set_boolean(gv, Bool_val(b));
    return Val_unit;
}

CAMLprim value ml_g_value_get_string(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_STRING(gv))
        caml_invalid_argument("g_value_get_string: not a string");

    const char *str = g_value_get_string(gv);
    if (str == NULL)
        return caml_copy_string("");
    return caml_copy_string(str);
}

CAMLprim value ml_g_value_set_string(value val, value str)
{
    GValue *gv = GValue_val(val);
    g_value_set_string(gv, String_val(str));
    return Val_unit;
}

CAMLprim value ml_g_value_get_float(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_FLOAT(gv))
        caml_invalid_argument("g_value_get_float: not a float");
    return caml_copy_double(g_value_get_float(gv));
}

CAMLprim value ml_g_value_set_float(value val, value f)
{
    GValue *gv = GValue_val(val);
    g_value_set_float(gv, (float)Double_val(f));
    return Val_unit;
}

CAMLprim value ml_g_value_get_double(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_DOUBLE(gv))
        caml_invalid_argument("g_value_get_double: not a double");
    return caml_copy_double(g_value_get_double(gv));
}

CAMLprim value ml_g_value_set_double(value val, value d)
{
    GValue *gv = GValue_val(val);
    g_value_set_double(gv, Double_val(d));
    return Val_unit;
}

CAMLprim value ml_g_value_get_object(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_OBJECT(gv))
        caml_invalid_argument("g_value_get_object: not an object");

    GObject *obj = g_value_get_object(gv);
    if (obj == NULL)
        caml_failwith("g_value_get_object: NULL object");

    return Val_pointer(obj);
}

CAMLprim value ml_g_value_set_object(value val, value obj)
{
    GValue *gv = GValue_val(val);
    GObject *gobj = NULL;

    if (obj != Val_unit && Pointer_val(obj) != NULL)
        gobj = G_OBJECT(Pointer_val(obj));

    g_value_set_object(gv, gobj);
    return Val_unit;
}

/* ==================================================================== */
/* Property Operations */
/* ==================================================================== */

CAMLprim value ml_g_object_get_property(value obj, value prop_name, value val)
{
    GObject *gobj = G_OBJECT(Pointer_val(obj));
    GValue *gv = GValue_val(val);
    const char *name = String_val(prop_name);

    g_object_get_property(gobj, name, gv);
    return Val_unit;
}

CAMLprim value ml_g_object_set_property(value obj, value prop_name, value val)
{
    GObject *gobj = G_OBJECT(Pointer_val(obj));
    GValue *gv = GValue_val(val);
    const char *name = String_val(prop_name);

    g_object_set_property(gobj, name, gv);
    return Val_unit;
}

CAMLprim value ml_g_object_get_property_type(value obj, value prop_name)
{
    GObject *gobj = G_OBJECT(Pointer_val(obj));
    const char *name = String_val(prop_name);

    GParamSpec *pspec = g_object_class_find_property(
        G_OBJECT_GET_CLASS(gobj), name);

    if (pspec == NULL) {
        char msg[256];
        snprintf(msg, sizeof(msg), "Property '%s' not found", name);
        caml_invalid_argument(msg);
    }

    return Val_long(pspec->value_type);
}

CAMLprim value ml_g_object_freeze_notify(value obj)
{
    g_object_freeze_notify(G_OBJECT(Pointer_val(obj)));
    return Val_unit;
}

CAMLprim value ml_g_object_thaw_notify(value obj)
{
    g_object_thaw_notify(G_OBJECT(Pointer_val(obj)));
    return Val_unit;
}

CAMLprim value ml_g_object_notify(value obj, value prop_name)
{
    g_object_notify(G_OBJECT(Pointer_val(obj)), String_val(prop_name));
    return Val_unit;
}

/* ==================================================================== */
/* Closure Support */
/* ==================================================================== */

/* GClosure integration with OCaml callbacks
 *
 * IMPORTANT: We allocate separate storage for the OCaml callback value and
 * register that storage as a global root, rather than registering &closure->data.
 *
 * This avoids a race condition during program exit:
 * - If we register &closure->data (which points INTO the GClosure struct),
 *   and GLib frees the GClosure before OCaml GC finishes scanning global roots,
 *   the GC will try to access freed memory → segfault
 * - By allocating our own storage, we control when it's freed (after unregistering)
 *
 * This pattern is essential for any C library that stores OCaml callbacks.
 */

/* Custom block for GClosure - NO finalizer to avoid GC race conditions
 *
 * Why no finalizer?
 * - Finalizers run during GC
 * - If finalizer calls g_closure_unref -> ml_closure_invalidate -> caml_remove_global_root
 * - This modifies global roots list WHILE GC is scanning it -> corruption/segfault
 *
 * Trade-off: Small memory leak (GClosures + callback_storage never freed)
 * This is acceptable for GUI apps where closures live for app lifetime
 */
static struct custom_operations ml_custom_GClosure = {
    "GClosure/4.0/",
    NULL,  /* No finalizer - intentional leak to avoid GC race */
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

/* Wrap GClosure with ref and sink */
static value Val_GClosure_sink(GClosure *closure)
{
    CAMLparam0();
    CAMLlocal1(ret);

    if (!closure) {
        caml_failwith("Val_GClosure_sink: NULL closure");
    }

    /* Ref and sink the closure */
    g_closure_ref(closure);
    g_closure_sink(closure);

    /* Create custom block WITHOUT finalizer */
    ret = caml_alloc_custom(&ml_custom_GClosure, sizeof(GClosure*), 0, 0);
    *((GClosure**)Data_custom_val(ret)) = closure;

    CAMLreturn(ret);
}

/* Invalidate notifier - called when GLib destroys the closure
 *
 * The data parameter is a pointer to our allocated storage (value*) that
 * we registered as a global root. We can safely clean it up here.
 */
static void ml_closure_invalidate(gpointer data, GClosure *closure)
{
    (void)closure;  /* Unused parameter */

    if (data == NULL) return;

    value *callback_storage = (value*)data;

    /* Remove from global roots - this is safe because:
     * 1. OCaml's runtime lock protects the global roots list
     * 2. If GC is scanning roots, it will finish before we modify the list
     * 3. We're not touching closure->data (which GLib may have already freed)
     */
    caml_remove_global_root(callback_storage);

    /* Now safe to free our storage */
    free(callback_storage);
}

/* Marshaller that invokes OCaml callback */
static void ml_closure_marshal(GClosure *closure,
                                 GValue *return_value,
                                 guint n_params,
                                 const GValue *param_values,
                                 gpointer invocation_hint,
                                 gpointer marshal_data)
{
    CAMLparam0();
    CAMLlocal2(argv_val, result_val);

    /* Get the OCaml callback from our allocated storage */
    value *callback_storage = (value*)closure->data;
    if (callback_storage == NULL) {
        CAMLreturn0;
    }
    value callback = *callback_storage;

    /* Create argv record: { result; nargs; args } */
    argv_val = caml_alloc(3, 0);

    /* Wrap return_value - create an ml_gvalue wrapper */
    result_val = ml_g_value_new();
    ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(result_val);

    if (return_value != NULL && G_IS_VALUE(return_value)) {
        /* Properly initialize and deep copy the GValue */
        g_value_init(&mlgv->gvalue, G_VALUE_TYPE(return_value));
        g_value_copy(return_value, &mlgv->gvalue);
        mlgv->initialized = 1;
    }
    Store_field(argv_val, 0, result_val);

    /* nargs */
    Store_field(argv_val, 1, Val_int(n_params));

    /* args - store pointer to param_values array directly as a value
     * IMPORTANT: This pointer is only valid during this marshaller callback.
     * The OCaml callback MUST NOT store argv_val for later use - it must
     * access all parameters synchronously during the callback invocation.
     * Storing and accessing argv_val later will cause use-after-free.
     */
    Store_field(argv_val, 2, (value)param_values);

    /* Call OCaml callback */
    value result = caml_callback_exn(callback, argv_val);

    /* Copy result back if needed */
    if (return_value != NULL && G_IS_VALUE(return_value)) {
        ml_gvalue *result_mlgv = (ml_gvalue *)Data_custom_val(result_val);
        if (result_mlgv->initialized && G_IS_VALUE(&result_mlgv->gvalue)) {
            g_value_copy(&result_mlgv->gvalue, return_value);
        }
    }

    CAMLreturn0;
}

CAMLprim value ml_g_closure_new(value callback)
{
    CAMLparam1(callback);

    /* Allocate separate storage for the OCaml callback value
     * This memory is owned by us, not by GLib, so we control when it's freed
     */
    value *callback_storage = (value*)malloc(sizeof(value));
    if (callback_storage == NULL) {
        caml_failwith("ml_g_closure_new: failed to allocate callback storage");
    }

    /* Store the callback value in our allocated storage */
    *callback_storage = callback;

    /* Register our storage as a global root to prevent GC of the callback
     * This is safe because we control the lifetime of callback_storage
     */
    caml_register_global_root(callback_storage);

    /* Create GClosure with pointer to our storage as data */
    GClosure *closure = g_closure_new_simple(sizeof(GClosure), (gpointer)callback_storage);

    /* Set up marshaller only - NO invalidate notifier
     *
     * Why no invalidate notifier?
     * - It would call caml_remove_global_root during GClosure destruction
     * - This can happen during OCaml GC (via finalizer) or during program exit
     * - Modifying global roots during GC scan causes corruption
     *
     * Result: callback_storage and GClosure are never freed (small leak)
     * This is safe because callback_storage points to valid memory we control
     */
    g_closure_set_marshal(closure, ml_closure_marshal);

    /* Wrap with custom block */
    CAMLreturn(Val_GClosure_sink(closure));
}

/* Access closure arguments
 * WARNING: argv_val contains a pointer to param_values which is only valid
 * during the marshaller callback. This function MUST only be called from
 * within the closure callback, never after the callback has returned.
 */
CAMLprim value ml_g_closure_get_arg(value argv_val, value pos)
{
    CAMLparam2(argv_val, pos);
    CAMLlocal1(result);

    const GValue *param_values = (const GValue *)Field(argv_val, 2);
    int index = Int_val(pos);
    int nargs = Int_val(Field(argv_val, 1));

    /* Validate pointer is not NULL (basic sanity check) */
    if (param_values == NULL)
        caml_invalid_argument("closure_get_arg: invalid argv (param_values is NULL)");

    if (index < 0 || index >= nargs)
        caml_invalid_argument("closure_get_arg: index out of bounds");

    /* Create OCaml GValue wrapper and copy the parameter */
    result = ml_g_value_new();
    ml_gvalue *mlgv = (ml_gvalue *)Data_custom_val(result);

    /* Initialize the destination GValue with the same type */
    g_value_init(&mlgv->gvalue, G_VALUE_TYPE(&param_values[index]));

    /* Deep copy the GValue contents */
    g_value_copy(&param_values[index], &mlgv->gvalue);

    mlgv->initialized = 1;  /* Mark as initialized */

    CAMLreturn(result);
}

CAMLprim value ml_g_closure_get_result(value argv_val)
{
    return Field(argv_val, 0);
}

CAMLprim value ml_g_closure_get_result_type(value argv_val)
{
    GValue *gv = GValue_val(Field(argv_val, 0));
    return Val_long(G_VALUE_TYPE(gv));
}

CAMLprim value ml_g_closure_get_arg_type(value argv_val, value pos)
{
    const GValue *param_values = (const GValue *)Pointer_val(Field(argv_val, 2));
    int index = Int_val(pos);
    return Val_long(G_VALUE_TYPE(&param_values[index]));
}

CAMLprim value ml_g_closure_set_result(value argv_val, value new_result)
{
    GValue *result_gv = GValue_val(Field(argv_val, 0));
    GValue *new_gv = GValue_val(new_result);

    if (G_IS_VALUE(result_gv) && G_IS_VALUE(new_gv)) {
        g_value_copy(new_gv, result_gv);
    }

    return Val_unit;
}

/* ==================================================================== */
/* Signal Operations */
/* ==================================================================== */

CAMLprim value ml_g_signal_connect_closure(value obj, value signal_name,
                                            value closure, value after)
{
    GObject *gobj = G_OBJECT(Pointer_val(obj));
    GClosure *gclosure = (GClosure *)Pointer_val(closure);
    const char *name = String_val(signal_name);
    gboolean after_flag = Bool_val(after);

    gulong handler_id = g_signal_connect_closure(gobj, name, gclosure, after_flag);

    return Val_long(handler_id);
}

CAMLprim value ml_g_signal_handler_disconnect(value obj, value handler_id)
{
    g_signal_handler_disconnect(G_OBJECT(Pointer_val(obj)), Long_val(handler_id));
    return Val_unit;
}

CAMLprim value ml_g_signal_handler_block(value obj, value handler_id)
{
    g_signal_handler_block(G_OBJECT(Pointer_val(obj)), Long_val(handler_id));
    return Val_unit;
}

CAMLprim value ml_g_signal_handler_unblock(value obj, value handler_id)
{
    g_signal_handler_unblock(G_OBJECT(Pointer_val(obj)), Long_val(handler_id));
    return Val_unit;
}

CAMLprim value ml_g_signal_handler_is_connected(value obj, value handler_id)
{
    gboolean connected = g_signal_handler_is_connected(
        G_OBJECT(Pointer_val(obj)), Long_val(handler_id));
    return Val_bool(connected);
}

CAMLprim value ml_g_signal_emit_by_name(value obj, value signal_name)
{
    g_signal_emit_by_name(G_OBJECT(Pointer_val(obj)), String_val(signal_name));
    return Val_unit;
}

/* ==================================================================== */
/* Test Helpers for Closure Invocation */
/* ==================================================================== */

/* Test helper to directly invoke a closure with no arguments and no return value */
CAMLprim value ml_test_invoke_closure_void(value closure_val)
{
    CAMLparam1(closure_val);
    GClosure *closure = GClosure_val(closure_val);

    /* Invoke the closure with no parameters and no return value */
    g_closure_invoke(closure, NULL, 0, NULL, NULL);

    CAMLreturn(Val_unit);
}

/* Test helper to invoke a closure with an integer argument */
CAMLprim value ml_test_invoke_closure_int(value closure_val, value arg_val)
{
    CAMLparam2(closure_val, arg_val);
    GClosure *closure = GClosure_val(closure_val);
    GValue param = G_VALUE_INIT;

    /* Set up the parameter */
    g_value_init(&param, G_TYPE_INT);
    g_value_set_int(&param, Int_val(arg_val));

    /* Invoke the closure with no return value */
    g_closure_invoke(closure, NULL, 1, &param, NULL);

    /* Clean up */
    g_value_unset(&param);

    CAMLreturn(Val_unit);
}

/* Test helper to invoke a closure with a string argument */
CAMLprim value ml_test_invoke_closure_string(value closure_val, value arg_val)
{
    CAMLparam2(closure_val, arg_val);
    GClosure *closure = GClosure_val(closure_val);
    GValue param = G_VALUE_INIT;

    /* Set up the parameter */
    g_value_init(&param, G_TYPE_STRING);
    g_value_set_string(&param, String_val(arg_val));

    /* Invoke the closure with no return value */
    g_closure_invoke(closure, NULL, 1, &param, NULL);

    /* Clean up */
    g_value_unset(&param);

    CAMLreturn(Val_unit);
}

/* Test helper to invoke a closure with two integer arguments */
CAMLprim value ml_test_invoke_closure_two_ints(value closure_val, value arg1_val, value arg2_val)
{
    CAMLparam3(closure_val, arg1_val, arg2_val);
    GClosure *closure = GClosure_val(closure_val);
    GValue params[2] = {G_VALUE_INIT, G_VALUE_INIT};

    /* Set up the parameters */
    g_value_init(&params[0], G_TYPE_INT);
    g_value_set_int(&params[0], Int_val(arg1_val));

    g_value_init(&params[1], G_TYPE_INT);
    g_value_set_int(&params[1], Int_val(arg2_val));

    /* Invoke the closure with no return value */
    g_closure_invoke(closure, NULL, 2, params, NULL);

    /* Clean up */
    g_value_unset(&params[0]);
    g_value_unset(&params[1]);

    CAMLreturn(Val_unit);
}

/* Test helper to invoke a closure with a boolean argument */
CAMLprim value ml_test_invoke_closure_boolean(value closure_val, value arg_val)
{
    CAMLparam2(closure_val, arg_val);
    GClosure *closure = GClosure_val(closure_val);
    GValue param = G_VALUE_INIT;

    /* Set up the parameter */
    g_value_init(&param, G_TYPE_BOOLEAN);
    g_value_set_boolean(&param, Bool_val(arg_val));

    /* Invoke the closure with no return value */
    g_closure_invoke(closure, NULL, 1, &param, NULL);

    /* Clean up */
    g_value_unset(&param);

    CAMLreturn(Val_unit);
}

/* Test helper to invoke a closure with a double argument */
CAMLprim value ml_test_invoke_closure_double(value closure_val, value arg_val)
{
    CAMLparam2(closure_val, arg_val);
    GClosure *closure = GClosure_val(closure_val);
    GValue param = G_VALUE_INIT;

    /* Set up the parameter */
    g_value_init(&param, G_TYPE_DOUBLE);
    g_value_set_double(&param, Double_val(arg_val));

    /* Invoke the closure with no return value */
    g_closure_invoke(closure, NULL, 1, &param, NULL);

    /* Clean up */
    g_value_unset(&param);

    CAMLreturn(Val_unit);
}

/* ==================================================================== */
/* Object Creation (from Phase 1) */
/* ==================================================================== */

CAMLprim value ml_g_object_new(value type)
{
    CAMLparam1(type);
    GObject *obj;

    obj = g_object_new(Long_val(type), NULL);
    if (obj == NULL)
        caml_failwith("g_object_new: failed to create object");

    CAMLreturn(Val_pointer(obj));
}
