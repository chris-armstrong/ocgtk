#!/usr/bin/env python3
"""
Verify Phase 2 Implementation Completeness using GObject Introspection

This script parses GIR files and checks if our OCaml/C bindings cover the API.
"""

import xml.etree.ElementTree as ET
import os
import sys
from pathlib import Path
from collections import defaultdict

GIR_DIR = "/usr/share/gir-1.0"
SRC_DIR = Path(__file__).parent.parent / "src"

# Namespaces
NS = {
    'core': 'http://www.gtk.org/introspection/core/1.0',
    'c': 'http://www.gtk.org/introspection/c/1.0',
    'glib': 'http://www.gtk.org/introspection/glib/1.0'
}

class GIRAnalyzer:
    def __init__(self, gir_file):
        self.tree = ET.parse(gir_file)
        self.root = self.tree.getroot()
        self.namespace = self.root.find('core:namespace', NS)

    def get_classes(self):
        """Get all classes from GIR file"""
        classes = {}
        for cls in self.namespace.findall('core:class', NS):
            name = cls.get('name')
            classes[name] = {
                'c_type': cls.get('{' + NS['c'] + '}type'),
                'parent': cls.get('parent'),
                'methods': self._get_methods(cls),
                'constructors': self._get_constructors(cls),
                'functions': self._get_functions(cls),
            }
        return classes

    def _get_methods(self, cls):
        """Extract methods from a class"""
        methods = []
        for method in cls.findall('core:method', NS):
            methods.append({
                'name': method.get('name'),
                'c_identifier': method.get('{' + NS['c'] + '}identifier'),
            })
        return methods

    def _get_constructors(self, cls):
        """Extract constructors from a class"""
        constructors = []
        for ctor in cls.findall('core:constructor', NS):
            constructors.append({
                'name': ctor.get('name'),
                'c_identifier': ctor.get('{' + NS['c'] + '}identifier'),
            })
        return constructors

    def _get_functions(self, cls):
        """Extract static functions from a class"""
        functions = []
        for func in cls.findall('core:function', NS):
            functions.append({
                'name': func.get('name'),
                'c_identifier': func.get('{' + NS['c'] + '}identifier'),
            })
        return functions

    def get_functions(self):
        """Get all top-level functions"""
        functions = []
        for func in self.namespace.findall('core:function', NS):
            functions.append({
                'name': func.get('name'),
                'c_identifier': func.get('{' + NS['c'] + '}identifier'),
            })
        return functions


class ImplementationChecker:
    def __init__(self, src_dir):
        self.src_dir = Path(src_dir)

    def check_c_function(self, c_identifier):
        """Check if a C function is implemented in our bindings"""
        # Look for ml_<name> wrapper in C files
        ml_name = self._c_to_ml(c_identifier)

        for c_file in self.src_dir.glob("ml_*.c"):
            with open(c_file, 'r') as f:
                content = f.read()
                if ml_name in content or c_identifier in content:
                    return True, c_file.name
        return False, None

    def check_ocaml_function(self, name):
        """Check if function is bound in OCaml"""
        for ml_file in self.src_dir.glob("*.ml"):
            with open(ml_file, 'r') as f:
                content = f.read()
                # Simple check - could be more sophisticated
                if f"external {name}" in content or f"let {name}" in content:
                    return True, ml_file.name
        return False, None

    def _c_to_ml(self, c_identifier):
        """Convert gdk_surface_get_width to ml_gdk_surface_get_width"""
        return f"ml_{c_identifier}"


def verify_module(module_name, gir_file, focus_classes=None):
    """Verify a specific module"""
    print(f"\n{'='*60}")
    print(f"Verifying {module_name}")
    print(f"{'='*60}")

    gir_path = os.path.join(GIR_DIR, gir_file)
    if not os.path.exists(gir_path):
        print(f"⚠ {gir_file} not found, skipping...")
        return

    analyzer = GIRAnalyzer(gir_path)
    checker = ImplementationChecker(SRC_DIR)

    classes = analyzer.get_classes()

    if focus_classes:
        classes = {k: v for k, v in classes.items() if k in focus_classes}

    total_methods = 0
    implemented_methods = 0
    missing_methods = []

    for class_name, class_info in sorted(classes.items()):
        print(f"\n{class_name} ({class_info['c_type']})")
        print(f"  Parent: {class_info['parent'] or 'None'}")

        # Check constructors
        if class_info['constructors']:
            print(f"  Constructors:")
            for ctor in class_info['constructors']:
                total_methods += 1
                implemented, location = checker.check_c_function(ctor['c_identifier'])
                if implemented:
                    implemented_methods += 1
                    print(f"    ✓ {ctor['name']} ({location})")
                else:
                    missing_methods.append(f"{class_name}::{ctor['name']}")
                    print(f"    ✗ {ctor['name']}")

        # Check methods
        if class_info['methods']:
            print(f"  Methods:")
            for method in class_info['methods'][:10]:  # Limit output
                total_methods += 1
                implemented, location = checker.check_c_function(method['c_identifier'])
                if implemented:
                    implemented_methods += 1
                    print(f"    ✓ {method['name']} ({location})")
                else:
                    missing_methods.append(f"{class_name}::{method['name']}")
                    print(f"    ✗ {method['name']}")

            if len(class_info['methods']) > 10:
                print(f"    ... and {len(class_info['methods']) - 10} more methods")
                total_methods += len(class_info['methods']) - 10

    # Summary
    print(f"\n{'='*60}")
    print(f"Summary for {module_name}")
    print(f"{'='*60}")
    print(f"Total methods/constructors: {total_methods}")
    print(f"Implemented: {implemented_methods}")
    print(f"Coverage: {implemented_methods/total_methods*100:.1f}%" if total_methods > 0 else "N/A")

    if missing_methods:
        print(f"\nTop 10 missing items:")
        for item in missing_methods[:10]:
            print(f"  - {item}")


def main():
    print("Phase 2 Completeness Verification")
    print("Using GObject Introspection to audit implementation\n")

    # Verify each Phase 2 module
    modules = [
        ("Gdk", "Gdk-4.0.gir", ["Display", "Surface", "Clipboard", "Device", "Seat"]),
        ("Pango", "Pango-1.0.gir", ["Layout", "FontDescription", "Context"]),
        ("GObject", "GObject-2.0.gir", ["Object"]),
    ]

    for module_name, gir_file, focus_classes in modules:
        verify_module(module_name, gir_file, focus_classes)

    print(f"\n{'='*60}")
    print("Verification Complete")
    print(f"{'='*60}")
    print("\nNote: This is a basic check. For complete verification:")
    print("1. Review method signatures match")
    print("2. Check parameter types are correct")
    print("3. Verify memory management (transfer ownership)")
    print("4. Test functionality at runtime")


if __name__ == "__main__":
    main()
