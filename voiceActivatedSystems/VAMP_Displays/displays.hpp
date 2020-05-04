/*
Old notes:
I believe I can now remove some of these blocks, but do your research first!!
note, in order to use this stuff in a mission like Liberation, you need to copy the content below and paste within the mission's own class RscTitles { paste here }..

------
New Notes 

17 Feb 2020

This .hpp file will aim to deliver 'just' VACF and VAAS UI elements. It will also aim to deliver class inheritance.

I am commenting out debug classes, as I believe them to be the system I used to track hardcoded unit tracking (i.e. unit x is x m away at x heading).

Idea: I want to be able to always see the coords I capture using VACF. But I also want to store some of these and cycle through them. I might even want to name them or label them. Currently only the latest coord is stored and shown in bottom right of screen. I want to change this to top center area - this will become new info section. Here is the idea - can I add a 'dialog' element here - get the mouse cursor, then if I click the coord section, I can cycle through the captured coords. I can also name them using text. Initially these would be given default names, such as RGBYW / Romeo / Golf / Bravo / Yankee / Whiskey. The VA profile can be set up to respond to these initial lablels "VACF Show Whiskey" for example. But if the user decided to change to labels to say "Primary Target" "Secondary Target etc", these labels could be created in VA. If Romeo was 1, Golf was 2, then if you wanted to change Romeo to Primary Target, you'd just replace "Romeo" with "primary target".

Idea 2: I could avoid using a dialog altogether, and have a VACF state that enables keybinds to show 1, 2, 3, 4, 5 or all saved data. To avoid having a dialog, but enabing customisation of coords, you could have Alpha - Zulu / 1 - 10 / Primary Secondary / RGBA / LZ / PZ / Fallback / 
essentially you could create your own label for a location.
Using VACF, you could create a location, and then say:
"Set Name"
(show all choices)
"LZ" "Alpha" "Zulu" "1" 
Every time you choose something, it gets added to the string below the number. You can delete last, delete all, or save and close.
Once save and close, your label is now set. This enables two things - you can firstly track your own locations in any mission. But you can also set up a naming convention in VA; for example, if you ... bad idea, this got very complicate dvery quickly!

OK I think we need to hard code these options like this:
"Set"
- Primary Target (1)
- Secondary Target (2)
- Primary Staging  (3)
- Secondary Staging (4)
- Alpha / Bravo / Charlie / Delta / Echo (5 6 7 8 9) 
- Dynamic Target (default - 0) if you do not label anything, this just gets overwritted each time you call in a new coord)
The good thing about this, is that you could link this system to some other ordering system like VAHC?

"Show Stored Locations"
This will show only those labels that have been "set". If nothing has been set, then only the last dynamic label would be shown.
If no coords had been captured, then this would need to say something like "nothing captured yet mate"

Use stored locations - when using VAAS, you should be able to refer to stored locations.

Future-Self Notes: 
- IDD seems to be th same throughout, only the IDCs need to be unique

IDC Convention 
VACF    1001
VACF_n1 9900
VACF_h1 9901
VAAS_h1 99001

Layout Guide
VACF 
VACF_n1 
VACF_h1 
VAAS_h1 
*/

class RscTitles {

    // ---------------------------------------------------------------------------------------------------------
    // ------------- Default Class - Start
    // ---------------------------------------------------------------------------------------------------------
    class Default {
        idd                          = -1;
        fadein                       = 0;
        fadeout                      = 1;
        duration                     = 0;
    };
    // ---------------------------------------------------------------------------------------------------------
    // ------------- Default Class - Start
    // ---------------------------------------------------------------------------------------------------------
    
    // ------------- <><><><><>
    
