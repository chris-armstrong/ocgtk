/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Renderer */

#include <gsk/gsk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gsk_renderer_unrealize(value self)
{
CAMLparam1(self);

gsk_renderer_unrealize(GskRenderer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_renderer_is_realized(value self)
{
CAMLparam1(self);

gboolean result = gsk_renderer_is_realized(GskRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_renderer_get_realized(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GskRenderer *obj = (GskRenderer *)GskRenderer_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "realized");
if (pspec == NULL) caml_failwith("ml_gsk_renderer_get_realized: property 'realized' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "realized", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
