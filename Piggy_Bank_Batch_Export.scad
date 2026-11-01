/**
 * ============================================================================
 * 3D Printed Text Piggy Bank Engine - Modular & Batch 3D Printing Edition
 * ============================================================================
 * Based on: 3D Printed Text Piggy Bank Engine v6.2 (The Cursive Update)
 * Original Author: Logan Gustavo Pena (MakerWorld Design #2695779)
 * Modular & Batch Export Modifications: Antigravity
 *
 * New Features in this Edition:
 * - 🖨️ Bambu Lab A1 Mini Support: Built-in 'A1_Mini' profile with auto-scaling so
 *      Shivansh, Luvish, Janice, and Nivaan all fit comfortably on the 180x180mm bed!
 * - 🎯 Independent Component Export: Select and export Body, Stopper, Front Plate,
 *      Blank Plate, or 3D Letters as standalone watertight STLs.
 * - 👶 4 Personalized Child Presets: One-click selection for Shivansh, Luvish,
 *      Janice, and Nivaan (plus Custom text entry).
 * - 🔄 True Assembled 3D Preview: Real-time visual assembly with the front plate
 *      seated in the ledge recess and the twist cap locked in the back socket.
 * - 🖨️ Optimal Print-Ready Orientations: Body exports flat on its back (bed contact
 *      across backplate, zero supports required), Stopper flat on flange, Front
 *      Plate flat with raised lettering upright.
 * - 📦 Batch Printing Modes:
 *      * stoppers_batch: 4x identical twist caps in a 2x2 grid on one plate.
 *      * all_parts: Body, Front Plate, and Stopper arranged without overlap.
 *      * batch_bodies / batch_front_plates: Multi-name overview layout.
 * - 🛡️ Strict Export Validation: Clear error message when an invalid component is selected.
 * ============================================================================
 */

/* [🖨️ 3D Printer & Bed Target] */

// Target printer profile: A1_Mini (180x180) ensures all 4 names fit on the bed!
Printer_Profile = "A1_Mini"; // [A1_Mini: Bambu Lab A1 Mini (180x180mm), Standard_256: Bambu Lab X1/P1/A1 & Standard (256x256mm), Custom: Manual Parameters Below]


/* [👶 Personalized Child Selection] */

// Select one of the 4 children presets or choose Custom
Child_Name = "SHIVANSH"; // [SHIVANSH, LUVISH, JANICE, NIVAAN, Shivansh, Luvish, Janice, Nivaan, Custom]

// Enter custom text here if Child_Name is set to "Custom"
Custom_Text = "SHIVANSH";

// Letter Casing Mode:
// "UPPERCASE" ensures 100% uniform letter heights across all characters (no dip or height difference on 'I'!)
// "As_Entered" keeps the exact casing you typed.
Letter_Casing = "UPPERCASE"; // [UPPERCASE: Uniform Heights Across All Letters (Recommended), As_Entered: Keep Exact Case]

// Typography Spacing Engine:
// "Proportional" uses HarfBuzz native font kerning to eliminate unnatural gaps around 'I' and narrow letters!
// "Monospace_Legacy" is the old fixed-step character loop.
Spacing_Engine = "Proportional"; // [Proportional: Natural Kerning (Recommended), Monospace_Legacy: Old Fixed Step]


/* [🚪 Export & Component Selection] */

// Choose which component to render/export
export_part = "assembly"; // [assembly: Complete Assembled Preview, body: Main Body (Flat for 3D Printing), body_upright: Main Body (Upright Standing), stopper: Twist & Lock Stopper Cap, front_plate: Front Plate with Raised Letters, front_plate_blank: Flat Front Plate without Letters, letters: Standalone 3D Letters, all_parts: All Parts Laid Out Flat (Single Child), stoppers_batch: 4x Stoppers (2x2 Batch Print), batch_bodies: 4 Children Bodies Layout, batch_front_plates: 4 Children Front Plates Layout]

// Legacy selector compatibility: if Part_To_Show was modified from original, map it
Part_To_Show = "Both"; // [Body, Cap, Front Plate, Both]


/* [📝 Content & Typography] */