    // ---------------------------------------------------------------------------------------------------------
    // ------------- VACF Classes - Start
    // ---------------------------------------------------------------------------------------------------------
    // VACF is managed by three classes, purely for display of data while the system is in use, and shows data 
    // persistently afterwards
    // VACF - Bottom right of screen, shows result of VACF until replaced by new VACF call 
    // VACF_n1 - Given that n1 and h1 are both at the same place on-screen, I assume one replces the other ..?
    // VACF_h1 - heading (label) vs number?
    // I want to change the basic label at the bottom right, and instead have a system that can be shown/hidden
    // It should also enable upto 10 locations (stored in game memory)
    // It should also enable a label association, maybe more than one label per line 
    // Question - should this work within the map as well as in-game? A map view might be nice.
    // ---------------------------------------------------------------------------------------------------------
    
     
    class VACF {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VACF";
		onLoad                      = "with uiNameSpace do { VACF = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 1001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.950 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";	
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "4";
				}; 
            };
		};
	};

    class VACF_n1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VACF_n1";
		onLoad                      = "with uiNameSpace do { VACF_n1 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 9900;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.150 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VACF_h1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VACF_h1";
		onLoad                      = "with uiNameSpace do { VACF_h1 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 9901;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.150 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};
    // ---------------------------------------------------------------------------------------------------------
    // ------------- VACF Classes - End
    // ---------------------------------------------------------------------------------------------------------

    // ------------- <><><><><>

    // ---------------------------------------------------------------------------------------------------------
    // ------------- VAAS Classes - Start
    // ---------------------------------------------------------------------------------------------------------
    /*
    Notes - I need to be able to show:
    - that the system is live and awaiting data - top center of screen "Artillery Available" / Artillery Offline"
    - user selection HE / SU / SM / FL - 
    - lat/lon 
    - rounds 
    - radius 
    - confirm 
    - close / repeat / adjust fire 
    - it needs to work well with VACF - this is all part of the same system - 
    */
    // VAAS_h1 shows that the system is live, online - top center of screen "Artillery Available" / Artillery Offline"
    // I should copy the VACF system of showing text and values in one element 
    // System should have different formats depending on type of ord requested
    // Hellfire: 10Grid: [] / CONFIRM?
    // HE Artillery: 8Grid [] / Radius [] / Rounds []
    // Smoke: 8Grid [] / Number [] / Colour [] / Area [] 
    //
    // 150h VAAS_n1 manages initial welcome message asking for data
    // 150h VAAS_t1 manages the 'type' of ord - Hellfire / HE / Smoke / Flares 
    // 175h VAAS_h1 manages initial coord input 'heading' / 8 or 10 grid 
    // 200h VAAS_col manages any colour selection  
    // 225h VAAS_num manages number of rounds 
    // 250h VAAS_zne manages area definition
    // 275h VAAS_c1 manages confirm or cancel interaction

    // ideally should be:
    // VAAS_welcome manages initial on-screen message(s)
    // VAAS_type manages the 'type' of ord - Hellfire / HE / Smoke / Flares 
    // VAAS_coord manages initial coord input 'heading' / 8 or 10 grid 
    // VAAS_col manages any colour selection  
    // VAAS_num manages number of rounds 
    // VAAS_area manages area definition
    // VAAS_confirm manages confirm or cancel interaction

    // ---------------------------------------------------------------------------------------------------------

    class VAAS_n1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAAS_n1";
		onLoad                      = "with uiNameSpace do { VAAS_n1 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.150 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VAAS_h1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAAS_h1";
		onLoad                      = "with uiNameSpace do { VAAS_h1 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99002; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.150 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VAAS_t1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAAS_t1";
		onLoad                      = "with uiNameSpace do { VAAS_t1 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99003; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.125 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VAAS_c1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAAS_c1";
		onLoad                      = "with uiNameSpace do { VAAS_c1 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99004; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.275 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

// ---------------------------------------------------------------------------------------------------------
// ------------- VAAS Classes - End
// ---------------------------------------------------------------------------------------------------------

// ------------- <><><><><>

