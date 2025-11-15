#!/usr/bin/env python3
"""
Phase 3 Event Controller Code Generator

This script parses Gtk-4.0.gir and generates C bindings and OCaml modules
for GTK4 event controllers, leveraging existing lablgtk4 patterns.

Based on PHASE3_CODEGEN_PROPOSAL_GI.md but using a practical, incremental approach.
"""

import xml.etree.ElementTree as ET
import sys
from pathlib import Path
from typing import List, Dict, Optional

# GIR namespaces
NS = {
    'core': 'http://www.gtk.org/introspection/core/1.0',
    'c': 'http://www.gtk.org/introspection/c/1.0',
    'glib': 'http://www.gtk.org/introspection/glib/1.0'
}

# Type mappings from GIR types to OCaml/C
TYPE_MAPPINGS = {
    'guint': {
        'ocaml': 'int',
        'c_to_ml': 'Val_int',
        'ml_to_c': 'Int_val',
        'copy': False
    },
    'gint': {
        'ocaml': 'int',
        'c_to_ml': 'Val_int',
        'ml_to_c': 'Int_val',
        'copy': False
    },
    'gdouble': {
        'ocaml': 'float',
        'c_to_ml': 'caml_copy_double',
        'ml_to_c': 'Double_val',
        'copy': True
    },
    'gboolean': {
        'ocaml': 'bool',
        'c_to_ml': 'Val_bool',
        'ml_to_c': 'Bool_val',
        'copy': False
    },
    'gchararray': {
        'ocaml': 'string',
        'c_to_ml': 'caml_copy_string',
        'ml_to_c': 'String_val',
        'copy': True
    },
    'GdkModifierType': {
        'ocaml': 'Gdk.modifier_type list',
        'c_to_ml': 'Val_ModifierType',
        'ml_to_c': 'ModifierType_val',
        'copy': False
    },
    'GdkEvent*': {
        'ocaml': 'Gdk.Event.t',
        'c_to_ml': 'Val_GdkEvent',
        'ml_to_c': 'GdkEvent_val',
        'copy': False
    },
    'GtkWidget*': {
        'ocaml': 'Gtk.Widget.t',
        'c_to_ml': 'Val_GtkWidget',
        'ml_to_c': 'GtkWidget_val',
        'copy': False
    },
}

class GIRParser:
    """Parse GTK4 GIR file for event controller information"""

    def __init__(self, gir_file: str):
        self.tree = ET.parse(gir_file)
        self.root = self.tree.getroot()
        self.namespace = self.root.find('core:namespace', NS)

    def get_event_controllers(self) -> List[Dict]:
        """Extract all EventController classes"""
        controllers = []

        for cls in self.namespace.findall('core:class', NS):
            name = cls.get('name')
            parent = cls.get('parent')

            # Only process EventController subclasses
            if name and (name == 'EventController' or
                         'EventController' in name or
                         'Gesture' in name):
                controllers.append({
                    'name': name,
                    'c_type': cls.get('{' + NS['c'] + '}type'),
                    'parent': parent,
                    'constructors': self._get_constructors(cls),
                    'methods': self._get_methods(cls),
                    'signals': self._get_signals(cls),
                    'doc': self._get_doc(cls)
                })

        return controllers

    def _get_constructors(self, cls) -> List[Dict]:
        """Extract constructors"""
        ctors = []
        for ctor in cls.findall('core:constructor', NS):
            ctors.append({
                'name': ctor.get('name'),
                'c_identifier': ctor.get('{' + NS['c'] + '}identifier'),
                'return_type': self._get_return_type(ctor),
                'doc': self._get_doc(ctor)
            })
        return ctors

    def _get_methods(self, cls) -> List[Dict]:
        """Extract methods"""
        methods = []
        for method in cls.findall('core:method', NS):
            methods.append({
                'name': method.get('name'),
                'c_identifier': method.get('{' + NS['c'] + '}identifier'),
                'return_type': self._get_return_type(method),
                'parameters': self._get_parameters(method),
                'doc': self._get_doc(method)
            })
        return methods

    def _get_signals(self, cls) -> List[Dict]:
        """Extract signals"""
        signals = []
        for signal in cls.findall('glib:signal', NS):
            signals.append({
                'name': signal.get('name'),
                'return_type': self._get_return_type(signal),
                'parameters': self._get_signal_parameters(signal),
                'doc': self._get_doc(signal)
            })
        return signals

    def _get_return_type(self, element) -> Dict:
        """Extract return type information"""
        ret_val = element.find('core:return-value', NS)
        if ret_val is None:
            return {'type': 'void', 'c_type': 'void'}

        type_elem = ret_val.find('core:type', NS)
        if type_elem is None:
            return {'type': 'void', 'c_type': 'void'}

        return {
            'type': type_elem.get('name', 'void'),
            'c_type': type_elem.get('{' + NS['c'] + '}type', 'void')
        }

    def _get_parameters(self, element) -> List[Dict]:
        """Extract method parameters"""
        params = []
        params_elem = element.find('core:parameters', NS)
        if params_elem is None:
            return params

        for param in params_elem.findall('core:parameter', NS):
            type_elem = param.find('core:type', NS)
            if type_elem is not None:
                params.append({
                    'name': param.get('name'),
                    'type': type_elem.get('name'),
                    'c_type': type_elem.get('{' + NS['c'] + '}type'),
                })
        return params

    def _get_signal_parameters(self, signal) -> List[Dict]:
        """Extract signal parameters"""
        params = []
        params_elem = signal.find('core:parameters', NS)
        if params_elem is None:
            return params

        for param in params_elem.findall('core:parameter', NS):
            type_elem = param.find('core:type', NS)
            if type_elem is not None:
                params.append({
                    'name': param.get('name'),
                    'type': type_elem.get('name'),
                    'c_type': type_elem.get('{' + NS['c'] + '}type'),
                })
        return params

    def _get_doc(self, element) -> Optional[str]:
        """Extract documentation"""
        doc_elem = element.find('core:doc', NS)
        if doc_elem is not None and doc_elem.text:
            # Clean up documentation
            return doc_elem.text.strip().replace('\n', ' ')
        return None