// Legacy direct text string (used if Child_Name is "Custom" or overridden via CLI)
Text_String = "Shivansh";

// Choose the font style
Font_Selection = "Fugaz One"; // [Luckiest Guy, Archivo Black, Bebas Neue, Orbitron, Audiowide, Titan One, Alfa Slab One, Press Start 2P, Silkscreen, Fugaz One, Fredoka One, Pacifico, Anton, Russo One, Righteous, Bangers, Lobster, Leckerli One, Oleo Script, Grand Hotel, Dancing Script, Great Vibes]

// 🖼️ Upload SVG Graphic (Auto-overrides Text above)
SVG_File = "default.svg"; // file

// Overall scale of the letters (mm) [Used when Printer_Profile is "Custom"]
Text_Scale = 50; // [15:1:500]

// Master horizontal spacing. Negative pushes them closer.
Letter_Spacing = 0; // [-20:0.1:20]


/* [🖼️ SVG Fine-Tuning] */

// Overall multiplier for the SVG size
SVG_Scale = 1.0; // [0.1:0.01:10.0]

// 254 = 1:1 mm scale, 96 = web standard
DPI_Adjustment = 254; // [72, 90, 96, 254, 300]

// Custom Plinth Width for SVG (OpenSCAD cannot auto-measure SVGs)
SVG_Plinth_Width = 120; // [20:1:500]


/* [🐷 Piggy Bank Box Settings - Custom Mode] */

// How far out the box extends around the text (mm)
Bubble_Size = 20.0; // [5.0:0.5:40.0]

// Total depth of the piggy bank (mm)
Box_Depth = 60.0; // [20.0:1.0:100.0]

// Thickness of the outer perimeter walls. Keep this thick (4mm+) to support the ledge!
Wall_Thickness = 4.0; // [2.0:0.2:10.0]

// Thickness of the integrated back plate (mm)
Back_Thickness = 3.0; // [1.0:0.1:8.0]


/* [🏛️ Flat Stand & Base - Custom Mode] */

// The style of the flat base. Conforming Skirt stretches the bubble outline straight down!
Stand_Style = "Conforming Skirt"; // ["Conforming Skirt", "Rectangular Block"]

// The Y-Axis level where the flat bottom is sliced. Lower this number to make the stand taller!
Flat_Base_Y_Level = -40; // [-150:1:0]

// GUARANTEED FLOOR: Automatically stops the inner coin cavity this many mm above the cut line to prevent holes!
Base_Thickness = 5.0; // [2.0:0.5:20.0]


/* [🪙 Coin Slot - Custom Mode] */

// Width of the slot (mm)
Coin_Slot_Width = 4.5; // [2.0:0.1:10.0]

// Length of the slot (mm)
Coin_Slot_Length = 35.0; // [10.0:1.0:60.0]

// X Position of the slot (Left / Right)
Coin_Slot_X = 0; // [-100:1:100]

// Y Position of the slot. Push this UP until it breaches the top wall of your text.
Coin_Slot_Y = 25; // [-50:1:100]


/* [🪟 Separate Front Assembly & Ledge - Custom Mode] */

// Thickness of the distinct front plate (mm)
Separate_Front_Plate_Thickness = 3.0; // [1.0:0.1:5.0]

// How far the letters pop out of the front plate (mm)
Text_Raise = 4.0; // [0.0:0.1:15.0]

// How wide the shelf holding the front assembly is (mm)
Ledge_Width = 2.0; // [1.0:0.1:5.0]

// Automatic tolerance so the plate actually fits inside the ledge without sanding (mm)
Fit_Tolerance = 0.4; // [0.0:0.1:1.0]


/* [🔄 Twist & Lock Mechanism - Custom Mode] */

Cap_Diameter = 35.0; // [15.0:1.0:60.0]
Cap_X = 0; // [-100:1:100]
Cap_Y = 0; // [-100:1:100]
Notch_Width = 10.0; // [5.0:0.5:20.0]
Notch_Depth = 4.0; // [2.0:0.5:10.0]
Lock_Tolerance = 0.6; // [0.0:0.1:2.0]


