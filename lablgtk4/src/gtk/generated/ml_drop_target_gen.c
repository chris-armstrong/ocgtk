/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DropTarget */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkDropTarget */
#ifndef Val_GtkDropTarget
#define GtkDropTarget_val(val) ((GtkDropTarget*)ext_of_val(val))
#define Val_GtkDropTarget(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkDropTarget */


CAMLexport CAMLprim value ml_gtk_drop_target_new(value arg1, value arg2)
{
CAMLparam2(arg1, arg2);
GtkDropTarget *obj = gtk_drop_target_new(arg1, GdkDragAction_val(arg2));
CAMLreturn(Val_GtkDropTarget(obj));
}

CAMLexport CAMLprim value ml_gtk_drop_target_set_actions(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_drop_target_set_actions(GtkDropTarget_val(self), GdkDragAction_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_reject(value self)
{
CAMLparam1(self);

gtk_drop_target_reject(GtkDropTarget_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_actions(value self)
{
CAMLparam1(self);

GdkDragAction result = gtk_drop_target_get_actions(GtkDropTarget_val(self));
CAMLreturn(Val_GdkDragAction(result));
}

CAMLexport CAMLprim value ml_gtk_drop_target_get_preload(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkDropTarget *obj = (GtkDropTarget *)GtkDropTarget_val(self);
    gboolean prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "preload");
if (pspec == NULL) caml_failwith("ml_gtk_drop_target_get_preload: property 'preload' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "preload", &prop_gvalue);
    prop_value = g_value_get_boolean(&prop_gvalue);

result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_drop_target_set_preload(value self, value new_value)
{
CAMLparam2(self, new_value);
GtkDropTarget *obj = (GtkDropTarget *)GtkDropTarget_val(self);
    gboolean c_value = Bool_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "preload");
if (pspec == NULL) caml_failwith("ml_gtk_drop_target_set_preload: property 'preload' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_boolean(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "preload", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