// ---------------------------------------------------------------------------------------------------------
// ------------- VADS Classes - Start
// ---------------------------------------------------------------------------------------------------------
/*
VADS - Voice Activated Data Storage
This will enable a dynamic list of coords, and associayed labels for upto 10 locations 
These can be objectives, waypoints, LZs, full label list TBC
*/
    class VADS_header {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_header";
		onLoad                      = "with uiNameSpace do { VADS_header = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990000; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.375 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_line1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_line1";
		onLoad                      = "with uiNameSpace do { VADS_line1 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990001; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.400 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_line2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_line2";
        onLoad                      = "with uiNameSpace do { VADS_line2 = _this select 0 }";
        class controls {
            class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990002; 
                style               = 0x00;
                lineSpacing         = 1;
                x                   = 0.150 * safezoneW + safezoneX;
                y                   = 0.425 * safezoneH + safezoneY;
                w                   = 0.200 * safezoneW;
                h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
                }; 
            };
        };
    };

    class VADS_line3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_line3";
		onLoad                      = "with uiNameSpace do { VADS_line3 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990003; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.450 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_line4 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_line4";
		onLoad                      = "with uiNameSpace do { VADS_line4 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990004; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.475 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_line5 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_line5";
		onLoad                      = "with uiNameSpace do { VADS_line5 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990005; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.500 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_line6 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_line6";
		onLoad                      = "with uiNameSpace do { VADS_line6 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990006; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.525 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_line7 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_line7";
		onLoad                      = "with uiNameSpace do { VADS_line7 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990007; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.550 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_line8 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_line8";
		onLoad                      = "with uiNameSpace do { VADS_line8 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990008; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.575 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    // class VADS_line9 {
    //     idd                         = 1000000;
    //     movingEnable                = 0;
    //     enableSimulation            = 1;
    //     enableDisplay               = 1;
    //     duration                    = 99999;
    //     fadein                      = 0.1;
    //     fadeout                     = 2;
    //     name                        = "VADS_line9";
	// 	onLoad                      = "with uiNameSpace do { VADS_line9 = _this select 0 }";
    //     class controls {
	// 	    class structuredText {
    //             access              = 0;
    //             type                = 13;
    //             idc                 = 990009; 
    //             style               = 0x00;
    //             lineSpacing         = 1;
	// 			x                   = 0.150 * safezoneW + safezoneX;
	// 			y                   = 0.600 * safezoneH + safezoneY;
	// 			w                   = 0.200 * safezoneW;
	// 			h                   = 0.025 * safezoneH;
    //             size                = 0.020;
    //             colorBackground[]   = {0,0,0,0};
    //             colorText[]         = {1,1,1,1};
    //             text                = "";
    //             font                = "PuristaSemiBold";
    //             class Attributes {
    //                 font            = "PuristaSemiBold";
    //                 color           = "#FFFFFF";
    //                 align           = "CENTER";
    //                 valign          = "CENTER";
    //                 shadow          = false;
    //                 shadowColor     = "#000000";
    //                 underline       = false;
    //                 size            = "2";
	// 			}; 
    //         };
	// 	};
	// };

    // class VADS_line10 {
    //     idd                         = 1000000;
    //     movingEnable                = 0;
    //     enableSimulation            = 1;
    //     enableDisplay               = 1;
    //     duration                    = 99999;
    //     fadein                      = 0.1;
    //     fadeout                     = 2;
    //     name                        = "VADS_line10";
	// 	onLoad                      = "with uiNameSpace do { VADS_line10 = _this select 0 }";
    //     class controls {
	// 	    class structuredText {
    //             access              = 0;
    //             type                = 13;
    //             idc                 = 9900010; 
    //             style               = 0x00;
    //             lineSpacing         = 1;
	// 			x                   = 0.150 * safezoneW + safezoneX;
	// 			y                   = 0.625 * safezoneH + safezoneY;
	// 			w                   = 0.200 * safezoneW;
	// 			h                   = 0.025 * safezoneH;
    //             size                = 0.020;
    //             colorBackground[]   = {0,0,0,0};
    //             colorText[]         = {1,1,1,1};
    //             text                = "";
    //             font                = "PuristaSemiBold";
    //             class Attributes {
    //                 font            = "PuristaSemiBold";
    //                 color           = "#FFFFFF";
    //                 align           = "CENTER";
    //                 valign          = "CENTER";
    //                 shadow          = false;
    //                 shadowColor     = "#000000";
    //                 underline       = false;
    //                 size            = "2";
	// 			}; 
    //         };
	// 	};
	// };

    class VADS_footer {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_footer";
		onLoad                      = "with uiNameSpace do { VADS_footer = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990011; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.150 * safezoneW + safezoneX;
				y                   = 0.650 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

// ---------------------------------------------------------------------------------------------------------
// ------------- VADS Classes - End
// ---------------------------------------------------------------------------------------------------------

// ------------- <><><><><>

// ---------------------------------------------------------------------------------------------------------
// ------------- VADS Labels - Start
// ---------------------------------------------------------------------------------------------------------

    class VADS_RSClabelheader {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabelheader";
		onLoad                      = "with uiNameSpace do { VADS_RSClabelheader = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990020; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.375 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_RSClabel1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabel1";
		onLoad                      = "with uiNameSpace do { VADS_RSClabel1 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990021; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.400 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_RSClabel2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabel2";
		onLoad                      = "with uiNameSpace do { VADS_RSClabel2 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990022; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.425 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_RSClabel3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabel3";
		onLoad                      = "with uiNameSpace do { VADS_RSClabel3 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990023; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.450 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_RSClabel4 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabel4";
		onLoad                      = "with uiNameSpace do { VADS_RSClabel4 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990024; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.475 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_RSClabel5 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabel5";
		onLoad                      = "with uiNameSpace do { VADS_RSClabel5 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990025; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.500 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_RSClabel6 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabel6";
		onLoad                      = "with uiNameSpace do { VADS_RSClabel6 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990026; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.525 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_RSClabel7 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabel7";
		onLoad                      = "with uiNameSpace do { VADS_RSClabel7 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990027; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.550 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

    class VADS_RSClabel8 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VADS_RSClabel8";
		onLoad                      = "with uiNameSpace do { VADS_RSClabel8 = _this select 0 }";
        class controls {
		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 990028; 
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.575 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
                class Attributes {
                    font            = "PuristaSemiBold";
                    color           = "#FFFFFF";
                    align           = "CENTER";
                    valign          = "CENTER";
                    shadow          = false;
                    shadowColor     = "#000000";
                    underline       = false;
                    size            = "2";
				}; 
            };
		};
	};

