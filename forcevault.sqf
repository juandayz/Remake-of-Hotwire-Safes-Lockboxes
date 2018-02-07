
private ["_Message","_ownerID","_vault","_isunlockable"];

_vault = _this select 3;
_isunlockable = (((typeOf _vault) == "VaultStorageLocked") || ((typeOf _vault) == "LockboxStorageLocked"));
_ownerID = cursorTarget getVariable ["ownerPUID","0"];

player removeAction s_player_hotwirevault;
s_player_hotwirevault = -1;

if ("ItemHotwireKit" in magazines player) exitWith {
systemChat("You need a hotwire kit in your inventory");
};


dayz_actionInProgress = true;
player removeMagazine "ItemHotwireKit";


if (_isunlockable) then {

if ([0.10] call fn_chance)   exitWith {
dayz_actionInProgress = false;
systemChat("Bad Luck, i could not open it and broke the Hotwire Kit");                           
};

systemChat("Done! I have opened the vault");

dayz_combination = _vault getVariable["CharacterID","0"];
_vault spawn player_unlockVault;
dayz_actionInProgress = false;
                
};
