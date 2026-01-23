/* GENERATED CODE - DO NOT EDIT */
/* C bindings for IMContext */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_im_context_set_use_preedit(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_im_context_set_use_preedit(GtkIMContext_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_surrounding_with_selection(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);

gtk_im_context_set_surrounding_with_selection(GtkIMContext_val(self), String_val(arg1), Int_val(arg2), Int_val(arg3), Int_val(arg4));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_surrounding(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_im_context_set_surrounding(GtkIMContext_val(self), String_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_set_client_widget(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_im_context_set_client_widget(GtkIMContext_val(self), Option_val(arg1, GtkWidget_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_reset(value self)
{
CAMLparam1(self);

gtk_im_context_reset(GtkIMContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_get_surrounding_with_selection(value self)
{
CAMLparam1(self);
char* out1;
int out2;
int out3;

gboolean result = gtk_im_context_get_surrounding_with_selection(GtkIMContext_val(self), &out1, &out2, &out3);
CAMLlocal1(ret);
    ret = caml_alloc(4, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_string(out1));
    Store_field(ret, 2, Val_int(out2));
    Store_field(ret, 3, Val_int(out3));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_im_context_get_surrounding(value self)
{
CAMLparam1(self);
char* out1;
int out2;

gboolean result = gtk_im_context_get_surrounding(GtkIMContext_val(self), &out1, &out2);
CAMLlocal1(ret);
    ret = caml_alloc(3, 0);
    Store_field(ret, 0, Val_bool(result));
    Store_field(ret, 1, caml_copy_string(out1));
    Store_field(ret, 2, Val_int(out2));
    CAMLreturn(ret);
}

CAMLexport CAMLprim value ml_gtk_im_context_focus_out(value self)
{
CAMLparam1(self);

gtk_im_context_focus_out(GtkIMContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_focus_in(value self)
{
CAMLparam1(self);

gtk_im_context_focus_in(GtkIMContext_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_delete_surrounding(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gtk_im_context_delete_surrounding(GtkIMContext_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_im_context_get_input_hints(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkIMContext *obj = (GtkIMContext *)GtkIMContext_val(self);
    GtkInputHints prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "input-hints");
if (pspec == NULL) caml_failwith("ml_gtk_im_context_get_input_hints: property 'input-hints' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "input-hints", &prop_gvalue);
          prop_value = (GtkInputHints)g_value_get_flags(&prop_gvalue);

      result = Val_GtkInputHints(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_im_context_set_input_hints(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkIMContext *obj = (GtkIMContext *)GtkIMContext_val(self);
    GtkInputHints c_value = GtkInputHints_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "input-hints");
if (pspec == NULL) caml_failwith("ml_gtk_im_context_set_input_hints: property 'input-hints' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_flags(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "input-hints", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_im_context_get_input_purpose(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GtkIMContext *obj = (GtkIMContext *)GtkIMContext_val(self);
    GtkInputPurpose prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "input-purpose");
if (pspec == NULL) caml_failwith("ml_gtk_im_context_get_input_purpose: property 'input-purpose' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "input-purpose", &prop_gvalue);
          prop_value = (GtkInputPurpose)g_value_get_enum(&prop_gvalue);

      result = Val_GtkInputPurpose(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_im_context_set_input_purpose(value self, value new_value)
{
    CAMLparam2(self, new_value);
GtkIMContext *obj = (GtkIMContext *)GtkIMContext_val(self);
    GtkInputPurpose c_value = GtkInputPurpose_val(new_value);
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "input-purpose");
if (pspec == NULL) caml_failwith("ml_gtk_im_context_set_input_purpose: property 'input-purpose' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
          g_value_set_enum(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "input-purpose", &prop_gvalue);
g_value_unset(&prop_gvalue);
    CAMLreturn(Val_unit);
}