// ---------------------------------------------------------------------------------------------------------
// ------------- VADS Labels - End
// ---------------------------------------------------------------------------------------------------------

// ------------- <><><><><>



/*
Test 17 Feb - if this code works then delete everything below, as the focus in this mission is just VACF and VAAS 
19 Feb - this does seem to work ok .. delete and retest!




// copy from VAUS hpp
    class VAUS_MAINTITLE {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_MAINTITLE";
		onLoad                      = "with uiNameSpace do { VAUS_MAINTITLE = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10000;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.200 * safezoneW + safezoneX;
				y                   = 0.150 * safezoneH + safezoneY;
				w                   = 0.600 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "4";
				}; 
            };
		};
	};

    class VAUS_SUBTITLE_n1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_SUBTITLE_n1";
		onLoad                      = "with uiNameSpace do { VAUS_SUBTITLE_n1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.200 * safezoneW + safezoneX;
				y                   = 0.200 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class VAUS_SUBTITLE_n2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_SUBTITLE_n2";
		onLoad                      = "with uiNameSpace do { VAUS_SUBTITLE_n2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10002;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.200 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class VAUS_SUBTITLE_n3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_SUBTITLE_n3";
		onLoad                      = "with uiNameSpace do { VAUS_SUBTITLE_n3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10003;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.200 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

// content 

    class VAUS_CONTENT_n1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_CONTENT_n1";
		onLoad                      = "with uiNameSpace do { VAUS_CONTENT_n1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10004;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.200 * safezoneW + safezoneX;
				y                   = 0.250 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.350 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class VAUS_CONTENT_n2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_CONTENT_n2";
		onLoad                      = "with uiNameSpace do { VAUS_CONTENT_n2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10005;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.250 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.350 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class VAUS_CONTENT_n3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_CONTENT_n3";
		onLoad                      = "with uiNameSpace do { VAUS_CONTENT_n3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10006;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.250 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.350 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

// confirm or clear 

    class VAUS_CONFIRMCANCEL {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_CONFIRMCANCEL";
		onLoad                      = "with uiNameSpace do { VAUS_CONFIRMCANCEL = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10007;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.200 * safezoneW + safezoneX;
				y                   = 0.600 * safezoneH + safezoneY;
				w                   = 0.600 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

// confirm message 

    class VAUS_THANKS {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "VAUS_THANKS";
		onLoad                      = "with uiNameSpace do { VAUS_THANKS = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 10008;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.300 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.100 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "5";
				}; 
            };
		};
	};

// to here - check can delete 



// experimental
// based on a lower third concept
// with is one third of the screen, centered 
// meaning one full line = 
/*


0 0 1 1 1 1 1 1 0 0 - full title 6 wide / title 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / sub titles 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 1 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 2 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 3 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 4 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 5 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 6 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 7 
0 0 1 1/1 1/1 1 0 0 - three columns  2 wide / line 7 


0 0 0 0 0 0 0 0 0 0
0 1 1 1 1 1 1 1 1 0 - full title 8 wide
0 1 1/1 1/1 1/1 1 0 - 4 columns 2 wide


1111111111
111111111111111111111111111111 1111111111 1111111111 1111111111 1111111111 111111111111111111111111111111
111111111111111111111111111111 0000000000000000000000000000000000000000 111111111111111111111111111111      w30 l40
111111111111111111111111111111 0000000000 00000000000000000000 0000000000 111111111111111111111111111111   w30 l10 / w40 l10/ w50 l10 / w60 l10 
111111111111111111111111111111 0000000000 00000 00000 00000 00000 0000000000 111111111111111111111111111111 w30 l10 / w40 l5 / w45 l5 / w50 l5 / w55 l5 / w60 l10
111111111111111111111111111111 0000000000 00000 00000 00000 00000 0000000000 111111111111111111111111111111 w30 l10 / w40 l5 / w45 l5 / w50 l5 / w55 l5 / w60 l10
111111111111111111111111111111 0000000000000000000000000000000000000000 111111111111111111111111111111      w30 l40

18 blocks

Name: block18
Code: B18
B18_L1_1
B18_L2_1 B18_L2_2 B18_L2_3 B18_L2_4
B18_L3_1 B18_L3_2 B18_L3_3 B18_L3_4 B18_L3_5 B18_L3_6
B18_L4_1 B18_L4_2 B18_L4_3 B18_L4_4 B18_L4_5 B18_L4_6
B18_L5_1


// -----------------------------
B18_L1_1 x30 y60 l40 h05 

B18_L2_1 x30 y65 l10 h05 
B18_L2_2 x40 y65 l20 h05
B18_L2_3 x60 y65 l10 h05

B18_L3_1 x30 y70 l10 h05
B18_L3_2 x40 y70 l05 h05
B18_L3_3 x45 y70 l05 h05 
B18_L3_4 x50 y70 l05 h05
B18_L3_5 x55 y70 l05 h05
B18_L3_6 x60 y70 l10 h05

B18_L4_1 x30 y75 l10 h05
B18_L4_2 x40 y75 l05 h05
B18_L4_3 x45 y75 l05 h05
B18_L4_4 x50 y75 l05 h05
B18_L4_5 x55 y75 l05 h05
B18_L4_6 x60 y75 l10 h05 

B18_L5_1 x30 y80 l20 h05 
B18_L5_2 x50 y80 l20 h05
// -----------------------------
*/


    class B18_L1_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L1_1";
		onLoad                      = "with uiNameSpace do { B18_L1_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.615 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L2_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L2_1";
		onLoad                      = "with uiNameSpace do { B18_L2_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18002;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.650 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L2_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L2_2";
		onLoad                      = "with uiNameSpace do { B18_L2_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18003;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.650 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L2_3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L2_3";
		onLoad                      = "with uiNameSpace do { B18_L2_3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18004;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.650 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L3_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L3_1";
		onLoad                      = "with uiNameSpace do { B18_L3_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18005;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L3_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L3_2";
		onLoad                      = "with uiNameSpace do { B18_L3_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18006;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L3_3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L3_3";
		onLoad                      = "with uiNameSpace do { B18_L3_3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18007;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.450 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L3_4 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L3_4";
		onLoad                      = "with uiNameSpace do { B18_L3_4 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18008;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L3_5 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L3_5";
		onLoad                      = "with uiNameSpace do { B18_L3_5 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18009;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.550 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L3_6 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L3_6";
		onLoad                      = "with uiNameSpace do { B18_L3_6 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18010;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.700 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L4_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L4_1";
		onLoad                      = "with uiNameSpace do { B18_L4_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18011;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L4_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L4_2";
		onLoad                      = "with uiNameSpace do { B18_L4_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18012;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L4_3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L4_3";
		onLoad                      = "with uiNameSpace do { B18_L4_3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18013;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.450 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L4_4 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L4_4";
		onLoad                      = "with uiNameSpace do { B18_L4_4 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18014;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L4_5 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L4_5";
		onLoad                      = "with uiNameSpace do { B18_L4_5 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18015;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.550 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.050 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L4_6 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L4_6";
		onLoad                      = "with uiNameSpace do { B18_L4_6 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18016;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.750 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
				h                   = 0.050 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L5_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L5_1";
		onLoad                      = "with uiNameSpace do { B18_L5_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18017;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.825 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_L5_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "B18_L5_2";
		onLoad                      = "with uiNameSpace do { B18_L5_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18018;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.825 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_BG {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_BG";
		onLoad                      = "with uiNameSpace do { B18_BG = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18020;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.600 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.250 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,0,0,0};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_TopLine {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.1;
        fadeout                     = 2;
        name                        = "B18_TopLine";
		onLoad                      = "with uiNameSpace do { B18_TopLine = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18021;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.680 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.002 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,1,0,1};
                colorText[]         = {0,0,0,0};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_BottomLine1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "B18_BottomLine1";
		onLoad                      = "with uiNameSpace do { B18_BottomLine1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18022;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.800 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
				h                   = 0.004 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,1};
                colorText[]         = {0,0,0,0};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_BottomLine2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "B18_BottomLine2";
		onLoad                      = "with uiNameSpace do { B18_BottomLine2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18023;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.400 * safezoneW + safezoneX;
				y                   = 0.800 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.004 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,1};
                colorText[]         = {0,0,0,0};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_BottomLine3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "B18_BottomLine3";
		onLoad                      = "with uiNameSpace do { B18_BottomLine3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18024;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.600 * safezoneW + safezoneX;
				y                   = 0.800 * safezoneH + safezoneY;
				w                   = 0.100 * safezoneW;
				h                   = 0.004 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,1};
                colorText[]         = {0,0,0,0};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class B18_BottomLine4 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "B18_BottomLine4";
		onLoad                      = "with uiNameSpace do { B18_BottomLine4 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 18025;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.850 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.010 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,1};
                colorText[]         = {0,0,0,0};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

