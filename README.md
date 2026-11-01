# Personalized 3D Printed Piggy Bank Generator
### Modular STL Export & Batch 3D Printing Guide (Bambu Lab A1 Mini & Standard Beds)

Based on the original parametric text piggy bank generator by **Logan Gustavo Pena** ([MakerWorld Design #2695779](https://makerworld.com/en/makerlab/parametricModelMaker?designId=2695779)).

---

## Overview of Deliverables

* **Modified SCAD Model:** `Piggy_Bank_Batch_Export.scad` (in your Downloads folder)
* **Pre-Exported Binary STLs:** `Downloads/Piggy_Bank_STLs/`
  * `Stopper.stl` (Universal twist-and-lock bottom stopper)
  * `Stoppers_Batch_x4.stl` (4x twist stoppers on a single plate)
  * `Shivansh_Body.stl` & `Shivansh_Front_Plate.stl`
  * `Luvish_Body.stl` & `Luvish_Front_Plate.stl`
  * `Janice_Body.stl` & `Janice_Front_Plate.stl`
  * `Nivaan_Body.stl` & `Nivaan_Front_Plate.stl`
* **Automated Batch Export Scripts:**
  * PowerShell: `Downloads/export_all_stls.ps1`
  * Python: `Downloads/export_all_stls.py`
* **Original File:** `Piggy bank gen v6.2.scad` (preserved 100% untouched)

---

## 1. How to Open the Modified SCAD File

1. Launch **OpenSCAD** (installed at `C:\Program Files\OpenSCAD\openscad.exe`).
2. Go to **File -> Open...** and select:
   `C:\Users\tumes\Downloads\Piggy_Bank_Batch_Export.scad`
3. Ensure the **Customizer** panel is visible:
   * In the top menu, go to **Window -> Untick 'Hide Customizer'** (or ensure **Customizer** is checked in the Window menu).

---

## 2. Printer Bed Selection (Bambu Lab A1 Mini Support)

Under the **🖨️ 3D Printer & Bed Target** section in the Customizer:
* `Printer_Profile = "A1_Mini"` *(Default)*:
  Automatically scales and proportions the body, coin slot, ledge, and twist-stopper so **all 4 names fit within the Bambu Lab A1 Mini's 180 × 180 × 180 mm build volume** without requiring manual scaling or rotation!
* `Printer_Profile = "Standard_256"`:
  Uses the larger scale (`Text_Scale = 50mm`, depth = 60mm) intended for 256 × 256 mm beds (Bambu X1-Carbon, P1S, P1P, A1).
* `Printer_Profile = "Custom"`:
  Enables all manual parametric sliders below.

---

## 3. How to Select a Child's Name

Under the **👶 Personalized Child Selection** section in the Customizer:
1. Open the `Child_Name` drop-down menu.
2. Select any of the four children:
   * **Shivansh**
   * **Luvish**
   * **Janice**
   * **Nivaan**
   *(Uppercase presets like `SHIVANSH` are also provided in the dropdown).*
3. To use any custom name, select **Custom** from the dropdown and type your name into `Custom_Text`.

---

## 4. How to Select a Component (`export_part`)

Under the **🚪 Export & Component Selection** section, select `export_part`:

| Option | What is Shown / Exported | Printing / Usage Notes |
| :--- | :--- | :--- |
| `assembly` | **Complete Assembled 3D Preview** | Real-time preview with front plate in ledge and stopper in back. |
| `body` | **Main Piggy Bank Body** | **Print-ready orientation:** Lies flat on its back (Z=0). 100% bed contact across backplate. Zero supports required! |
| `body_upright` | Main Body Standing Upright | Upright on its sliced flat base for inspection or upright printing. |
| `stopper` | **Twist & Lock Stopper Plug** | Single cap lying flat on outer flange. Universal across all 4 children. |
| `stoppers_batch` | **4x Stoppers Batch (2x2 Grid)** | Prints all 4 caps together on one A1 Mini plate (88 × 88 mm footprint). |
| `front_plate` | **Front Plate with Raised Letters** | Front plate (thickness 2.5mm) with raised letters (3.0mm) facing up. |
| `front_plate_blank` | Blank Front Plate (No Text) | For laser cutting acrylic, clear PETG windows, or blank covers. |
| `letters` | Standalone 3D Letters | Pure raised letters alone (to print in another color and glue on). |
| `all_parts` | Single Child All-Parts Layout | Body, front plate, and stopper arranged flat without overlapping. |
| `batch_bodies` | 4 Children Bodies Overview | 2x2 comparison layout of all 4 bodies. |
| `batch_front_plates`| 4 Children Front Plates Overview | 2x2 comparison layout of all 4 front plates. |

---

## 5. How to Render and Export an Individual STL in OpenSCAD

1. Select the `Child_Name` (e.g., `Shivansh`).
2. Select the `export_part` (e.g., `body`).
3. Press **F6** (or go to **Design -> Render**) to compute the full CGAL geometry.
4. Once rendering finishes, press **F7** (or go to **File -> Export -> Export as STL...**).
5. Choose your destination file name (e.g., `Shivansh_Body.stl`) and save.
6. To export the front plate, change `export_part` to `front_plate`, press **F6**, then **F7** (`Shivansh_Front_Plate.stl`).
7. Repeat for each child as needed.

---

## 6. Automated 1-Click Batch Export (Optional Helper Scripts)

Instead of manually exporting 10 separate STL files in the GUI, you can use the included batch export scripts:

### Using PowerShell:
```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\Downloads\export_all_stls.ps1"
```

### Using Python:
```bash
python "$HOME/Downloads/export_all_stls.py" --profile A1_Mini
```
This automatically compiles and saves all 10 binary STL files into `Downloads/Piggy_Bank_STLs/` in ~10 minutes.

---

## 7. Bambu Studio Workflow & Slicing Recommendations

### Step-by-Step Plate Organization for Bambu Lab A1 Mini (180 × 180 mm)

1. **Launch Bambu Studio** and select your printer (`Bambu Lab A1 mini 0.4 nozzle`).
2. **Recommended Plate Strategy (4 Piggy Banks):**
   * **Plate 1:** `Stoppers_Batch_x4.stl` (All 4 twist caps printed together in ~45 mins).
   * **Plate 2:** `Shivansh_Body.stl` (Lies flat on back, centered or rotated 45° for extra brim clearance).
   * **Plate 3:** `Shivansh_Front_Plate.stl` (Lies flat, letters facing up).
   * **Plate 4:** `Luvish_Body.stl`
   * **Plate 5:** `Luvish_Front_Plate.stl`
   * **Plate 6:** `Janice_Body.stl`
   * **Plate 7:** `Janice_Front_Plate.stl`
   * **Plate 8:** `Nivaan_Body.stl`
   * **Plate 9:** `Nivaan_Front_Plate.stl`

> [!TIP]
> **Can multiple front plates fit on one A1 Mini plate?**
> Yes! For example, `Janice_Front_Plate.stl` (~146 × 48 mm) and `Luvish_Front_Plate.stl` (~145 × 48 mm) can be placed parallel to each other along the Y axis on a single 180 × 180 mm plate!

### Multi-Color Front Plate Printing (Without an AMS!)
The front plate has a base plate thickness of **2.5 mm** and raised lettering from **2.5 mm to 5.5 mm**:
1. Slice the front plate at **0.20 mm layer height**.
2. In the Bambu Studio preview layer slider, scroll to layer **13 (height 2.60 mm)**.
3. Right-click the plus icon on the layer slider and choose **Add Pause** (or **Change Filament** if using AMS).
4. Start printing with Color 1 (e.g., Cyan). At layer 13, the printer will automatically pause, allowing you to swap filament to Color 2 (e.g., Orange/Gold) for the raised letters!

### Optimal Slicer Settings:
* **Orientation:** Always keep the back of the Body flat on the build plate (Z=0).
* **Layer Height:** `0.20 mm Standard` (or `0.16 mm Optimal`).
* **Wall Loops:** `3` or `4` walls for strength and watertight seams.
* **Infill:** `15% Gyroid` or `Grid`.
* **Supports:** **Disabled (None)**. The body walls and internal ledge are vertical and bridgeable without any supports!
* **Brim:** `Mouse ears` or `Outer brim only (5 mm)` if using high-speed PLA/PETG on textured PEI.

---

## 8. Assembly & Fit Considerations

1. **Ledge Fit:**
   The front plate sits on a generated 1.8 mm internal ledge with a built-in `Fit_Tolerance = 0.35 mm`. It will snap or press-fit neatly into the front rim. If you wish to make it permanent, apply a few drops of cyanoacrylate (super glue) along the internal shelf.
2. **Twist & Lock Cap:**
   The stopper features 3 bayonet locking tabs with `Lock_Tolerance = 0.5 mm`. Insert the plug into the rear socket and twist 60 degrees clockwise to lock. A standard coin or flat screwdriver fits into the top slot for effortless opening and closing.
3. **Coin Slot Clearance & Floor Integrity:**
   The coin slot measures 32 mm × 4.2 mm and pierces **exclusively upwards through the top roof** into the coin cavity. The bottom flat base and solid floor are completely solid and protected from accidental cuts. Standard world coins (US Quarters, 1 & 2 Euros, 5 & 10 Indian Rupees, British Pounds) slide in smoothly through the top.