/* [🎨 Aesthetics & Resolution] */

Max_Flat_Edge_Length = 0.5; // [0.1:0.1:5.0]
Body_Color = "DimGray"; 
Front_Assembly_Color = "Cyan"; 
Text_Color = "Orange";
Cap_Color = "LightBlue";


/* --- INTERNAL ENGINE & PARAMETER RESOLUTION --- */

$fs = Max_Flat_Edge_Length; 
$fa = 1; 

// Helper function to resolve uppercase presets:
function to_child_uppercase(name) = 
    (name == "Shivansh" || name == "SHIVANSH") ? "SHIVANSH" :
    (name == "Luvish"   || name == "LUVISH")   ? "LUVISH"   :
    (name == "Janice"   || name == "JANICE")   ? "JANICE"   :
    (name == "Nivaan"   || name == "NIVAAN")   ? "NIVAAN"   :
    name;

// Resolve Active Text:
Raw_Text = (Child_Name != "Custom" && (Text_String == "Shivansh" || Text_String == "SHIVANSH")) ? Child_Name :
           (Child_Name == "Custom") ? Custom_Text : Text_String;

Resolved_Text = (Letter_Casing == "UPPERCASE") ? to_child_uppercase(Raw_Text) : Raw_Text;

// Map legacy Part_To_Show if export_part was left as default "assembly" and Part_To_Show was set:
Resolved_Part = (export_part != "assembly") ? export_part :
                (Part_To_Show == "Body") ? "body" :
                (Part_To_Show == "Cap") ? "stopper" :
                (Part_To_Show == "Front Plate") ? "front_plate" :
                (Part_To_Show == "Both" && export_part == "assembly") ? "assembly" :
                export_part;

Is_SVG = (SVG_File != "default.svg" && SVG_File != "");

// Profile Flags:
Is_A1_Mini = (Printer_Profile == "A1_Mini");
Is_Std_256 = (Printer_Profile == "Standard_256");

// A1 Mini auto-scaling formula guarantees the body width fits within 170mm (leaving 10mm safety margin on 180mm bed):
function a1_scale_for_text(txt) = min(25.0, 130.0 / (0.75 * (len(txt) - 1) + 1.0));

// Active Parametric Dimensions:
function get_text_scale(txt = Resolved_Text) = Is_A1_Mini ? a1_scale_for_text(txt) :
                                               Is_Std_256 ? 50.0 : Text_Scale;

Act_Bubble_Size = Is_A1_Mini ? 14.0 : (Is_Std_256 ? 20.0 : Bubble_Size);
Act_Box_Depth   = Is_A1_Mini ? 45.0 : (Is_Std_256 ? 60.0 : Box_Depth);
Act_Wall_Thick  = Is_A1_Mini ? 3.5  : (Is_Std_256 ? 4.0  : Wall_Thickness);
Act_Back_Thick  = Is_A1_Mini ? 2.5  : (Is_Std_256 ? 3.0  : Back_Thickness);
Act_Base_Y      = Is_A1_Mini ? -25.0: (Is_Std_256 ? -40.0: Flat_Base_Y_Level);
Act_Base_Thick  = Is_A1_Mini ? 4.0  : (Is_Std_256 ? 5.0  : Base_Thickness);
Act_Slot_W      = Is_A1_Mini ? 4.2  : (Is_Std_256 ? 4.5  : Coin_Slot_Width);
Act_Slot_L      = Is_A1_Mini ? 32.0 : (Is_Std_256 ? 35.0 : Coin_Slot_Length);
Act_Slot_Y      = Is_A1_Mini ? 16.0 : (Is_Std_256 ? 25.0 : Coin_Slot_Y);
Act_Plate_Thick = Is_A1_Mini ? 2.5  : (Is_Std_256 ? 3.0  : Separate_Front_Plate_Thickness);
Act_Text_Raise  = Is_A1_Mini ? 3.0  : (Is_Std_256 ? 4.0  : Text_Raise);
Act_Ledge_W     = Is_A1_Mini ? 1.8  : (Is_Std_256 ? 2.0  : Ledge_Width);
Act_Fit_Tol     = Is_A1_Mini ? 0.35 : (Is_Std_256 ? 0.4  : Fit_Tolerance);
Act_Cap_D       = Is_A1_Mini ? 26.0 : (Is_Std_256 ? 35.0 : Cap_Diameter);
Act_Notch_W     = Is_A1_Mini ? 8.0  : (Is_Std_256 ? 10.0 : Notch_Width);
Act_Notch_D     = Is_A1_Mini ? 3.5  : (Is_Std_256 ? 4.0  : Notch_Depth);
Act_Lock_Tol    = Is_A1_Mini ? 0.5  : (Is_Std_256 ? 0.6  : Lock_Tolerance);
Act_Cap_Flange_D = Is_A1_Mini ? (Act_Cap_D + 12.0) : (Act_Cap_D + 15.0);