// -------------------------------------

// VA - High Command UI 

// -------------------------------------

/*
I need a universal UI system to avoid having to create a new UI set for each module 
iteration / test = build a sequenced line system, lower third again 

eg, HC orders 

VAHC 
all you really need is confirmation
as the VAP will allow a few diff ways of getting data to the script, it is less formulaic that say VAAS, so just a final comf should be ok 
if this is true, I only need two lines:

HEADER
CONFIRMATION TEXT


*/


    // C_L1_1 is a pure copy of B18_L1_1, with just names changed, but starting from scratch initially to keep thigs as simple as possible
    // class Cxxx = third class system used (currently) for VAHC
    // uses idc 19xxx
    class C_L1_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "C_L1_1";
		onLoad                      = "with uiNameSpace do { C_L1_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 19001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.815 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    // check to confirm of C_L2_1 is used or needed anywhere
    class C_L2_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "C_L2_1";
		onLoad                      = "with uiNameSpace do { C_L2_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 19001;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.640 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};


// -------------------------------------

// VA - Artillery System UI 

// -------------------------------------

/*
I need to be able to show:

- that the system is live and awaiting data
- user selection HE / SU / SM / FL 
- lat/lon 
- rounds 
- radius 
- confirm 
- close / repeat / adjust fire 

*/


