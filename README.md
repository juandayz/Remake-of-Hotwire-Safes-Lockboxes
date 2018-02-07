# Remake-of-Hotwire-Safes-Lockboxes

 1-You need a custom fn_selfactions.sqf 
 find: 
 ```
 //Allow owner to unlock vault
if ((_typeOfCursorTarget in DZE_LockableStorage) && {_characterID != "0"} && {player distance _cursorTarget < 3} && {!keypadCancel}) then {
```

Above it paste: 

```ruby
//////////////hotwire
if (_typeOfCursorTarget in DZE_LockableStorage) then {	
	 if (s_player_hotwirevault < 0) then {                 	 
	     s_player_hotwirevault = player addaction [("<t color=""#B40404"">" + ("Hotwire Vault") +"</t>"), "scripts\forcevault.sqf",_cursorTarget, 0, false, true, "", ""];
          };				   
          } else {
           player removeAction s_player_hotwirevault;
           s_player_hotwirevault = -1;
           };	
	if (_typeOfCursorTarget in DZE_UnLockedStorage) then {
	 player removeAction s_player_hotwirevault;
     s_player_hotwirevault = -1;
	};
	//////////////hotwire
  ```
  
  Find:
  ```
  	player removeAction s_player_fuelauto2;
	s_player_fuelauto2 = -1;
	player removeAction s_player_manageDoor;
	s_player_manageDoor = -1;
  ```
  below paste:
  ```ruby
  player removeAction s_player_hotwirevault;
  s_player_hotwirevault = -1;
  ```
   2-In a custom variables.sqf add ```s_player_hotwirevault = -1;``` with the rest of the actions.
   
   3-Drop forcevault.sqf into your scripts\ folder.