function get_step(txt = Resolved_Text) = get_text_scale(txt) * 0.75 + Letter_Spacing;
function get_x(idx, txt = Resolved_Text) = idx * get_step(txt);

module content_shape(i, txt = Resolved_Text) {
    s = get_text_scale(txt);
    if (Is_SVG) scale(SVG_Scale) import(SVG_File, center=true, dpi=DPI_Adjustment);
    else text(txt[i], font = Font_Selection, size = s, halign="center", valign="center");
}

module text_layer(txt = Resolved_Text) {
    s = get_text_scale(txt);
    if (Is_SVG) {
        content_shape(0, txt);
    } else if (Spacing_Engine == "Proportional") {
        // Native HarfBuzz kerning & proportional font spacing (eliminates gaps around 'I'):
        sp = 1.0 + (Letter_Spacing / 20.0);
        text(txt, font = Font_Selection, size = s, halign = "center", valign = "center", spacing = sp);
    } else {
        // Legacy character-by-character fixed step:
        Word_Offset_X = -get_x(len(txt)-1, txt) / 2;
        for(i=[0:len(txt)-1]) translate([Word_Offset_X + get_x(i, txt), 0, 0]) content_shape(i, txt);
    }
}

// Just the pure text (used for the raised front letters)
module merged_text(txt = Resolved_Text) { union() text_layer(txt); }

// 🌉 The Invisible Bridge: Connects all text spaces structurally behind the scenes
module connected_silhouette(txt = Resolved_Text) {
    s = get_text_scale(txt);
    union() {
        merged_text(txt);
        if (!Is_SVG && len(txt) > 1) {
            Total_Width = (len(txt) * s * 0.85);
            // Creates a hidden central bar to fuse separate words/letters into a single body
            translate([-Total_Width / 2, -s*0.2])
                square([Total_Width, s*0.4]);
        }
    }
}

module cap_cutout() {
    cylinder(d = Act_Cap_D + Act_Lock_Tol, h = Act_Back_Thick + 2, $fn=60);
    for(i = [0, 120, 240]) {
        rotate([0, 0, i])
            translate([Act_Cap_D/2 - 2, -Act_Notch_W/2, 0])
                cube([Act_Notch_D + 4, Act_Notch_W, Act_Back_Thick + 2]);
    }
}

module tab_bumper() {
    Bumper_H = Is_A1_Mini ? 3.5 : 4.0; 
    difference() {
        cylinder(d = Act_Cap_D + Act_Notch_D*2 + (Is_A1_Mini ? 8 : 10), h = Bumper_H, $fn=60);
        translate([0,0,-1]) cylinder(d = Act_Cap_D + Act_Lock_Tol, h = Bumper_H + 2, $fn=60);
        for(i = [0, 120, 240]) {
            rotate([0, 0, i])
            for(a = [0 : 3 : 60]) {
                rotate([0, 0, -a])
                translate([Act_Cap_D/2 - 2, -(Act_Notch_W+2)/2, -1])
                    cube([Act_Notch_D + (Is_A1_Mini ? 8 : 10), Act_Notch_W + 2, Bumper_H + 2]);
            }
        }
    }
    for(i = [0, 120, 240]) {
        rotate([0, 0, i - 50]) 
        translate([(Act_Cap_D + Act_Notch_D)/2, 0, Bumper_H/2])
            cylinder(d = 1.5, h = Bumper_H, center=true, $fn=20);
    }
}