// -------------------------------------

// VA - Vehicle Spawner System UI - Class D / Range 20xxx

// -------------------------------------

class D_L1_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L1_1";
		onLoad                      = "with uiNameSpace do { D_L1_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20000;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.615 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L2_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L2_1";
		onLoad                      = "with uiNameSpace do { D_L2_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20010;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.640 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L3_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L3_1";
		onLoad                      = "with uiNameSpace do { D_L3_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20020;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.665 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L3_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L3_2";
		onLoad                      = "with uiNameSpace do { D_L3_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20030;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.665 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L4_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L4_1";
		onLoad                      = "with uiNameSpace do { D_L4_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20040;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.690 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L4_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L4_2";
		onLoad                      = "with uiNameSpace do { D_L4_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20050;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.690 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L5_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L5_1";
		onLoad                      = "with uiNameSpace do { D_L5_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20060;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.715 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L5_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L5_2";
		onLoad                      = "with uiNameSpace do { D_L5_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20070;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.715 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L6_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L6_1";
		onLoad                      = "with uiNameSpace do { D_L6_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20080;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.740 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L6_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L6_2";
		onLoad                      = "with uiNameSpace do { D_L6_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20090;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.740 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L7_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L7_1";
		onLoad                      = "with uiNameSpace do { D_L7_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20100;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.740 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L7_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L7_2";
		onLoad                      = "with uiNameSpace do { D_L7_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20110;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.740 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L8_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L8_1";
		onLoad                      = "with uiNameSpace do { D_L8_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20120;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.765 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

    class D_L8_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0.3;
        fadeout                     = 2;
        name                        = "D_L8_2";
		onLoad                      = "with uiNameSpace do { D_L8_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 20130;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.500 * safezoneW + safezoneX;
				y                   = 0.765 * safezoneH + safezoneY;
				w                   = 0.200 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {0,1,0,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};


};

