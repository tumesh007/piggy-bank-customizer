#!/usr/bin/env python3
"""
OpenSCAD Piggy Bank Batch STL Exporter for Bambu Lab A1 Mini / Standard
Usage:
    python export_all_stls.py
    python export_all_stls.py --profile A1_Mini
    python export_all_stls.py --profile Standard_256
"""

import os
import sys
import argparse
import subprocess

def main():
    parser = argparse.ArgumentParser(description="Batch export piggy bank STLs via OpenSCAD CLI")
    parser.add_argument("--profile", default="A1_Mini", choices=["A1_Mini", "Standard_256", "Custom"],
                        help="Printer profile: 'A1_Mini' (180x180mm) or 'Standard_256' (256x256mm)")
    parser.add_argument("--output", default="Piggy_Bank_STLs", help="Output directory")
    args = parser.parse_args()

    base_dir = os.path.dirname(os.path.abspath(__file__))
    scad_file = os.path.join(base_dir, "Piggy_Bank_Batch_Export.scad")
    out_dir = os.path.join(base_dir, args.output)
    os.makedirs(out_dir, exist_ok=True)

    # Locate OpenSCAD executable
    openscad_candidates = [
        r"C:\Program Files\OpenSCAD\openscad.com",
        r"C:\Program Files (x86)\OpenSCAD\openscad.com",
        "openscad"
    ]
    openscad = None
    for cand in openscad_candidates:
        if os.path.exists(cand):
            openscad = cand
            break
    if not openscad:
        openscad = "openscad"

    print("=" * 60)
    print(f"Piggy Bank Batch STL Exporter")
    print(f"Target Profile: {args.profile}")
    print(f"Output Directory: {out_dir}")
    print(f"SCAD File: {scad_file}")
    print("=" * 60)

    # 1. Export Stopper (individual)
    stopper_stl = os.path.join(out_dir, "Stopper.stl")
    print("\n[1/10] Exporting single Stopper...")
    subprocess.run([openscad, "-o", stopper_stl, "--export-format", "binstl",
                    "-D", f'Printer_Profile="{args.profile}"',
                    "-D", 'export_part="stopper"', scad_file], check=True)

    # 2. Export 4x Stoppers Batch
    batch_stopper_stl = os.path.join(out_dir, "Stoppers_Batch_x4.stl")
    print("[2/10] Exporting Stoppers 4x Batch Plate...")
    subprocess.run([openscad, "-o", batch_stopper_stl, "--export-format", "binstl",
                    "-D", f'Printer_Profile="{args.profile}"',
                    "-D", 'export_part="stoppers_batch"', scad_file], check=True)

    # 3. Export Personalized Bodies and Front Plates
    children = ["Shivansh", "Luvish", "Janice", "Nivaan"]
    count = 3
    for child in children:
        print(f"[{count}/10] Exporting Body for {child}...")
        body_stl = os.path.join(out_dir, f"{child}_Body.stl")
        subprocess.run([openscad, "-o", body_stl, "--export-format", "binstl",
                        "-D", f'Printer_Profile="{args.profile}"',
                        "-D", f'Child_Name="{child}"',
                        "-D", 'export_part="body"', scad_file], check=True)
        count += 1

        print(f"[{count}/10] Exporting Front Plate for {child}...")
        plate_stl = os.path.join(out_dir, f"{child}_Front_Plate.stl")
        subprocess.run([openscad, "-o", plate_stl, "--export-format", "binstl",
                        "-D", f'Printer_Profile="{args.profile}"',
                        "-D", f'Child_Name="{child}"',
                        "-D", 'export_part="front_plate"', scad_file], check=True)
        count += 1

    print("\n" + "=" * 60)
    print(f"Export Complete! 10 STL files generated in: {out_dir}")
    print("=" * 60)

if __name__ == "__main__":
    main()