// 🛡️ The Base Math Fix: Generates a raw shape using the connected silhouette
module raw_stretched_shape(radius, txt = Resolved_Text) {
    union() {
        offset(r = radius) connected_silhouette(txt);
        if (Stand_Style == "Conforming Skirt") {
            max_skirt = Is_A1_Mini ? 50 : 80;
            for(i=[2:2:max_skirt]) {
                translate([0, -i]) offset(r = radius) connected_silhouette(txt);
            }
        } else {
            Plinth_Width = Is_SVG ? SVG_Plinth_Width : (get_x(len(txt)-1, txt) + Act_Bubble_Size*2 + 20); 
            Plinth_X_Offset = -Plinth_Width/2;
            Diff = Act_Bubble_Size - radius;
            Block_W = Plinth_Width - Diff*2;
            Block_X = Plinth_X_Offset + Diff;
            
            translate([Block_X, Act_Base_Y - 20])
                square([Block_W, abs(Act_Base_Y) + 40]);
        }
    }
}

// Profile Slicers guaranteeing the exact floor thicknesses!
module outer_profile(txt = Resolved_Text) {
    difference() {
        raw_stretched_shape(Act_Bubble_Size, txt);
        translate([-2500, -5000 + Act_Base_Y]) square([5000, 5000]);
    }
}

module cavity_profile(txt = Resolved_Text) {
    difference() {
        raw_stretched_shape(Act_Bubble_Size - Act_Wall_Thick, txt);
        // Mathematic guarantee: Cuts the void exactly Act_Base_Thick above the floor!
        translate([-2500, -5000 + Act_Base_Y + Act_Base_Thick]) square([5000, 5000]);
    }
}

module ledge_profile(txt = Resolved_Text) {
    difference() {
        raw_stretched_shape(Act_Bubble_Size - Act_Wall_Thick + Act_Ledge_W, txt);
        translate([-2500, -5000 + Act_Base_Y + Act_Base_Thick]) square([5000, 5000]);
    }
}

module front_plate_profile(txt = Resolved_Text) {
    difference() {
        raw_stretched_shape(Act_Bubble_Size - Act_Wall_Thick + Act_Ledge_W - Act_Fit_Tol, txt);
        translate([-2500, -5000 + Act_Base_Y + Act_Base_Thick + Act_Fit_Tol]) square([5000, 5000]);
    }
}

// Builds the entire body lying flat on its back (bed contact across backplate, zero supports)
module body_flat(txt = Resolved_Text) {
    color(Body_Color)
    union() {
        difference() {
            // 1. The main solid body (Skirt attached and sliced flush)
            linear_extrude(Act_Box_Depth) outer_profile(txt);

            // 2. Internal Cavity (Floor guaranteed to be thick and solid)
            translate([0, 0, Act_Back_Thick]) 
                linear_extrude(Act_Box_Depth)
                    cavity_profile(txt);

            // 3. The Internal Ledge Recess
            translate([0, 0, Act_Box_Depth - Act_Plate_Thick])
                linear_extrude(Act_Plate_Thick + 1)
                    ledge_profile(txt);

            // 4. Coin Slot - Pierces ONLY the top roof into the cavity (NEVER cuts through the bottom floor!)
            slot_start_y = max(5.0, Act_Slot_Y - 10.0); // Starts inside the upper cavity
            translate([Coin_Slot_X - Act_Slot_L/2, slot_start_y, (Act_Box_Depth - Act_Slot_W)/2])
                cube([Act_Slot_L, 100.0, Act_Slot_W]);

            // 5. Twist Lock Cutout (Punches through backplate)
            translate([Cap_X, Cap_Y, -1]) cap_cutout();
        }
        
        // 6. Add Twist Lock Track strictly inside the cavity
        intersection() {
            translate([Cap_X, Cap_Y, Act_Back_Thick]) tab_bumper();
            translate([0, 0, Act_Back_Thick]) 
                linear_extrude(Act_Box_Depth) cavity_profile(txt);
        }
    }
}