/*

Notes: Debug classes pasted below on 17 Feb 2020

// ---------------------------------------------------------------------------------------------------------
// ------------- Debug Classes - Start
// ---------------------------------------------------------------------------------------------------------

    class DEBUG_1 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "DEBUG_1";
		onLoad                      = "with uiNameSpace do { DEBUG_1 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99991;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.000 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};
    class DEBUG_2 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "DEBUG_2";
		onLoad                      = "with uiNameSpace do { DEBUG_2 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99992;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.025 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};
    class DEBUG_3 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "DEBUG_3";
		onLoad                      = "with uiNameSpace do { DEBUG_3 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99993;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.050 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};
    class DEBUG_4 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "DEBUG_4";
		onLoad                      = "with uiNameSpace do { DEBUG_4 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99994;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.075 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};
    class DEBUG_5 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "DEBUG_5";
		onLoad                      = "with uiNameSpace do { DEBUG_5 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99995;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.100 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};
    class DEBUG_6 {
        idd                         = 1000000;
        movingEnable                = 0;
        enableSimulation            = 1;
        enableDisplay               = 1;
        duration                    = 99999;
        fadein                      = 0;
        fadeout                     = 2;
        name                        = "DEBUG_6";
		onLoad                      = "with uiNameSpace do { DEBUG_6 = _this select 0 }";
	
        class controls {

		    class structuredText {
                access              = 0;
                type                = 13;
                idc                 = 99996;
                style               = 0x00;
                lineSpacing         = 1;
				x                   = 0.300 * safezoneW + safezoneX;
				y                   = 0.125 * safezoneH + safezoneY;
				w                   = 0.400 * safezoneW;
				h                   = 0.025 * safezoneH;
                size                = 0.020;
                colorBackground[]   = {0,0,0,0};
                colorText[]         = {1,1,1,1};
                text                = "";
                font                = "PuristaSemiBold";
					
                    class Attributes {
						font        = "PuristaSemiBold";
						color       = "#FFFFFF";
						align       = "CENTER";
						valign      = "CENTER";
						shadow      = false;
						shadowColor = "#000000";
						underline   = false;
						size        = "2";
				}; 
            };
		};
	};

// ---------------------------------------------------------------------------------------------------------
// ------------- Debug Classes - Start
// ---------------------------------------------------------------------------------------------------------