class CCodeGenerator:
    """Generate C FFI bindings"""

    @staticmethod
    def generate_header() -> str:
        return """/* GENERATED CODE - DO NOT EDIT */
/* Generated from Gtk-4.0.gir for Phase 3 Event Controllers */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Event controller type conversion - use direct cast (GObjects) */
#define GtkEventController_val(val) ((GtkEventController*)Pointer_val(val))
#define Val_GtkEventController(obj) ((value)(obj))

"""

    @staticmethod
    def generate_constructor(controller_name: str, ctor: Dict) -> str:
        """Generate constructor binding"""
        c_name = ctor['c_identifier']
        ml_name = c_name.replace('gtk_', 'ml_gtk_')

        return f"""
CAMLprim value {ml_name}(value unit)
{{
    CAMLparam1(unit);
    GtkEventController *controller = {c_name}();
    CAMLreturn(Val_GtkEventController(controller));
}}
"""

    @staticmethod
    def generate_method(controller_name: str, method: Dict) -> str:
        """Generate method binding using existing wrappers.h patterns"""
        c_name = method['c_identifier']
        ml_name = c_name.replace('gtk_', 'ml_gtk_')
        params = method['parameters']
        ret_type = method['return_type']

        # Build parameter list
        param_count = len(params) + 1  # +1 for self
        param_list = ['value self'] + [f'value arg{i+1}' for i in range(len(params))]

        # Build parameter conversion
        param_conversions = []
        c_args = ['GtkEventController_val(self)']

        for i, param in enumerate(params):
            c_type = param.get('c_type', param['type'])
            if c_type in TYPE_MAPPINGS:
                conv = TYPE_MAPPINGS[c_type]['ml_to_c']
                c_args.append(f"{conv}(arg{i+1})")
            else:
                # Fallback for unknown types
                c_args.append(f"arg{i+1}")

        # Build return value conversion
        ret_c_type = ret_type.get('c_type', ret_type['type'])
        if ret_c_type == 'void':
            ret_conv = 'CAMLreturn(Val_unit);'
            c_call = f'{c_name}({", ".join(c_args)});'
        elif ret_c_type in TYPE_MAPPINGS:
            ret_mapping = TYPE_MAPPINGS[ret_c_type]
            ret_conv_func = ret_mapping['c_to_ml']
            if ret_mapping['copy']:
                ret_conv = f'CAMLreturn({ret_conv_func}(result));'
            else:
                ret_conv = f'CAMLreturn({ret_conv_func}(result));'
            c_call = f'{ret_c_type} result = {c_name}({", ".join(c_args)});'
        else:
            ret_conv = 'CAMLreturn((value)result);'
            c_call = f'void *result = {c_name}({", ".join(c_args)});'

        return f"""
CAMLprim value {ml_name}({', '.join(param_list)})
{{
    CAMLparam{param_count}({', '.join(param_list)});
    {c_call}
    {ret_conv}
}}
"""


def main():
    if len(sys.argv) < 2:
        print("Usage: generate_event_controllers.py <output_dir>")
        sys.exit(1)

    output_dir = Path(sys.argv[1])
    output_dir.mkdir(parents=True, exist_ok=True)

    # Parse GIR file
    gir_file = "/usr/share/gir-1.0/Gtk-4.0.gir"
    print(f"Parsing {gir_file}...")
    parser = GIRParser(gir_file)
    controllers = parser.get_event_controllers()

    print(f"Found {len(controllers)} event controller classes")

    # Generate C code
    c_gen = CCodeGenerator()
    c_output = c_gen.generate_header()

    for controller in controllers:
        print(f"  - {controller['name']}")

        # Generate constructors
        for ctor in controller['constructors']:
            c_output += c_gen.generate_constructor(controller['name'], ctor)

        # Generate methods (limit to first 5 for now)
        for method in controller['methods'][:5]:
            c_output += c_gen.generate_method(controller['name'], method)

    # Write C output
    c_file = output_dir / "ml_event_controllers_gen.c"
    print(f"\nWriting {c_file}...")
    c_file.write_text(c_output)

    print("✓ Code generation complete!")
    print(f"  Generated: {c_file}")

if __name__ == '__main__':
    main()