// Builds the removable twist & lock cap lying flat on its outer flange
module twist_cap() {
    color(Cap_Color)
    union() {
        flange_h = Is_A1_Mini ? 2.5 : 3.0;
        difference() {
            cylinder(d = Act_Cap_Flange_D, h = flange_h, $fn=60);
            translate([0, 0, flange_h/2])
                cube([Act_Cap_D - (Is_A1_Mini ? 6 : 8), Is_A1_Mini ? 3.5 : 4.0, flange_h + 2], center=true);
        }
        translate([0, 0, flange_h])
            cylinder(d = Act_Cap_D - Act_Lock_Tol, h = Act_Back_Thick + (Is_A1_Mini ? 2.5 : 3.0), $fn=60);
            
        Tab_Thickness = Is_A1_Mini ? 2.0 : 2.5;
        Tab_Z = flange_h + Act_Back_Thick + (Is_A1_Mini ? 0.3 : 0.4); 
        for(i = [0, 120, 240]) {
            rotate([0, 0, i])
                translate([(Act_Cap_D - Act_Lock_Tol)/2 - 1, -(Act_Notch_W - Act_Lock_Tol)/2, Tab_Z])
                    cube([Act_Notch_D, Act_Notch_W - Act_Lock_Tol, Tab_Thickness]);
        }
    }
}

// Flat front plate without letters (for laser cutting, clear PETG window, or blank plate)
module front_plate_blank(txt = Resolved_Text) {
    color(Front_Assembly_Color)
        linear_extrude(Act_Plate_Thick)
            front_plate_profile(txt);
}

// Standalone 3D raised letters (for printing separately and gluing on)
module text_letters_alone(txt = Resolved_Text) {
    h = (Act_Text_Raise > 0) ? Act_Text_Raise : 4.0;
    color(Text_Color)
        linear_extrude(h)
            merged_text(txt);
}

// Complete front plate assembly with integrated raised lettering
module front_plate_assembly(txt = Resolved_Text) {
    front_plate_blank(txt);
    
    if (Act_Text_Raise > 0) {
        // Pure text is placed here so the invisible bridge does NOT show up!
        translate([0, 0, Act_Plate_Thick])
            color(Text_Color) linear_extrude(Act_Text_Raise) merged_text(txt);
    }
}


/* --- MASTER EXECUTION & EXPORT SWITCH --- */

// Validation of export_part
is_valid_export = (
    Resolved_Part == "assembly" ||
    Resolved_Part == "body" ||
    Resolved_Part == "body_upright" ||
    Resolved_Part == "stopper" || Resolved_Part == "cap" ||
    Resolved_Part == "front_plate" || Resolved_Part == "nameplate" || Resolved_Part == "front_assembly" ||
    Resolved_Part == "front_plate_blank" ||
    Resolved_Part == "letters" || Resolved_Part == "text" ||
    Resolved_Part == "all_parts" ||
    Resolved_Part == "stoppers_batch" || Resolved_Part == "stoppers_x4" ||
    Resolved_Part == "batch_bodies" ||
    Resolved_Part == "batch_front_plates"
);

assert(is_valid_export, str("ERROR: Invalid export_part '", Resolved_Part, "'. Valid options: 'assembly', 'body', 'body_upright', 'stopper', 'front_plate', 'front_plate_blank', 'letters', 'all_parts', 'stoppers_batch', 'batch_bodies', 'batch_front_plates'."));

assert(len(Resolved_Text) > 0, "ERROR: Name/Text cannot be empty!");


// 1. Fully Assembled Preview
if (Resolved_Part == "assembly") {
    translate([0, 0, -Act_Base_Y]) rotate([90, 0, 0]) {
        body_flat(Resolved_Text);
        translate([0, 0, Act_Box_Depth - Act_Plate_Thick])
            front_plate_assembly(Resolved_Text);
        flange_h = Is_A1_Mini ? 2.5 : 3.0;
        translate([Cap_X, Cap_Y, -flange_h])
            twist_cap();
    }
}

// 2. Main Body (Flat on back - 100% recommended for 3D printing, 0 supports)
else if (Resolved_Part == "body") {
    body_flat(Resolved_Text);
}

// 3. Main Body (Upright standing)
else if (Resolved_Part == "body_upright") {
    translate([0, 0, -Act_Base_Y])
        rotate([90, 0, 0])
            body_flat(Resolved_Text);
}

// 4. Twist & Lock Stopper Plug
else if (Resolved_Part == "stopper" || Resolved_Part == "cap") {
    twist_cap();
}

// 5. Front Plate with Raised Letters
else if (Resolved_Part == "front_plate" || Resolved_Part == "nameplate" || Resolved_Part == "front_assembly") {
    front_plate_assembly(Resolved_Text);
}

// 6. Blank Front Plate (No lettering)
else if (Resolved_Part == "front_plate_blank") {
    front_plate_blank(Resolved_Text);
}

// 7. Standalone 3D Letters
else if (Resolved_Part == "letters" || Resolved_Part == "text") {
    text_letters_alone(Resolved_Text);
}

// 8. All Parts Laid Out Flat (Single Child) - Non-overlapping print-ready arrangement
else if (Resolved_Part == "all_parts") {
    body_flat(Resolved_Text);
    
    y_shift = abs(Act_Base_Y) + Act_Bubble_Size * 2 + 20;
    translate([0, -y_shift, 0])
        front_plate_assembly(Resolved_Text);
        
    x_cap = (get_x(len(Resolved_Text)-1, Resolved_Text)/2) + Act_Bubble_Size + Act_Cap_Flange_D/2 + 15;
    translate([x_cap, -y_shift, 0])
        twist_cap();
}

// 9. Batch 4x Stoppers (2x2 grid for batch printing)
else if (Resolved_Part == "stoppers_batch" || Resolved_Part == "stoppers_x4") {
    grid_spacing = Act_Cap_Flange_D + 12; // 50mm center-to-center for A1 Mini
    for (ix = [-0.5, 0.5], iy = [-0.5, 0.5]) {
        translate([ix * grid_spacing, iy * grid_spacing, 0])
            twist_cap();
    }
}

// 10. Batch 4 Bodies Layout (Shivansh, Luvish, Janice, Nivaan)
else if (Resolved_Part == "batch_bodies") {
    echo("NOTE: 'batch_bodies' displays all 4 personalized bodies in a 2x2 grid. For standard build plates, export each body individually.");
    names_raw = ["Shivansh", "Luvish", "Janice", "Nivaan"];
    names_4 = (Letter_Casing == "UPPERCASE") ? ["SHIVANSH", "LUVISH", "JANICE", "NIVAAN"] : names_raw;
    x_sep = Is_A1_Mini ? 190 : 330;
    y_sep = Is_A1_Mini ? 80 : 130;
    translate([-x_sep/2,  y_sep/2, 0]) body_flat(names_4[0]);
    translate([ x_sep/2,  y_sep/2, 0]) body_flat(names_4[1]);
    translate([-x_sep/2, -y_sep/2, 0]) body_flat(names_4[2]);
    translate([ x_sep/2, -y_sep/2, 0]) body_flat(names_4[3]);
}

// 11. Batch 4 Front Plates Layout (Shivansh, Luvish, Janice, Nivaan)
else if (Resolved_Part == "batch_front_plates") {
    names_raw = ["Shivansh", "Luvish", "Janice", "Nivaan"];
    names_4 = (Letter_Casing == "UPPERCASE") ? ["SHIVANSH", "LUVISH", "JANICE", "NIVAAN"] : names_raw;
    x_sep = Is_A1_Mini ? 190 : 330;
    y_sep = Is_A1_Mini ? 80 : 130;
    translate([-x_sep/2,  y_sep/2, 0]) front_plate_assembly(names_4[0]);
    translate([ x_sep/2,  y_sep/2, 0]) front_plate_assembly(names_4[1]);
    translate([-x_sep/2, -y_sep/2, 0]) front_plate_assembly(names_4[2]);
    translate([ x_sep/2, -y_sep/2, 0]) front_plate_assembly(names_4[3]);
}
